package com.danyayun.jpetstore.service;

import com.danyayun.jpetstore.domain.Log;
import com.danyayun.jpetstore.persistence.LogDao;
import com.danyayun.jpetstore.persistence.impl.LogDaoImpl;

public class LogService {

    private LogDao logDao;

    public LogService(){
        this.logDao = new LogDaoImpl();
    }

    public void insertLog(String username, String action, String request){
        if(username == null || username.isEmpty()){
            return;
        }
        logDao.insertLog(username,action);
    }
}
