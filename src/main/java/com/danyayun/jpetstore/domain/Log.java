package com.danyayun.jpetstore.domain;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Log {
    private String username;

    private String logtime;

    private String action;

    public void setUsername(String username) {
        this.username = username;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public void setLogtime(String logtime) {
        this.logtime = logtime;
    }

    public String getUsername() {
        return username;
    }

    public String getAction() {
        return action;
    }

    public String getLogtime() {
        return logtime;
    }
}
