using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using TachiShop.Models;

namespace TachiShop.Authentication
{
    public interface IAuthService
    {
        bool IsRememberedLogin();

        Task<User> SignIn(string username, string password, bool rememberMe);

        Task<bool> SignOut();

        List<Claim> GetTokenClaims(string token);
    }
}