package com.earn.ms.service;

import java.util.List;
import java.util.Map;

import com.earn.ms.util.PageInfo;
/**
 * 服务接口
 * @author Administrator
 *
 */
public interface Service {
	public boolean insert(Object o);

	public boolean insert(Object o, String statement);

	public Object validate(Map<String, Object> search);

	public Object find(Map<String, Object> search);

	public Object query(Map<String, Object> search, String statement);

	public Object query(Object o, String statement);

	public Object query(Map<String, Object> search);

	public List<Object> list(Map<String, Object> search, PageInfo pageInfo);

	public List<Object> list(Map<String, Object> search, PageInfo pageInfo,
			String statement);

	public Integer listCount(Map<String, Object> search);

	public Integer listCount(Map<String, Object> search, String statement);

	public boolean delete(Map<String, Object> search);

	public boolean delete(Map<String, Object> search, String statement);

	public boolean update(String sql, Map<String, Object> search);
	
	public boolean update(Map<String, Object> search, String statement);

	public boolean update(Object o);
	
	public boolean update(Map<String, Object> search);

	public boolean update(Object o, String statement);
}
