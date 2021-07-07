package com.bookshop.dao;

import java.util.List;

import com.bookshop.entity.Order;
import com.bookshop.entity.OrderDetail;
import com.bookshop.entity.Product;
import com.bookshop.entity.User;

public interface OrderDAO {
	Order findById(Integer id);

	List<Order> findAll();

	Order create(Order entity);

	void update(Order entity);

	Order delete(Integer id);

	void create(Order order, List<OrderDetail> details);

	List<Order> findByUser(User user);

	List<Product> findItemsByUser(User user);
}
