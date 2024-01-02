package com.danyayun.jpetstore.persistence;

import com.danyayun.jpetstore.domain.LineItem;

import java.util.List;

public interface LineItemDao {
    List<LineItem> getLineItemsByOrderId(int orderId);

    void insertLineItem(LineItem lineItem);
}
