package com.earn.ms.action;

import java.io.File;
import java.io.IOException;

import com.earn.ms.po.BoutiqueAds;
import com.earn.ms.po.PageAction;
import com.earn.ms.util.Util;
import com.earn.ms.util.Variable;
import com.zy.apk.main.GetInfo;
import com.zy.apk.po.Apk;

/**
 * 精品广告 Action
 * 
 * @author Link
 *
 */
public class BoutiA extends PageAction {

	private static final long serialVersionUID = 1L;
	final String table = "BoutiqueAds";
	private BoutiqueAds bou;
	private File fileimg;
	private File filelogo;
	private File fileapk;
	private String filelogoFileName;
	private String fileapkFileName;
	private String fileimgFileName;

	/**
	 * 增加精品广告
	 * 
	 * @return
	 */
	public String add() {
		search = Util.getSearch(table);
		if (bou == null) {
			bou = new BoutiqueAds();
		}
		int index = service.listCount(search, "maxIndex") + 1;

		bou.setId(Util.uuID());
		bou.setAdsindex(index);
		bou.setStatues("off");

		if (!"ios".equals(bou.getDevicetype()) && !Util.isNULL(bou.getOrdertype())) {
			String end = bou.getOrdertype().substring(bou.getOrdertype().lastIndexOf("."));
			try {
				Util.fileUpload(Variable.jpapkpath, "down" + index + end, new File(bou.getOrdertype()));
			} catch (IOException e) {
				addActionError("APK上传错误！请重新操作！");
				return "add";
			}
			bou.setJumpurl(Variable.netpath + "jpapk/down" + index + end);
		}

		if (filelogo != null) {
			String end = filelogoFileName.substring(filelogoFileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.jpiconpath, "icon" + index + end, filelogo);
			} catch (IOException e) {
				addActionError("LOGO上传错误！请重新操作！");
				return "add";
			}
			bou.setIcon(Variable.netpath + "jplogo/icon" + index + end);
		}
		if (fileimg != null) {
			String end = fileimgFileName.substring(fileimgFileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.jpimgpath, "img" + index + end, fileimg);
			} catch (IOException e) {
				addActionError("截图上传错误！请重新操作！");
				return "add";
			}
			bou.setImgurl(Variable.netpath + "jpsimg/img" + index + end);
		}

		if (!service.insert(bou)) {
			addActionError("数据插入错误！请重新操作！");
			return "add";
		}
		bou = null;
		return list();
	}

	// 根据 ID 查询
	public String query() {
		search = Util.getSearch(table);
		if (bou == null) {
			bou = new BoutiqueAds();
		}
		if (Util.isNULL(bou.getId())) {
			return list();
		}
		search.put("id", bou.getId());
		bou = (BoutiqueAds) service.query(search);
		return "update";
	}

	// 查询列表
	public String list() {
		search = Util.getSearch(table);
		if (bou == null) {
			bou = new BoutiqueAds();
			bou.setStatues("default");
			bou.setDevicetype("default");
		}
		if (!Util.isNULL(bou.getSearch())) {
			search.put("search", bou.getSearch());
		}
		if (!Util.isNULL(bou.getStatues())) {
			search.put("statues", bou.getStatues());
		}
		if (!Util.isNULL(bou.getDevicetype())) {
			search.put("type", bou.getDevicetype());
		}
		list = service.list(search, pageInfo);
		pageInfo.setTotalitems(service.listCount(search));
		return "list";
	}

	/**
	 * 上传APK
	 * 
	 * @return
	 * @throws IOException
	 */
	public String upload() {
		search = Util.getSearch(table);
		if (bou == null) {
			return "upload";
		}
		if ("ios".equals(bou.getDevicetype())) {
			return "add";
		} else if (fileapk == null) {
			return "upload";
		}
		String apkPath = Variable.temppath;
		try {
			Util.fileUpload(apkPath, fileapkFileName, fileapk);
		} catch (IOException e) {
			addActionError("上传APK发生异常！请重新上传！");
			return "upload";
		}
		Apk apks = GetInfo.getApk(apkPath + fileapkFileName);
		if (apks != null) {
			bou.setPackagename(apks.getPackageName());
			bou.setOrdertype(apkPath + fileapkFileName);
		} else {
			addActionError("不是正确的APK文件！请重新上传！");
			return "upload";
		}
		return "add";
	}

	/**
	 * 修改精品广告
	 * 
	 * @return
	 */
	public String update() {
		search = Util.getSearch(table);
		if (bou == null) {
			addActionError("信息为空！请重新操作！");
			return "update";
		}
		if (Util.isNULL(bou.getId())) {
			addActionError("ID为空！请重新操作！");
			return "update";
		}
		if (Util.isNULL(bou.getAdsindex() + "")) {
			addActionError("索引为空！请重新操作！");
			return "update";
		}
		int index = bou.getAdsindex();

		if (fileapk != null) {
			String end = fileapkFileName.substring(fileapkFileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.jpapkpath, "down" + index + end, new File(bou.getOrdertype()));
			} catch (IOException e) {
				addActionError("APK上传失败！请重新操作！");
				return "update";
			}
		}

		if (filelogo != null) {
			String end = filelogoFileName.substring(filelogoFileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.jpiconpath, "icon" + index + end, filelogo);
			} catch (IOException e) {
				addActionError("LOGO上传失败！请重新操作！");
				return "update";
			}
			bou.setIcon(Variable.netpath + "jplogo/icon" + index + end);
		}
		if (fileimg != null) {
			String end = fileimgFileName.substring(fileimgFileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.jpimgpath, "img" + index + end, fileimg);
			} catch (IOException e) {
				addActionError("截图上传失败！请重新操作！");
				return "update";
			}
			bou.setImgurl(Variable.netpath + "jpsimg/img" + index + end);
		}

		if (!service.update(bou)) {
			addActionError("修改失败！请重新操作！");
			return "update";
		}
		// 修改 UNITY 临时数据表
		if ("ios".equals(bou.getDevicetype())) {
			updUnity(1);
		} else if ("android".equals(bou.getDevicetype())) {
			updUnity(2);
		} else {
			addActionError("临时表修改失败！请重新操作！");
			return "update";
		}
		bou = null;
		return list();
	}

	/**
	 * 修改临时表数据
	 * 
	 * @param type
	 *            1.ios 2.android
	 * @return
	 */
	public boolean updUnity(int type) {
		search = Util.getSearch("Unity");
		if (type == 1) {
			search.put("keyname", "boutique_ads_time_ios");
		}
		if (type == 2) {
			search.put("keyname", "Boutique_ads_time_android");
		}
		search.put("createtimestp", System.currentTimeMillis() / 1000);
		return service.update(search);

	}

	public BoutiqueAds getBou() {
		return bou;
	}

	public void setBou(BoutiqueAds bou) {
		this.bou = bou;
	}

	public File getFileimg() {
		return fileimg;
	}

	public void setFileimg(File fileimg) {
		this.fileimg = fileimg;
	}

	public File getFileapk() {
		return fileapk;
	}

	public void setFileapk(File fileapk) {
		this.fileapk = fileapk;
	}

	public String getFileapkFileName() {
		return fileapkFileName;
	}

	public void setFileapkFileName(String fileapkFileName) {
		this.fileapkFileName = fileapkFileName;
	}

	public String getFileimgFileName() {
		return fileimgFileName;
	}

	public void setFileimgFileName(String fileimgFileName) {
		this.fileimgFileName = fileimgFileName;
	}

	public File getFilelogo() {
		return filelogo;
	}

	public void setFilelogo(File filelogo) {
		this.filelogo = filelogo;
	}

	public String getFilelogoFileName() {
		return filelogoFileName;
	}

	public void setFilelogoFileName(String filelogoFileName) {
		this.filelogoFileName = filelogoFileName;
	}

}
