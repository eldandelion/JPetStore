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
}