package com.bookshop.dao;

import java.util.List;

import com.bookshop.entity.User;

public interface UserDAO {
	User findByUsername(String username);

	List<User> findAll();

	User create(User entity);

	void update(User entity);

	User delete(String username);

	long getPageCount(int pageSize);

	List<User> getPage(int pageNo, int pageSize);

}
