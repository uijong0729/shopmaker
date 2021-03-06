package global.sesoc.bigstar.Bproductcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.bigstar.dao.AtemplateDAO;
import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.dao.BreviewtableDAO;
import global.sesoc.bigstar.vo.Amember;
import global.sesoc.bigstar.vo.Atemplate;
import global.sesoc.bigstar.vo.Bproducttable;
import global.sesoc.bigstar.vo.Breviewtable;
import net.sf.json.JSONArray;

@Controller
public class BproductController {

	@Autowired
	BproducttableDAO Bpdao;
	@Autowired
	AtemplateDAO adao;
	@Autowired
	BreviewtableDAO RTdao;
	@Autowired
	BproducttableDAO PTdao;

	private String pathD = "☆";

	@RequestMapping(value = "Bmainlist", method = RequestMethod.GET)
	public String goBmainlilst(Model model) {
		ArrayList<Bproducttable> Bproducttable = new ArrayList<Bproducttable>();
		ArrayList<Bproducttable> Bproducttable2 = new ArrayList<Bproducttable>();
		ArrayList<String> nameset = new ArrayList<String>();
		ArrayList<String> imageset = new ArrayList<String>();
		ArrayList<String[]> imageset2 = new ArrayList<String[]>();

		JSONArray jsonArray = JSONArray.fromObject(Bproducttable2);

		int count = 0;
		Bproducttable = Bpdao.selectallbproducttable();

		for (Bproducttable b : Bproducttable) {
			imageset.add(b.getProductname());
		}
		for (int i = 0; i < imageset.size(); i++) {
			if (!nameset.contains(imageset.get(i))) {
				nameset.add(imageset.get(i));
			}
		}
		imageset.clear();

		Map<String, String> arrMap = new HashMap<String, String>();

		for (int i = 0; i < Bproducttable.size(); i++) {
			if (arrMap.containsKey(Bproducttable.get(i).getProductname())) {
				String str = arrMap.get(Bproducttable.get(i).getProductname());
				arrMap.remove(Bproducttable.get(i).getProductname());
				arrMap.put(Bproducttable.get(i).getProductname(), str);
			}
			arrMap.put(Bproducttable.get(i).getProductname(), Bproducttable.get(i).getProductimage());

		}

		model.addAttribute("map", arrMap);
		model.addAttribute("nameset", nameset);
		model.addAttribute("Bproducttable", Bproducttable);
		model.addAttribute("count", count);

		model.addAttribute("rows", 4);
		return "Bviews/Bmainlist/Bmainlist";
	}

	@RequestMapping(value = "BpageMain", method = RequestMethod.GET)
	public String BpageMain(Model model) {

		ArrayList<Bproducttable> Bproducttable = new ArrayList<Bproducttable>();
		ArrayList<String> nameset = new ArrayList<String>();
		ArrayList<String> imageset = new ArrayList<String>();
		ArrayList<String[]> imageset2 = new ArrayList<String[]>();

		int count = 0;
		Bproducttable = Bpdao.selectallbproducttable();

		for (Bproducttable b : Bproducttable) {
			imageset.add(b.getProductname());
		}
		for (int i = 0; i < imageset.size(); i++) {
			if (!nameset.contains(imageset.get(i))) {
				nameset.add(imageset.get(i));
			}
		}
		imageset.clear();

		Map<String, String> arrMap = new HashMap<String, String>();

		for (int i = 0; i < Bproducttable.size(); i++) {
			if (arrMap.containsKey(Bproducttable.get(i).getProductname())) {
				String str = arrMap.get(Bproducttable.get(i).getProductname());
				arrMap.remove(Bproducttable.get(i).getProductname());
				arrMap.put(Bproducttable.get(i).getProductname(), str);
			}
			arrMap.put(Bproducttable.get(i).getProductname(), Bproducttable.get(i).getProductimage());

		}

		JSONArray jsonArray = JSONArray.fromObject(Bproducttable);

		System.out.println(arrMap.get("key"));

		System.out.println(count);

		model.addAttribute("map", arrMap);
		model.addAttribute("nameset", nameset);
		model.addAttribute("Bproducttable", Bproducttable);
		model.addAttribute("count", count);
		model.addAttribute("json", jsonArray);
		model.addAttribute("rows", 4);
		return "Bviews/Bmain/BpageMain";
	}

	@RequestMapping(value = "goBmain", method = RequestMethod.GET)
	public String goBmain(Model model) {
		ArrayList<Bproducttable> Bproducttable = new ArrayList<Bproducttable>();
		ArrayList<String> nameset = new ArrayList<String>();
		ArrayList<String> imageset = new ArrayList<String>();
		ArrayList<String[]> imageset2 = new ArrayList<String[]>();

		int count = 0;
		Bproducttable = Bpdao.selectallbproducttable();

		for (Bproducttable b : Bproducttable) {
			imageset.add(b.getProductname());
		}
		for (int i = 0; i < imageset.size(); i++) {
			if (!nameset.contains(imageset.get(i))) {
				nameset.add(imageset.get(i));
			}
		}
		imageset.clear();

		Map<String, String> arrMap = new HashMap<String, String>();

		for (int i = 0; i < Bproducttable.size(); i++) {
			if (arrMap.containsKey(Bproducttable.get(i).getProductname())) {
				String str = arrMap.get(Bproducttable.get(i).getProductname());
				arrMap.remove(Bproducttable.get(i).getProductname());
				arrMap.put(Bproducttable.get(i).getProductname(), str);
			}
			arrMap.put(Bproducttable.get(i).getProductname(), Bproducttable.get(i).getProductimage());

		}

		JSONArray jsonArray = JSONArray.fromObject(Bproducttable);

		System.out.println(arrMap.get("key"));

		System.out.println(count);

		model.addAttribute("map", arrMap);
		model.addAttribute("nameset", nameset);
		model.addAttribute("Bproducttable", Bproducttable);
		model.addAttribute("count", count);
		model.addAttribute("json", jsonArray);
		model.addAttribute("rows", 4);
		return "Bviews/Bmain/Bmain";
	}

	@RequestMapping(value = "myShop", method = RequestMethod.GET)
	public String myShop() {
		return "Bviews/Bpage/myShop";
	}

	@RequestMapping(value = "goMyShop", method = RequestMethod.GET)
	public String goMyShop(String page, String code, String category, String productname, String productcode,
			Model model, HttpSession session) {
		Amember am = (Amember) session.getAttribute("Amember");

		if (am == null) {
			am = new Amember();
			am.setMembercode(code);
		}

		session.setAttribute("Amember", am);
		String link = code + page;
		System.out.println(link);
		Atemplate at = new Atemplate();
		at = adao.getPage(link);
		Atemplate header = adao.getPage(code + "Bheader");
		Atemplate footer = adao.getPage(code + "Bfooter");

		if (page.equals("Bproductdetail")) {
			ArrayList<Breviewtable> reviewtableList = RTdao.getReviewtableByName(productname);

			for (Breviewtable breviewtable : reviewtableList) {
				if (breviewtable.getReviewimage() == null || breviewtable.getReviewimage().equals("null☆")) {
					breviewtable.setReviewimage("noimg.jpg");
				}
			}

			for (Breviewtable breviewtable2 : reviewtableList) {
				/*
				 * System.out.println(breviewtable2); if
				 * (breviewtable2.getReviewimage().endsWith(pathD) == true) {
				 * breviewtable2.setReviewimage(breviewtable2.getReviewimage().substring(0,
				 * breviewtable2.getReviewimage().length() - 1)); }
				 */
				breviewtable2.setReviewimage(breviewtable2.getReviewimage(), pathD);
			}

			ArrayList<Bproducttable> productDetailList = PTdao.getProductdetailListByName(productname);

			model.addAttribute("productDetailList", productDetailList);
			session.setAttribute("reviewtableList", reviewtableList);
			model.addAttribute("productname", productname);
			model.addAttribute("productcode", productcode);

			session.setAttribute("productcode", productcode);
			session.setAttribute("productname", productname);
		}

		if (page.equals("Bmainlist")) {
			ArrayList<Bproducttable> Bproducttable = new ArrayList<Bproducttable>();
			ArrayList<String> nameset = new ArrayList<String>();
			ArrayList<String> imageset = new ArrayList<String>();

			int count = 0;
			Bproducttable = Bpdao.selectkindproduct(category);

			for (Bproducttable b : Bproducttable) {
				imageset.add(b.getProductname());
			}
			for (int i = 0; i < imageset.size(); i++) {
				if (!nameset.contains(imageset.get(i))) {
					nameset.add(imageset.get(i));
				}
			}
			imageset.clear();

			Map<String, String> arrMap = new HashMap<String, String>();

			for (int i = 0; i < Bproducttable.size(); i++) {
				if (arrMap.containsKey(Bproducttable.get(i).getProductname())) {
					String str = arrMap.get(Bproducttable.get(i).getProductname());
					arrMap.remove(Bproducttable.get(i).getProductname());
					arrMap.put(Bproducttable.get(i).getProductname(), str);
				}
				arrMap.put(Bproducttable.get(i).getProductname(), Bproducttable.get(i).getProductimage());

			}

			model.addAttribute("map", arrMap);
			model.addAttribute("nameset", nameset);
			model.addAttribute("Bproducttable", Bproducttable);
			model.addAttribute("count", count);

			model.addAttribute("rows", 4);

			session.setAttribute("productcode", productcode);
			session.setAttribute("productname", productname);
		}

		String bodyContent = "";
		if (at.getBody0() != null && at.getBody0() != "") {
			bodyContent += at.getBody0();
		}
		if (at.getBody1() != null && at.getBody1() != "") {
			bodyContent += at.getBody1();
		}
		if (at.getBody2() != null && at.getBody2() != "") {
			bodyContent += at.getBody2();
		}
		if (at.getBody3() != null && at.getBody3() != "") {
			bodyContent += at.getBody3();
		}
		if (at.getBody4() != null && at.getBody4() != "") {
			bodyContent += at.getBody4();
		}
		if (at.getBody5() != null && at.getBody5() != "") {
			bodyContent += at.getBody5();
		}
		if (at.getBody6() != null && at.getBody6() != "") {
			bodyContent += at.getBody6();
		}
		if (at.getBody7() != null && at.getBody7() != "") {
			bodyContent += at.getBody7();
		}
		if (at.getBody8() != null && at.getBody8() != "") {
			bodyContent += at.getBody8();
		}
		if (at.getBody9() != null && at.getBody9() != "") {
			bodyContent += at.getBody9();
		}

		String headerContent = "";
		if (header.getBody0() != null && header.getBody0() != "") {
			headerContent += header.getBody0();
		}
		if (header.getBody1() != null && header.getBody1() != "") {
			headerContent += header.getBody1();
		}
		if (header.getBody2() != null && header.getBody2() != "") {
			headerContent += header.getBody2();
		}
		if (header.getBody3() != null && header.getBody3() != "") {
			headerContent += header.getBody3();
		}
		if (header.getBody4() != null && header.getBody4() != "") {
			headerContent += header.getBody4();
		}
		if (header.getBody5() != null && header.getBody5() != "") {
			headerContent += header.getBody5();
		}
		if (header.getBody6() != null && header.getBody6() != "") {
			headerContent += header.getBody6();
		}
		if (header.getBody7() != null && header.getBody7() != "") {
			headerContent += header.getBody7();
		}
		if (header.getBody8() != null && header.getBody8() != "") {
			headerContent += header.getBody8();
		}
		if (header.getBody9() != null && header.getBody9() != "") {
			headerContent += header.getBody9();
		}

		String footerContent = "";
		if (footer.getBody0() != null && footer.getBody0() != "") {
			footerContent += footer.getBody0();
		}
		if (footer.getBody1() != null && footer.getBody1() != "") {
			footerContent += footer.getBody1();
		}
		if (footer.getBody2() != null && footer.getBody2() != "") {
			footerContent += footer.getBody2();
		}
		if (footer.getBody3() != null && footer.getBody3() != "") {
			footerContent += footer.getBody3();
		}
		if (footer.getBody4() != null && footer.getBody4() != "") {
			footerContent += footer.getBody4();
		}
		if (footer.getBody5() != null && footer.getBody5() != "") {
			footerContent += footer.getBody5();
		}
		if (footer.getBody6() != null && footer.getBody6() != "") {
			footerContent += footer.getBody6();
		}
		if (footer.getBody7() != null && footer.getBody7() != "") {
			footerContent += footer.getBody7();
		}
		if (footer.getBody8() != null && footer.getBody8() != "") {
			footerContent += footer.getBody8();
		}
		if (footer.getBody9() != null && footer.getBody9() != "") {
			footerContent += footer.getBody9();
		}

		model.addAttribute("body", bodyContent);
		model.addAttribute("headerContent", headerContent);
		model.addAttribute("footer", footerContent);
		return "Bviews/Bpage/myShop";
	}

	@RequestMapping(value = "goLogout", method = RequestMethod.GET)
	public String goLogout(HttpSession hs, String code) {
		hs.removeAttribute("Blogin");
		return "redirect:/goMyShop?code=" + code + "&page=Blogin";
	}

	@RequestMapping(value = "Bheader", method = RequestMethod.GET)
	public String Bheader(Model model) {
		ArrayList<Bproducttable> Bproducttable = new ArrayList<Bproducttable>();
		ArrayList<String> kindset = new ArrayList<String>();
		boolean insert = true;
		Bproducttable = Bpdao.selectallbproducttable();

		for (int i = 0; i < Bproducttable.size(); i++) {

			for (int j = 0; j < kindset.size(); j++) {
				if (kindset.get(j).equals(Bproducttable.get(i).getProductkind())) {
					insert = false;
				}
			}
			if (insert == true) {
				kindset.add(Bproducttable.get(i).getProductkind());
			}
			insert = true;
		}

		model.addAttribute("productkindlist", kindset);

		return "Bviews/Bmain/Bheader";
	}

	@RequestMapping(value = "Bfooter", method = RequestMethod.GET)
	public String Bfooter() {
		return "Bviews/Bmain/Bfooter";
	}

	@RequestMapping(value = "ProductReview", method = RequestMethod.GET)
	public String ProductReview() {
		return "Bviews/Bproduct/ProductReview";
	}

	@RequestMapping(value = "productkind1", method = RequestMethod.GET)
	public String BpageMain(String kind, Model model) {

		ArrayList<Bproducttable> Bproducttable = new ArrayList<Bproducttable>();
		ArrayList<String> nameset = new ArrayList<String>();
		ArrayList<String> imageset = new ArrayList<String>();
		ArrayList<String[]> imageset2 = new ArrayList<String[]>();

		int count = 0;
		Bproducttable = Bpdao.selectkindproduct(kind);

		for (Bproducttable b : Bproducttable) {
			imageset.add(b.getProductname());
		}
		for (int i = 0; i < imageset.size(); i++) {
			if (!nameset.contains(imageset.get(i))) {
				nameset.add(imageset.get(i));
			}
		}
		imageset.clear();

		Map<String, String> arrMap = new HashMap<String, String>();

		for (int i = 0; i < Bproducttable.size(); i++) {
			if (arrMap.containsKey(Bproducttable.get(i).getProductname())) {
				String str = arrMap.get(Bproducttable.get(i).getProductname());
				arrMap.remove(Bproducttable.get(i).getProductname());
				arrMap.put(Bproducttable.get(i).getProductname(), str);
			}
			arrMap.put(Bproducttable.get(i).getProductname(), Bproducttable.get(i).getProductimage());

		}

		JSONArray jsonArray = JSONArray.fromObject(Bproducttable);

		System.out.println(arrMap.get("key"));

		System.out.println(count);
		model.addAttribute("slidedelete", kind);
		model.addAttribute("map", arrMap);
		model.addAttribute("nameset", nameset);
		model.addAttribute("Bproducttable", Bproducttable);
		model.addAttribute("count", count);
		model.addAttribute("json", jsonArray);
		model.addAttribute("rows", 4);
		return "Bviews/Bmain/BpageMain";
	}

}
