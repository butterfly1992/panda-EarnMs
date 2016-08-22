package com.earn.ms.action;

import java.io.File;
import java.io.IOException;



import com.earn.ms.po.EntityAds;
import com.earn.ms.po.PageAction;
import com.earn.ms.util.Util;
import com.earn.ms.util.Variable;

/**
 * 实体广告Action
 * 
 * @author lq
 *
 */
public class EntityadsA extends PageAction {

	private static final long serialVersionUID = 1L;
	final String table = "EntityAds";
	private EntityAds ent;
	private File imgurl;
	// 封装上传文件类型的属性
	private String imgurlContentType;
	// 封装上传文件名的属性
	private String imgurlFileName;

	public String entlist() {// 列表显示
		search = Util.getSearch(table);
		if (ent == null) {
			ent = new EntityAds();
			ent.setStatues("default");
		}
		if (!Util.isNULL(ent.getSearch())) {
			search.put("search", ent.getSearch());
		}
		if (!Util.isNULL(ent.getStatues())) {
			search.put("status", ent.getStatues());
		}
		list = service.list(search, pageInfo, "entlist");
		pageInfo.setTotalitems(service.listCount(search, "entlistCount"));
		return "entList";

	}

	public String entquery() {// 查询单款编辑
		search = Util.getSearch(table);
		if (!Util.isNULL(ent.getId())) {
			search.put("id", ent.getId());
		}
		ent = (EntityAds) service.query(search);
		return "entUpd";

	}

	/**
	 * 添加广告
	 * 
	 * @return
	 */
	public String addent() {
		if (ent == null) {
			return "entadd";
		}
		search = Util.getSearch(table);
		ent.setId(Util.uuID());
		ent.setStatues("off");
		Integer index = (Integer) service.query(search, "maxindex") + 1;
		ent.setAdsindex(index);
		if (imgurl != null) {
			String savePath = Variable.entimgpath;
			String suffix = imgurlFileName.substring(imgurlFileName.indexOf("."), imgurlFileName.length());
			String name = "eimg" + index + suffix;
			try {
				Util.fileUpload(savePath, name, imgurl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				addActionError("文件上传失败，请重新添加广告！");
			}
			ent.setImgurl(Variable.netpath + "entimg/" + name);
		} else {
			addActionError("无实体广告图片，请重新添加广告！");
			return "entadd";
		}
		if (service.insert(ent)) {
			return entlist();
		} else {
			addActionError("添加失败，请重新添加广告！");
			return "entadd";
		}
	}

	/**
	 * 更新广告数据
	 * 
	 * @return
	 */
	public String updent() {
		search = Util.getSearch(table);
		if (imgurl != null) {//判断是否更新图片
			String savePath = Variable.entimgpath;
			String suffix = imgurlFileName.substring(imgurlFileName.indexOf("."), imgurlFileName.length());
			String name = "eimg" + ent.getAdsindex() + suffix;
			try {
				Util.fileUpload(savePath, name, imgurl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				addActionError("文件上传失败，请重新添加广告！");
				return "entUpd";
			}
			ent.setImgurl(Variable.netpath + "entimg/" + name);
		} else {
			ent.setImgurl(null);
		}
		if (service.update(ent)) {
			ent.setStatues("default");
			updUnity();//修改临时表 
			return entlist();
		} else {
			addActionError("更新失败，请重新更新广告！");
			return "entUpd";
		}
	}
	/**
	 * 修改临时表数据
	 * @return
	 */
	public boolean updUnity() {
		search = Util.getSearch("Unity");
		search.put("keyname", "offline_ads_time");
		 search.put("createtimestp", System.currentTimeMillis()/1000);
		return service.update(search);
	 
	}
	public EntityAds getEnt() {
		return ent;
	}

	public void setEnt(EntityAds ent) {
		this.ent = ent;
	}

	public File getImgurl() {
		return imgurl;
	}

	public void setImgurl(File imgurl) {
		this.imgurl = imgurl;
	}

	public String getImgurlContentType() {
		return imgurlContentType;
	}

	public void setImgurlContentType(String imgurlContentType) {
		this.imgurlContentType = imgurlContentType;
	}

	public String getImgurlFileName() {
		return imgurlFileName;
	}

	public void setImgurlFileName(String imgurlFileName) {
		this.imgurlFileName = imgurlFileName;
	}

}
