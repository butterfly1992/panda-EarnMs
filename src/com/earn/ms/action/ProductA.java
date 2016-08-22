package com.earn.ms.action;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;

import com.earn.ms.po.ProductAds;
import com.earn.ms.po.Mission;
import com.earn.ms.po.PageAction;
import com.earn.ms.util.Util;
import com.earn.ms.util.Variable;
import com.zy.apk.main.GetInfo;
import com.zy.apk.po.Apk;

/**
 * 产品Action
 * 
 * @author Administrator
 *
 */
public class ProductA extends PageAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	final String table = "ProductAds";
	private ProductAds ad;
	private Mission mis;
	private int oldPri;
	private File fileapk;
	private String fileapkFileName;

	private File filelogo;
	private String filelogoFileName;

	private File fileimg;
	private String fileimgFileName;

	private File fileimg1;
	private String fileimg1FileName;

	// 产品列表
	public String list() {
		search = Util.getSearch(table);
		if (ad == null) {
			ad = new ProductAds();
			ad.setProtype("default");
			ad.setProstatues("default");
		}
		if (!Util.isNULL(ad.getSearch())) {
			search.put("search", ad.getSearch());
		}
		if (!Util.isNULL(ad.getProtype())) {
			search.put("type", ad.getProtype());
		}
		if (!Util.isNULL(ad.getProstatues())) {
			search.put("status", ad.getProstatues());
		}

		list = service.list(search, pageInfo, "prolist");
		pageInfo.setTotalitems(service.listCount(search, "prolistCount"));
		return "list";

	}

	// 增加任务时 产品列表
	public String dialog() {
		search = Util.getSearch(table);
		if (ad == null) {
			ad = new ProductAds();
		}

		search.put("type", "default");
		search.put("status", "default");

		if (!Util.isNULL(ad.getSearch())) {
			search.put("search", ad.getSearch());
		}

		list = service.list(search, pageInfo, "prolist");
		pageInfo.setTotalitems(service.listCount(search, "prolistCount"));
		return "dialog";

	}

	/**
	 * 上传APK
	 * 
	 * @return
	 * @throws IOException
	 */
	public String upload() {
		search = Util.getSearch(table);
		if (ad == null) {
			return "proUpload";
		}
		if ("ios".equals(ad.getProtype())) {
			return "add";
		} else if (fileapk == null) {
			return "proUpload";
		}
		String apkPath = Variable.temppath;
		try {
			Util.fileUpload(apkPath, fileapkFileName, fileapk);
		} catch (IOException e) {
			e.printStackTrace();
		}
		Apk apks = GetInfo.getApk(apkPath + fileapkFileName);
		if (apks != null) {
			ad.setProsize(BigDecimal.valueOf(apks.getSize()));
			ad.setPackagename(apks.getPackageName());
			ad.setOrdertype(apkPath + fileapkFileName);
		} else {
			return "proUpload";
		}
		return "add";
	}

	/**
	 * 增加产品
	 * 
	 * @return
	 */
	public String add() {
		search = Util.getSearch(table);
		if (ad == null) {
			ad = new ProductAds();
		}
		int index = service.listCount(search, "maxIndex") + 1;

		ad.setId(Util.uuID());
		ad.setProindex(index);
		ad.setPropri(1000);
		ad.setProstatues("off");

		if (!"ios".equals(ad.getProtype()) && !Util.isNULL(ad.getOrdertype())) {
			String end = ad.getOrdertype().substring(ad.getOrdertype().lastIndexOf("."));
			try {
				Util.fileUpload(Variable.apkpath, "soft" + index + end, new File(ad.getOrdertype()));
			} catch (IOException e) {
				addActionError("APK上传错误！请重新操作！");
				return "add";
			}
			ad.setJumpurl(Variable.netpath + "proapk/soft" + index + end);
		}

		if (filelogo != null) {
			String end = filelogoFileName.substring(filelogoFileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.iconpath, "icon" + index + end, filelogo);
			} catch (IOException e) {
				addActionError("LOGO上传错误！请重新操作！");
				return "add";
			}
			ad.setProicon(Variable.netpath + "prologo/icon" + index + end);
		}
		if (fileimg != null) {
			String end = fileimgFileName.substring(fileimgFileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.imgpath, "simg" + index + "01" + end, fileimg);
			} catch (IOException e) {
				addActionError("截图上传错误！请重新操作！");
				return "add";
			}
			ad.setScreenshot(Variable.netpath + "prosimg/simg" + index + "01" + end);
		}
		if (fileimg1 != null) {
			String end = fileimg1FileName.substring(fileimg1FileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.imgpath, "simg" + index + "02" + end, fileimg1);
			} catch (IOException e) {
				addActionError("截图上传错误！请重新操作！");
				return "add";
			}
			ad.setScreenshot(ad.getScreenshot() + ";" + Variable.netpath + "prosimg/simg" + index + "02" + end);
		}

		if (!service.insert(ad)) {
			addActionError("产品增加错误！请重新操作！");
			return "add";
		}
		return list();
	}

	/**
	 * 查询单款产品
	 * 
	 * @return
	 */
	public String query() {
		search = Util.getSearch(table);
		if (ad == null) {
			ad = new ProductAds();
		}
		if (Util.isNULL(ad.getId())) {
			return list();
		}
		search.put("id", ad.getId());
		ad = (ProductAds) service.query(search, "proquery");
		return "update";
	}

	/**
	 * 修改产品
	 * 
	 * @return
	 */
	public String update() {
		search = Util.getSearch(table);
		if (ad == null) {
			ad = new ProductAds();
		}

		// 1.上传资料
		if (fileapk != null) {
			String end = fileapkFileName.substring(fileapkFileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.apkpath, "soft" + ad.getProindex() + end, fileapk);
			} catch (IOException e) {
				this.addActionError("APK上传错误！请重新操作！");
				return "update";
			}
		}

		if (filelogo != null) {
			String end = filelogoFileName.substring(filelogoFileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.iconpath, "icon" + ad.getProindex() + end, filelogo);
			} catch (IOException e) {
				addActionError("LOGO上传错误！请重新操作！");
				return "update";
			}
			ad.setProicon(Variable.netpath + "prologo/icon" + ad.getProindex() + end);
		}
		if (fileimg != null) {
			String end = fileimgFileName.substring(fileimgFileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.imgpath, "simg" + ad.getProindex() + "01" + end, fileimg);
			} catch (IOException e) {
				addActionError("产品截图上传错误！请重新操作！");
				return "update";
			}
			ad.setScreenshot(Variable.netpath + "prosimg/simg" + ad.getProindex() + "01" + end);
		}
		if (fileimg1 != null) {
			String end = fileimg1FileName.substring(fileimg1FileName.lastIndexOf("."));
			try {
				Util.fileUpload(Variable.imgpath, "simg" + ad.getProindex() + "02" + end, fileimg1);
			} catch (IOException e) {
				addActionError("产品截图上传错误！请重新操作！");
				return "update";
			}
			ad.setScreenshot(
					ad.getScreenshot() + ";" + Variable.netpath + "prosimg/simg" + ad.getProindex() + "02" + end);
		}
		int index = service.listCount(search, "Index") + 1;
		// 2.修改优先级
		if ("off".equals(ad.getProstatues())) {// 产品下线 优先级变为1000
			ad.setPropri(1000);
		} else {
			if (ad.getPropri() > index) {
				ad.setPropri(index);
			}

		}
		int proPri = ad.getPropri();
		if (proPri > oldPri) {
			search.put("type", "0");
			search.put("start", oldPri);
			search.put("end", proPri);
		} else if (proPri < oldPri) {
			search.put("type", "1");
			search.put("end", oldPri);
			search.put("start", proPri);
		} else {
			search.put("type", "-1");
		}
		if (!"-1".equals(search.get("type"))) {// 优先级相同不做修改
			if (!service.update(search, "priUpdate")) {
				addActionError("优先级操作错误！请重新操作！");
				return "update";
			}
		}
		// 3.修改数据
		if (!service.update(ad, "proupdate")) {
			addActionError("数据存储错误！请重新操作！");
			return "update";
		} else {// 4.更新Unity
			if ("ios".equals(ad.getProtype())) {
				updUnity(1);
			}
			if ("android".equals(ad.getProtype())) {
				updUnity(2);
			}

		}
		ad = null;
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
			search.put("keyname", "i_productlist_update");
		}
		if (type == 2) {
			search.put("keyname", "a_productlist_update");
		}
		search.put("createtimestp", System.currentTimeMillis() / 1000);
		return service.update(search);

	}

	/**
	 * 增加 任务
	 * 
	 * @return
	 */
	public String addMiss() {
		search = Util.getSearch(table);
		if (ad == null) {
			ad = new ProductAds();
		}
		if (mis == null) {
			mis = new Mission();
		}
		if (Util.isNULL(ad.getId())) {
			return list();
		}
		search.put("id", ad.getId());
		ad = (ProductAds) service.query(search, "proquery");
		mis.setProid(ad.getId());
		mis.setName(ad.getProname());
		return "addMission";
	}

	public ProductAds getAd() {
		return ad;
	}

	public void setAd(ProductAds ad) {
		this.ad = ad;
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

	public File getFileimg() {
		return fileimg;
	}

	public void setFileimg(File fileimg) {
		this.fileimg = fileimg;
	}

	public String getFileimgFileName() {
		return fileimgFileName;
	}

	public void setFileimgFileName(String fileimgFileName) {
		this.fileimgFileName = fileimgFileName;
	}

	public File getFileimg1() {
		return fileimg1;
	}

	public void setFileimg1(File fileimg1) {
		this.fileimg1 = fileimg1;
	}

	public String getFileimg1FileName() {
		return fileimg1FileName;
	}

	public void setFileimg1FileName(String fileimg1FileName) {
		this.fileimg1FileName = fileimg1FileName;
	}

	public int getOldPri() {
		return oldPri;
	}

	public void setOldPri(int oldPri) {
		this.oldPri = oldPri;
	}

	public Mission getMis() {
		return mis;
	}

	public void setMis(Mission mis) {
		this.mis = mis;
	}
}
