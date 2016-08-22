package com.earn.ms.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.earn.ms.dao.Dao;
import com.earn.ms.util.PageInfo;
import com.earn.ms.util.Util;

/**
 * Dao实现类
 * @author Administrator
 *
 */
public class DaoImpl extends SqlMapClientDaoSupport implements Dao {
	@Override
	public Object find(Map<String, Object> search) {
		return this.getSqlMapClientTemplate().queryForObject(
				search.get("table") + ".find", search);
	}

	@Override
	public Object validate(Map<String, Object> search) {
		return this.getSqlMapClientTemplate().queryForObject(
				search.get("table") + ".validate", search);
	}

	@Override
	public boolean insert(Object o) {
		this.getSqlMapClientTemplate().insert(Util.getOName(o) + ".insert", o);
		return true;
	}

	@Override
	public boolean update(Object o) {
		int l = this.getSqlMapClientTemplate().update(
				Util.getOName(o) + ".update", o);
		if (l > 0)
			return true;
		return false;
	}


	@Override
	public Object query(Object o, String statement) {
		return getSqlMapClientTemplate().queryForObject(
				Util.getOName(o) + "." + statement, o);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> list(Map<String, Object> search, PageInfo pageInfo) {
		if (pageInfo == null) {
			List<Object> list = getSqlMapClientTemplate().queryForList(
					search.get("table") + ".list", search);
			return list;
		} else {
			List<Object> list = getSqlMapClientTemplate().queryForList(
					search.get("table") + ".list", search,
					(pageInfo.getCurrentPage() - 1) * pageInfo.getPageSize(),
					pageInfo.getPageSize());
			return list;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> list(Map<String, Object> search, PageInfo pageInfo,
			String statement) {
		if (pageInfo == null) {
			List<Object> list = getSqlMapClientTemplate().queryForList(
					search.get("table") + "." + statement, search);
			return list;
		} else {
			List<Object> list = getSqlMapClientTemplate().queryForList(
					search.get("table") + "." + statement, search,
					(pageInfo.getCurrentPage() - 1) * pageInfo.getPageSize(),
					pageInfo.getPageSize());
			return list;
		}
	}

	@Override
	public Integer listCount(Map<String, Object> search) {
		Integer len = (Integer) getSqlMapClientTemplate().queryForObject(
				search.get("table") + ".listCount", search);
		return len;
	}

	@Override
	public Integer listCount(Map<String, Object> search, String statement) {
		Integer len = (Integer) getSqlMapClientTemplate().queryForObject(
				search.get("table") + "." + statement, search);
		return len;
	}

	@Override
	public boolean delete(Map<String, Object> search) {
		int l = getSqlMapClientTemplate().delete(search.get("table") + ".delete", search);
		if (l > 0){
			return true;
		}else{
		return false;
	}
	}

	@Override
	public boolean delete(Map<String, Object> search, String statement) {
		int l = getSqlMapClientTemplate().delete(search.get("table") + "."+statement, search);
		if (l > 0){
			return true;
		}else{
		return false;
	}
	}
	@Override
	public Object query(Map<String, Object> search) {
		return this.getSqlMapClientTemplate().queryForObject(
				search.get("table") + ".query", search);
	}

	@Override
	public boolean update(Object o, String statement) {
		Object l = this.getSqlMapClientTemplate().update(
				Util.getOName(o) + "." + statement, o);
		if (l != null)
			return true;
		return false;
	}

	@Override
	public boolean update(String sql, Map<String, Object> search) {
		// TODO Auto-generated method stub
		Object l = this.getSqlMapClientTemplate().update(
				search.get("table") + "." + search.get("key"),sql);
		if (l != null)
			return true;
		return false;
	}
	@Override
	public boolean update(Map<String, Object> search,String statement) {
		// TODO Auto-generated method stub
		Object l = this.getSqlMapClientTemplate().update(
				search.get("table") + "." + statement,search);
		if (l != null)
			return true;
		return false;
	}

	@Override
	public boolean insert(Object o, String statement) {
		this.getSqlMapClientTemplate().insert(Util.getOName(o) + ".statement", o);
		return true;
	}

	@Override
	public Object query(Map<String, Object> search, String statement) {
		return this.getSqlMapClientTemplate().queryForObject(
				search.get("table") + "."+statement, search);
	}

	@Override
	public boolean update(Map<String, Object> search) {
		Object l = this.getSqlMapClientTemplate().update(
				search.get("table") + ".update", search);
		if (l != null)
			return true;
		return false;
	}


}
