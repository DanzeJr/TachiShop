using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using Microsoft.EntityFrameworkCore;
using TachiShop.Models;
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class UserListViewModel : ViewModelBase
    {
        private readonly AppDbContext _dbContext;

        private List<User> users;
        public List<User> Users
        {
            get => users;
            set => Set(ref users, value);
        }

        public RelayCommand LoadedCommand { get; }

        private RelayCommand<Guid> viewDetailsCommand;
        public RelayCommand<Guid> ViewDetailsCommand
        {
            get => viewDetailsCommand;
            set => Set(ref viewDetailsCommand, value);
        }

        private RelayCommand<Guid> viewEditCommand;
        public RelayCommand<Guid> ViewEditCommand
        {
            get => viewEditCommand;
            set => Set(ref viewEditCommand, value);
        }

        private RelayCommand viewAddCommand;
        public RelayCommand ViewAddCommand
        {
            get => viewAddCommand;
            set => Set(ref viewAddCommand, value);
        }

        public UserListViewModel(AppDbContext dbContext)
        {
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
        }

        private async Task OnLoaded()
        {
            Users = await _dbContext.User.OrderBy(x => x.FullName).ToListAsync();
        }
    }
}