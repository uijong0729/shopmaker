package global.sesoc.bigstar.Bproductcontroller;

import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import global.sesoc.bigstar.common.util.FileService;
import global.sesoc.bigstar.dao.BcarttableDAO;
import global.sesoc.bigstar.dao.BproducttableDAO;
import global.sesoc.bigstar.dao.BquestiontableDAO;
import global.sesoc.bigstar.dao.BreviewtableDAO;
import global.sesoc.bigstar.vo.Bcarttable;
import global.sesoc.bigstar.vo.Bcustomer;
import global.sesoc.bigstar.vo.Bproducttable;
import global.sesoc.bigstar.vo.Breviewtable;

@Controller
public class BproductdetailController {
	
	private static final Logger logger = LoggerFactory.getLogger(BproductdetailController.class);
	final String uploadPath = "/bigstar/src/main/webapp/resources/uploadedFiles"; // uploadPath 설정
	
	private String pathD = "☆";
	
	@Autowired
	BreviewtableDAO RTdao;
	
	@Autowired
	BproducttableDAO PTdao;
	
	@Autowired
	BquestiontableDAO QTdao;
	
	@Autowired
	BcarttableDAO cDao;
	
	@RequestMapping(value="goBproductdetail", method=RequestMethod.GET)
	public String productdetail(HttpSession session, Model model, String productname, String productcode) {
		
		System.out.println(productname);
		

//		System.out.println(customer.getCustomercode());
			
		//TODO: productname에 해당하는 Bproducttable 객체를 DB에서 불러오기. 이후 제품상세 페이지에 제품 정보 뿌려주기.
		//TODO: 상품 후기 및 상품 문의 DB 테이블 불러온 후 Bproductdetail 상품 후기 및 상품 문의 테이블 정보 불러오기.
		
		
//		ArrayList<Bquestiontable> questiontable = 
		
		ArrayList<Breviewtable> reviewtableList = RTdao.getReviewtableByName(productname);
		
		for (Breviewtable breviewtable : reviewtableList) {
			if (breviewtable.getReviewimage()==null || breviewtable.getReviewimage().equals("null☆")) {
				breviewtable.setReviewimage("noimg.jpg");
			}
		}
		
		System.out.println("B리뷰테이블 리스트");
		for (Breviewtable breviewtable2 : reviewtableList) {
			/*System.out.println(breviewtable2);
			if (breviewtable2.getReviewimage().endsWith(pathD) == true) {
				breviewtable2.setReviewimage(breviewtable2.getReviewimage().substring(0, breviewtable2.getReviewimage().length() - 1));
			}*/
			breviewtable2.setReviewimage(breviewtable2.getReviewimage(), pathD);
		}
		
		ArrayList<Bproducttable> productDetailList = PTdao.getProductdetailListByName(productname);
		
		System.out.println("BproductDetailList 리스트");
		for (Bproducttable temp : productDetailList) {
			logger.debug(temp.toString());
		}
		
		model.addAttribute("productDetailList", productDetailList);
		model.addAttribute("reviewtableList", reviewtableList);
		model.addAttribute("productname", productname);
		model.addAttribute("productcode", productcode);
		
		session.setAttribute("productcode", productcode);
		session.setAttribute("productname", productname);
		
		return "Bviews/Bproduct/Bproductdetail";
	}
	
	@RequestMapping(value="basket", method=RequestMethod.GET)
	public String basket() {
		
		return "Bviews/Bproduct/Bbasket";
	}
	
	@RequestMapping(value="productInsert", method=RequestMethod.GET)
	public String productInsert() {
		
		return "Bviews/Bproduct/ProductInsert";
	}
	
	@RequestMapping(value="productReview", method=RequestMethod.GET)
	public String productReview() {
		
		return "Bviews/Bproduct/ProductReview";
	}
	
	/*
	 * 상품문의 작성 페이지로 이동
	 * 
	 * 원용수
	 * 
	 * */
	@RequestMapping(value="goProductReviewWrite", method=RequestMethod.GET)
	public String goProductReviewWrite(HttpSession session, String productcode) {
		
		Bcustomer bCustomer = (Bcustomer) session.getAttribute("Blogin");
		
		System.out.println("productReview 시작");
		
		System.out.println(productcode);
		
		return "Bviews/Bproduct/ProductReviewWrite";
	}
	
	/*
	 * 상품문의 게시글 등록
	 * 
	 * 원용수
	 * 
	 * */
	/*@RequestMapping(value="insertReview", method=RequestMethod.POST)
	public String insertReview(HttpSession session, MultipartFile upload, String productname, String reviewtitle, 
			String customercode, String reviewcontent, String reviewimage, String customername) {
		
		System.out.println("insertReview 시작");
		
		Breviewtable bReviewtable = new Breviewtable();
		
		System.out.println("customername: "+customername);
		System.out.println("customercode: "+customercode);
		System.out.println("reviewtitle: "+reviewtitle);
		System.out.println("reviewcontent: "+reviewcontent);
		System.out.println("reviewimage: "+reviewimage);
		
		
		int reviewscore = 3;
		reviewimage = "image.jpg";
		String productcode="45";
		customercode="1";
		String membercode="36";
		
		bReviewtable.setReviewtitle(reviewtitle);
		bReviewtable.setReviewcontent(reviewcontent);
		
		bReviewtable.setReviewscore(reviewscore);
		bReviewtable.setProductcode(productcode);
		bReviewtable.setCustomercode(customercode);
		bReviewtable.setMembercode(membercode);
		
		System.out.println(bReviewtable);
		
		
		 * TODO: 이미지 및 파일 업로드 구현
		 * 
		 * 원용수
		 		
		
		if (!upload.isEmpty()) {
			logger.info("첨부 파일이 있음");
			String savedfile = FileService.saveFile(upload, uploadPath);
			bReviewtable.setReviewimage(upload.getOriginalFilename());
		} else{
			logger.info("첨부 파일이 없음음");
		}
		
		
		
		 * 데이터베이스에 Breviewtable 넣기
		 * 
		 * 원용수
		 * 
		
		int result = 0;
		
		result = RTdao.insertReview(bReviewtable);
		
		System.out.println("SQL insert 결과: "+result);
		
		return "redirect:goBproductdetail?productname="+productname;
	}*/
	
	
	
	/*
	 * 상품 후기 등록 
	 * 
	 * 원용수
	 * */
	
	@ResponseBody
	@RequestMapping(value="upload", method=RequestMethod.POST)
	public String upload(MultipartHttpServletRequest mhsq, HttpServletRequest hsreq, HttpSession session){
		
		logger.debug("upload 시작");
		
		String productcode = (String) session.getAttribute("productcode");
		
		logger.debug("productcode: "+productcode);
		
		String imagesPath = hsreq.getSession().getServletContext().getRealPath("/resources/image");
		
		logger.debug("imagesPath: " + imagesPath);
		
		String reviewImgPath = "";
		Iterator<String> files = mhsq.getFileNames();
			while(files.hasNext()){
				String uploadFile = files.next();
				
				MultipartFile mFile = mhsq.getFile(uploadFile);
				reviewImgPath += FileService.saveFile(mFile, imagesPath)+pathD;
			}
		
		String reviewtitle = mhsq.getParameter("reviewtitle");
		String reviewcontent = mhsq.getParameter("reviewcontent");
		/*String customercode = mhsq.getParameter("customercode");*/
		
		Breviewtable bReviewtable = new Breviewtable();
		
		int reviewscore = 0;
		
		/* 
		 * JSP에서 customercode, membercode 실제 값 매핑 필요!
		 * - String customercode="1";
		 * - String membercode="36";
		 * */
		
		String customercode="1";
		String membercode="36";
		
		bReviewtable.setReviewtitle(reviewtitle);
		bReviewtable.setReviewcontent(reviewcontent);
		bReviewtable.setReviewimage(reviewImgPath);
		bReviewtable.setReviewscore(reviewscore);
		bReviewtable.setProductcode(productcode);
		bReviewtable.setCustomercode(customercode);
		bReviewtable.setMembercode(membercode);
		
		logger.debug(bReviewtable.toString());
		
		int result = 0;
		String str = null;
		
		result = RTdao.insertReview(bReviewtable);
		
		if (result == 1) {
			str = "1";
		}
		
		logger.debug(reviewImgPath);
		
		return str;
	}
	
	/*
	 * 파일 다운로드 기능 
	 * 
	 * 원용수
	 * */
	
	@RequestMapping(value="download", method= RequestMethod.GET)
	public void download(String reviewcode, HttpServletResponse response){
		
		Breviewtable breviewtable = RTdao.selectBreviewtable(reviewcode);
		
		String FileName =  breviewtable.getReviewimage();
		
		try {
			response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(FileName, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String fullPath = uploadPath + "/" + FileName;
		
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		
		try {
			fis = new FileInputStream(fullPath);
			sos = response.getOutputStream();
			
			FileCopyUtils.copy(fis, sos);
			
			fis.close();
			sos.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	@RequestMapping(value="Bqnalist", method=RequestMethod.GET)
	public String Bnotice() {
		
		return "Bviews/Bboard/Bqnalist";
	}
	
	@RequestMapping(value="Bqnawriteform", method=RequestMethod.GET)
	public String Bqnawriteform() {
		
		return "Bviews/Bboard/Bqnawriteform";
	}
	
	@RequestMapping(value="Bqnaread", method=RequestMethod.GET)
	public String Bqnaread() {
		
		return "Bviews/Bboard/Bqnaread";
	}
	
	@RequestMapping(value="Bnoticelist", method=RequestMethod.GET)
	public String Bnoticelist() {
		
		return "Bviews/Bboard/Bnoticelist";
	}
	
	@RequestMapping(value="Bnoticewrite", method=RequestMethod.GET)
	public String Bnoticewrite() {
		
		return "Bviews/Bboard/Bnoticewrite";
	}
	
	@RequestMapping(value="Bpurchaseform", method=RequestMethod.GET)
	public String Bpurchaseform(HttpSession session, Model model) {
		
		Bcustomer bCustomer = (Bcustomer) session.getAttribute("Blogin");
		
		model.addAttribute("bCustomer", bCustomer);
		
		return "Bviews/Bpurchase/Bpurchaseform";
	}
	
	@ResponseBody
	@RequestMapping(value="insertCart", method=RequestMethod.GET)
	public void insertCart(Bcarttable bcart) {
		String customer = bcart.getCustomercode();
		String productcode = bcart.getProductcode();
		String productQty = bcart.getProductQty();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("customercode", customer);
		map.put("productcode", productcode);
		map.put("productQty", productQty);
		System.out.println(map);
		System.out.println(cDao.insertBcart(map));
		//System.out.println(membercode + "//" + productcode);
		//Bproducttable product =  cDao.getBproduct(Integer.parseInt(productcode));
		
	}
	
	@RequestMapping(value = "delReview", method = RequestMethod.GET)
	public String delReview(HttpSession session, String reviewcode) {
		String Url = null;
		RTdao.delReview(reviewcode);
		String productname = (String) session.getAttribute("productname");
		String productcode = (String) session.getAttribute("productcode");
		
		/* productname이 한글이라서 java 단에서 return 값이 한글로 들어가면 인식을 못한다(ex. 자바는 '토끼'를 '??'으로 인식함)*/
		/*return "redirect:goBproductdetail?productname=" + productname + "&productcode=" + productcode;*/
		
		/* [Spring Framework] 한글 파라미터가 포함된 URL 전송문제 해결 - 가랏 김준형!! URL을 부탁해!! From 용수
		 * 
		 String goBproductdetail = "redirect:goBproductdetail?productname=" + productname + "&productcode=" + productcode;
		
		logger.debug(goBproductdetail);
		
		try {
			Url = URLEncoder.encode(goBproductdetail, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return Url;
		
		*/
		return "goBamin";
	}
	

}
