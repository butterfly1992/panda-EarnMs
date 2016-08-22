package com.earn.ms.action;

import java.io.File;
import java.io.IOException;

import com.earn.ms.po.Article;
import com.earn.ms.po.PageAction;
import com.earn.ms.util.Util;
import com.earn.ms.util.Variable;

/**
 * 分享文章 Action
 * 
 * @author Link
 *
 */
public class ArticleA extends PageAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Article art;
	final String table = "Article";
	private File[] fileimg;
	private String[] fileimgFileName;

	// 文章列表
	public String list() {
		search = Util.getSearch(table);
		if (art == null) {
			art = new Article();
			art.setStatues("default");
		}
		if (!Util.isNULL(art.getSearch())) {
			search.put("search", art.getSearch());
		}
		if (!Util.isNULL(art.getStatues())) {
			search.put("statues", art.getStatues());
		}
		list = service.list(search, pageInfo);
		pageInfo.setTotalitems(service.listCount(search));
		return "list";
	}

	// 增加文章
	public String add() {
		search = Util.getSearch(table);
		if (art == null) {
			addActionError("信息为空！请重新操作！");
			return "add";
		}
		int index = service.listCount(search, "maxIndex") + 1;
		art.setId(Util.uuID());
		art.setStatues("off");
		art.setAdsindex(index);
		if (fileimg != null) {
			if (fileimg.length > 0) {
				for (int i = 0; i < fileimg.length; i++) {
					String end = fileimgFileName[i]
							.substring(fileimgFileName[i].lastIndexOf("."));
					try {
						Util.fileUpload(Variable.shareimgpath, "img" + index
								+ "0" + (i + 1) + end, fileimg[i]);
					} catch (IOException e) {
						addActionError("图片上传错误！请重新操作！");
						return "add";
					}
					if (!Util.isNULL(art.getShareimg())) {
						art.setShareimg(art.getShareimg() + ";"
								+ Variable.netpath + "shareimg/img" + index
								+ "0" + (i + 1) + end);
					} else {
						art.setShareimg(Variable.netpath + "shareimg/img"
								+ index + "0" + (i + 1) + end);
					}
				}
			}
		}
		if (!service.insert(art)) {
			addActionError("数据插入错误！请重新操作！");
			return "add";
		}
		art = null;
		return list();
	}

	// 修改文章
	public String update() {
		search = Util.getSearch(table);
		if (art == null) {
			addActionError("信息为空！请重新操作！");
			return "update";
		}
		if (Util.isNULL(art.getId())) {
			addActionError("ID为空！请重新操作！");
			return "update";
		}
		if (art.getAdsindex() <= 0) {
			addActionError("索引为空！请重新操作！");
			return "update";
		}
		int index = art.getAdsindex();
		if (fileimg != null) {
			if (fileimg.length > 0) {
				for (int i = 0; i < fileimg.length; i++) {
					String end = fileimgFileName[i]
							.substring(fileimgFileName[i].lastIndexOf("."));
					try {
						Util.fileUpload(Variable.shareimgpath, "img" + index
								+ "0" + (i + 1) + end, fileimg[i]);
					} catch (IOException e) {
						addActionError("图片上传错误！请重新操作！");
						return "update";
					}
					if (!Util.isNULL(art.getShareimg())) {
						art.setShareimg(art.getShareimg() + ";"
								+ Variable.netpath + "shareimg/img" + index
								+ "0" + (i + 1) + end);
					} else {
						art.setShareimg(Variable.netpath + "shareimg/img"
								+ index + "0" + (i + 1) + end);
					}
				}
			}
		}

		if (!service.update(art)) {
			addActionError("数据插入错误！请重新操作！");
			return "update";
		}
		art = null;
		return list();
	}

	// 根据ID查询文章列表
	public String query() {
		search = Util.getSearch(table);
		if (art == null) {
			return list();
		}
		if (Util.isNULL(art.getId())) {
			return list();
		}
		search.put("id", art.getId());
		art = (Article) service.query(search);
		return "update";
	}

	public File[] getFileimg() {
		return fileimg;
	}

	public void setFileimg(File[] fileimg) {
		this.fileimg = fileimg;
	}

	public String[] getFileimgFileName() {
		return fileimgFileName;
	}

	public void setFileimgFileName(String[] fileimgFileName) {
		this.fileimgFileName = fileimgFileName;
	}

	public Article getArt() {
		return art;
	}

	public void setArt(Article art) {
		this.art = art;
	}

}
