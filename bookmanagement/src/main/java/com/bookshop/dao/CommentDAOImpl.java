package com.bookshop.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.entity.Comment;
@Transactional
@Repository
public class CommentDAOImpl implements CommentDAO {		@Autowired
SessionFactory factory;


	@Override
	public Comment create(Comment comment) {Session session=factory.getCurrentSession();
	session.save(comment);
		// TODO Auto-generated method stub
		return null;
	}

}
