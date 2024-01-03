package com.danyayun.jpetstore.persistence.impl;
import com.danyayun.jpetstore.domain.Sequence;
import com.danyayun.jpetstore.persistence.DBUtil;
import com.danyayun.jpetstore.persistence.SequenceDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SequenceDaoImpl implements SequenceDao {
    private static final String UPDATESEQUENCE = "UPDATE SEQUENCE SET NEXTID = ? WHERE NAME = ?";
    private static final String GETSEQUENCE = "SELECT NAME, NEXTID FROM SEQUENCE WHERE NAME = ?";

    @Override
    public Sequence getSequence(Sequence sequence) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GETSEQUENCE);
            preparedStatement.setString(1,sequence.getName());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                sequence.setName(resultSet.getString(1));
                sequence.setNextId(resultSet.getInt(2));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return sequence;
    }

    @Override
    public void updateSequence(Sequence sequence) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATESEQUENCE);
            preparedStatement.setInt(1,sequence.getNextId());
            preparedStatement.setString(2,sequence.getName());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
