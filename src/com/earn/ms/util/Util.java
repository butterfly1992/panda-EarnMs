package com.earn.ms.util;

 
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

/**
 * 工具类
 * @author Link
 *
 */
public class Util {
	private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	public static Logger log = Logger.getLogger("Utils");
	private static Map<String, Object> search = new HashMap<String, Object>();

////////////////////////////////时间工具类////////////////////////////////
/**
 * 时间 转化long  比较大小
 * @param date
 * @return
 */
	public static long parseDate(String date) {
		try {
			return format.parse(date).getTime();
		} catch (ParseException e) {
			throw new RuntimeException(e.getMessage());
		}
	}
 
public static void main(String[] args) {
	System.out.println(System.currentTimeMillis()/1000);
}
	/**
	 * 获取是对应格式的当天日期
	 * 
	 * @return
	 */
	public static String DateTime(String mate) {
		// yyyy-MM-dd hh:mm:ss
		return new SimpleDateFormat(mate).format(new Date());
	}
	/**
	 * 获取当天日期  yyyy-MM-dd
	 * 
	 */
	public static String DateTime() {
		return format.format(new Date());
	}
	/**
	 * 获取对应格式的昨天日期
	 * 
	 * @param mate
	 * @return
	 */
	public static String getYesterday(String mate) {
		// yyyy-MM-dd hh:mm:ss
		return new SimpleDateFormat(mate).format(new Date(new Date().getTime() - 1000 * 60 * 60 * 24));
	}
	/**
	 * 获取昨天的日期  yyyy-MM-dd
	 * @return
	 */
	public static String getYesterday() {
		return  format.format(new Date(new Date().getTime() - 1000 * 60 * 60 * 24));
	}
	/**
	 * 获取是对应格式的当天上周日期
	 * @return
	 */
	public static String WeekTime() {
		// yyyyMMdd HH:mm:ss
		Date date = new Date();// 取时间
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.add(Calendar.DATE, -7);// 把日期往后增加一天.整数往后推,负数往前移动
		date = calendar.getTime(); // 这个时间就是日期往后推一天的结果
		String dateString = format.format(date);
		return dateString;
	}
////////////////////////////////Dao操作工具类////////////////////////////////
	public static String getOName(Object o) {
		String str = o.getClass().getName();
		return str.substring(str.lastIndexOf(".") + 1);
	}

	public static Map<String, Object> getSearch() {
		return getSearch("Entity");
	}

	public static Map<String, Object> getSearch(String table) {
		search.clear();
		search.put("table", table);
		return search;
	}

	public static Map<String, Object> getSearch(String code, String tablename) {
		Map<String, Object> search = getSearch();
		search.put("code", code);
		search.put("tablename", tablename);
		return search;
	}
////////////////////////////////文件上传工具类////////////////////////////////
	 /**
	  * 
	  * @param savePath 保存路径
	  * @param FileName 文件名
	  * @param srcFile  要保存的文件
	  * @throws IOException
	  */
		public static void fileUpload(String savePath, String FileName, File srcFile) throws IOException {
			File destFile = new File(new File(savePath), FileName);// 根据
			if (!destFile.getParentFile().exists()) {// 判断路径是否存在
				destFile.getParentFile().mkdirs();// 如果不存在，则创建此路径
			}
			// 将文件保存到硬盘上
			FileUtils.copyFile(srcFile, destFile);
		}
////////////////////////////////其他工具类////////////////////////////////
	/**
	 * 获取 流水号
	 * @param tem_name
	 * @return
	 */
	public static String getID(String tem_name) {
		String id = "";
		int nums = 0;
		for (int i = 0; i < tem_name.length(); i++) {
			int num = (int) tem_name.charAt(i);// 返回指定索引处的char值
			nums += num;
		}
		for (int i = 0; i < 4; i++) {
			id = id + new Random().nextInt(9);
		}
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat(
				"yyyyMMddHHmmss");
		String ctime = format.format(new Date());
		id = ctime + nums + id;
		return id;
	}
	
	/**
	 * null检测
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNULL(String str) {
		if (str == null || str.length() <= 0 || str.equals("null")
				|| str.equals("NULL")) {
			return true;
		} else {
			return false;
		}
	}
	/**
	 * 获取 UUID
	 * @return
	 */
	public static String uuID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
}
