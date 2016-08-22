package com.earn.ms.service.impl;

import java.util.List;
import java.util.Map;

import com.earn.ms.dao.Dao;
import com.earn.ms.service.Service;
import com.earn.ms.util.PageInfo;

/**
 * 服务接口实现类
 * @author Administrator
 *
 */
public class ServiceImpl implements Service {
	Dao dao;

	@Override
	public boolean insert(Object o) {
		return dao.insert(o);
	}

	@Override
	public Object validate(Map<String, Object> search) {
		return dao.validate(search);
	}

	@Override
	public Object find(Map<String, Object> search) {
		return dao.find(search);
	}

	@Override
	public boolean update(Object o) {

		return dao.update(o);
	}



	@Override
	public java.util.List<Object> list(Map<String, Object> search,
			PageInfo pageInfo) {
		return dao.list(search, pageInfo);
	}

	@Override
	public List<Object> list(Map<String, Object> search, PageInfo pageInfo,
			String statement) {
		return dao.list(search, pageInfo, statement);
	}

	@Override
	public Integer listCount(Map<String, Object> search) {
		return dao.listCount(search);
	}

	@Override
	public Integer listCount(Map<String, Object> search, String statement) {
		return dao.listCount(search, statement);
	}

	@Override
	public boolean delete(Map<String, Object> search) {
		return dao.delete(search);
	}

	@Override
	public Object query(Map<String, Object> search) {
		return dao.query(search);
	}

	@Override
	public Object query(Object o, String statement) {
		return dao.query(o, statement);
	}

	@Override
	public boolean update(Object o, String statement) {
		// TODO Auto-generated method stub
		return dao.update(o, statement);
	}

	@Override
	public boolean update(String sql, Map<String, Object> search) {
		// TODO Auto-generated method stub
		return dao.update(sql, search);
	}
	@Override
	public boolean update(Map<String, Object> search, String statement) {
		// TODO Auto-generated method stub
		return dao.update(search, statement);
	}


	public Dao getDao() {
		return dao;
	}

	public void setDao(Dao dao) {
		this.dao = dao;
	}

	@Override
	public boolean insert(Object o, String statement) {
		return dao.insert(o, statement);
	}

	@Override
	public boolean delete(Map<String, Object> search, String statement) {
		// TODO Auto-generated method stub
		return dao.delete(search, statement);
	}

	@Override
	public Object query(Map<String, Object> search, String statement) {
		// TODO Auto-generated method stub
		return dao.query(search, statement);
	}

	@Override
	public boolean update(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return dao.update(search);
	}


}
