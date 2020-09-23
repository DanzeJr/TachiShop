using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using TachiShop.Models;
using TachiShop.Repositories;

namespace TachiShop.Authentication
{
    public class JwtService : IAuthService
    {
        #region Members

        /// <summary>
        /// The secret key we use to encrypt out token with.
        /// </summary>
        private const string SecretKey = "1M50rRyD011TL3aV3m31wA11ty0U1-13r3W1T1-1M3";

        private readonly ILogger<JwtService> _logger;
        private readonly AppDbContext _dbContext;

        #endregion

        public JwtService(ILogger<JwtService> logger, AppDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
        }

        #region Public Methods

        public bool IsRememberedLogin()
        {
            try
            {
                var tokenPath = Path.Combine(Directory.GetCurrentDirectory(), "credential.json");
                if (File.Exists(tokenPath))
                {
                    var claimsPrincipal = ValidateToken(File.ReadAllText(tokenPath, Encoding.UTF8));
                    if (claimsPrincipal != null)
                    {
                        var id = Guid.Parse(claimsPrincipal.FindFirst(ClaimTypes.NameIdentifier).Value);
                        var user = _dbContext.User.Find(id);
                        if (user != null)
                        {
                            user.Password = null;
                            App.Current.Properties["USER"] = user;
                            return true;
                        }
                    }

                    File.Delete(tokenPath);
                    return false;
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }

            return false;
        }

        public async Task<User> SignIn(string username, string password, bool rememberMe)
        {
            try
            {
                var tokenPath = Path.Combine(Directory.GetCurrentDirectory(), "credential.json");
                var user = _dbContext.User.FirstOrDefault(x => x.UserName == username);
                if (user != null && BCrypt.Net.BCrypt.EnhancedVerify(password, user.Password))
                {
                    if (rememberMe)
                    {
                        var token = GenerateToken(user);
                        await File.WriteAllTextAsync(tokenPath, token, Encoding.UTF8);
                    }
                    user.Password = null;
                    App.Current.Properties["USER"] = user;
                    return user;
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }

            return null;
        }

        public async Task<bool> SignOut()
        {
            try
            {
                App.Current.Properties["USER"] = null;
                var tokenPath = Path.Combine(Directory.GetCurrentDirectory(), "credential.json");
                if (File.Exists(tokenPath))
                {
                    File.Delete(tokenPath);
                    return true;
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }

            return await Task.FromResult(false);
        }

        /// <summary>
        /// Receives the claims of token by given token as string.
        /// </summary>
        /// <remarks>
        /// Pay attention, one the token is FAKE the method will throw an exception.
        /// </remarks>
        /// <param name="token"></param>
        /// <returns>IEnumerable of claims for the given token.</returns>
        public List<Claim> GetTokenClaims(string token)
        {
            if (string.IsNullOrEmpty(token))
                throw new ArgumentException("Given token is null or empty.");

            TokenValidationParameters tokenValidationParameters = GetTokenValidationParameters();

            JwtSecurityTokenHandler jwtSecurityTokenHandler = new JwtSecurityTokenHandler();
            try
            {
                ClaimsPrincipal tokenValid = jwtSecurityTokenHandler.ValidateToken(token, tokenValidationParameters, out _);
                return tokenValid.Claims.ToList();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);
            }

            return null;
        }
        #endregion

        #region Private Methods

        /// <summary>
        /// Validates whether a given token is valid or not, and returns true in case the token is valid otherwise it will return false;
        /// </summary>
        /// <param name="token">Token</param>
        /// <returns></returns>
        public ClaimsPrincipal ValidateToken(string token)
        {
            if (string.IsNullOrEmpty(token))
                throw new ArgumentException("Given token is null or empty.");

            TokenValidationParameters tokenValidationParameters = GetTokenValidationParameters();

            JwtSecurityTokenHandler jwtSecurityTokenHandler = new JwtSecurityTokenHandler();
            try
            {
                return jwtSecurityTokenHandler.ValidateToken(token, tokenValidationParameters, out _);
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Generates token by given user.
        /// Validates whether the given user is valid, then gets the symmetric key.
        /// Encrypt the token and returns it.
        /// </summary>
        /// <param name="user">User</param>
        /// <returns>Generated token.</returns>
        public string GenerateToken(User user)
        {
            if (user == null)
                throw new ArgumentException("Arguments to create token are not valid.");

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                new Claim(ClaimTypes.Name, user.UserName),
                new Claim(ClaimTypes.GivenName, user.FullName)
            };

            SecurityTokenDescriptor securityTokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.Now.AddMonths(3),
                SigningCredentials = new SigningCredentials(GetSymmetricSecurityKey(), SecurityAlgorithms.HmacSha256)
            };

            JwtSecurityTokenHandler jwtSecurityTokenHandler = new JwtSecurityTokenHandler();
            SecurityToken securityToken = jwtSecurityTokenHandler.CreateToken(securityTokenDescriptor);
            string token = jwtSecurityTokenHandler.WriteToken(securityToken);

            return token;
        }

        private SecurityKey GetSymmetricSecurityKey()
        {
            byte[] symmetricKey = Encoding.UTF8.GetBytes(SecretKey);
            return new SymmetricSecurityKey(symmetricKey);
        }

        private TokenValidationParameters GetTokenValidationParameters()
        {
            return new TokenValidationParameters()
            {
                ValidateIssuer = false,
                ValidateAudience = false,
                IssuerSigningKey = GetSymmetricSecurityKey()
            };
        }
        #endregion
    }
}