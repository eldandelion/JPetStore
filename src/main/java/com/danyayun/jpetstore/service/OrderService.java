package com.danyayun.jpetstore.service;

import com.danyayun.jpetstore.domain.Order;
import com.danyayun.jpetstore.persistence.ItemDao;
import com.danyayun.jpetstore.persistence.OrderDao;
import com.danyayun.jpetstore.persistence.impl.ItemDaoImpl;
import com.danyayun.jpetstore.persistence.impl.OrderDaoImpl;

import javax.sound.midi.Sequence;
import java.util.List;

public class OrderService {
    private ItemDao itemDao;
    private OrderDao orderDao;
    //private SequenceDao sequenceDao;

    public OrderService(){
        itemDao = new ItemDaoImpl();
        orderDao = new OrderDaoImpl();
        //sequenceDao = new SequenceDaoImpl();
    }

    /*public int getNextId(String name){
        Sequence sequence = new Sequence(name,-1);
        sequence = sequenceDao.getSequence(sequence);
        if(sequence == null){
            throw new RuntimeException("Error: A null sequence was returned from the database (could not get next  " + name +
                    " sequence).");
        }
        Sequence parameterObject = new Sequence(name,sequence.getNextId()+1);
        sequenceDao.updateSequence(parameterObject);
        return sequence.getNextId();
    }*/

    public void insertOrder(Order order) {
        //order.setOrderId(getNextId("ordernum"));
        orderDao.insertOrder(order);
        orderDao.insertOrderStatus(order);
    }

    public Order getOrder(int orderId){
        Order order = orderDao.getOrder(orderId);
        return order;
    }

    public List<Order> getOrdersByUsername(String username){
        return orderDao.getOrdersByUsername(username);
    }
}
