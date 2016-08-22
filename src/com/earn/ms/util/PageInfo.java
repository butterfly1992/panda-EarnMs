package com.earn.ms.util;
/**
 * 分页处理、显示  类
 * @author Link
 *
 */
public class PageInfo {
	private int pageSize =10;
	private int currentPage = 1;
	private int totalPage = 0;
	private int totalitems = 0;

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalitems() {
		return totalitems;
	}

	public void setTotalitems(int totalitems) {
		this.totalitems = totalitems;
		if (pageSize != 0)
			totalPage = (totalitems + pageSize - 1) / pageSize;
		else
			totalPage = 0;
	}

	public String getPageFooter() {
		StringBuffer sb = new StringBuffer();
		//int pages=totalPage>=5?5:totalPage;
		int pages =((currentPage-1)/5)*5+5>totalPage?totalPage:((currentPage-1)/5)*5+5;
		sb.append("<a onclick=\"downclick(" +1+ ")\">首页</a>");
		if (totalPage> 1 && currentPage>1) {
			sb.append("<a onclick=\"downclick(" + (currentPage - 1)
					+ ")\">上一页</a>");
		}else{
			sb.append("<a>上一页</a>");
		}
		for (int i = ((currentPage-1)/5)*5+1; i <= pages; i++) {
			sb.append("<a");
			if (i == currentPage) {
				sb.append(" style='color:red;' ");
			}
			sb.append(" onclick=\"downclick(" + i + ")\">" + i + "</a>");
		}
		if (totalPage> 1 && currentPage<totalPage) {
			sb.append("<a onclick=\"downclick(" + (currentPage + 1)
					+ ")\">下一页</a>");
		}else{
			sb.append("<a>下一页</a>");
		}
		String pageFooter = "<div class=\"inline pull-right page\">"
				+ totalitems
				+ " 条记录 &nbsp;当前"
				+ currentPage
				+ "页/总共"
				+ totalPage
				+ " 页<input type=\"hidden\" name=\"pageInfo.currentPage\" id=\"curpage\" value="
				+ currentPage + "> <span>"
				+ sb.toString() + "</span><a onclick=\"downclick(" + totalPage
				+ ")\">末页</a></div>";
		return pageFooter;
	}
}
