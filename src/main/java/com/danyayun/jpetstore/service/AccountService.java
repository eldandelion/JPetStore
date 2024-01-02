package com.danyayun.jpetstore.service;

import com.danyayun.jpetstore.domain.Account;
import com.danyayun.jpetstore.persistence.AccountDao;
import com.danyayun.jpetstore.persistence.impl.AccountDaoImpl;

public class AccountService {
    private AccountDao accountDao;

    public AccountService(){
        this.accountDao = new AccountDaoImpl();
    }

    public Account getAccount(String username, String password) {
        Account account = new Account();
        account.setUsername(username);
        account.setPassword(password);
        return accountDao.getAccountByUsernameAndPassword(account);
    }


    /*public Account getAccount(String username) {
        return accountDao.getAccountByUsername(username);
    }*/



    public void insertAccount(Account account) {
        accountDao.insertAccount(account);
        accountDao.insertProfile(account);
        accountDao.insertSignon(account);
    }

    public void updateAccount(Account account) {
        accountDao.updateAccount(account);
        accountDao.updateProfile(account);

        if (account.getPassword() != null && !account.getPassword().isEmpty()) {
            accountDao.updateSignon(account);
        }
    }
}