package Crawler;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import new_product.DB_connect;

public class ikea {
	private static String URL = "https://www.ikea.com/kr/ko/catalog/news/departments/?";
	private static String ITEM_URL = "https://www.ikea.com/kr/ko/catalog/products/";
/*	☆☆☆☆☆☆☆	나중에 카테고리 읽을때 '포함'으로 sql문 작성	☆☆☆☆☆☆☆☆☆☆☆☆		 */
		
	public static void main(String[] args) throws Exception {
		String KEYWORD = "pageNumber";
		IKEAVO VO = null;
		DB_connect DB = DB_connect.getDB();
		
		for(int i=1; i<2; i++) {	// 일단 1페이지만..
			System.out.print("URL :: " + URL + getList(KEYWORD, i));
			Document list = Jsoup.connect(URL + getList(KEYWORD, i)).get();
			Elements elements = list.select(".productPadding");
			
			System.out.println("   상품수 : "+elements.size());
			
			for(Element element : elements) {
				VO = new IKEAVO();
				String ab=element.toString();
				int start = ab.indexOf("products");
				int end = ab.indexOf("onclick=");
				String itemurl = ab.substring(start+9,end-3);

				Document item = Jsoup.connect(ITEM_URL + 50418576).get();
				//Document item = Jsoup.connect(ITEM_URL + getEachitem(itemurl)).get();
				VO.setItemname(item.select(".productName").text());
				String[] category = item.select(".productType").text().split(",");
				VO.setCategory2(category[0]);
				VO.setItemprice(Integer.parseInt(item.select(".packagePrice").text().replace("₩ ", "").replace(",", "")));
				VO.setSelno(1);
				VO.setItemcontent(item.select(".salesArguments").text());
				
				String image1 = item.select(".rightContentContainer img").toString();
				start = image1.indexOf("src=");
				end = image1.indexOf("alt=");
				image1 = "https://www.ikea.com"+image1.substring(start+5, end-2);
				VO.setImage1(image1);
				
				
				
				Elements itemkind = item.select(".subdivpad div div ul li a");
				String kind="";
			
				Elements itemll = item.select(".displayMeasurements");
				if(itemll.size()!=0) {	// 단일규격
					VO.setItemsize(itemll.text(),0);
				}
				
				String lbn = item.select(".categoryNameLbl").text().replace(": 매장:", "");
				if(lbn.equals("규격")) {	kind="itemsize";}
				else {					kind="itemshape";}
				
				int count=0;
				for(Element abc : itemkind) {
					if(kind.equals("itemsize")) {
						VO.setItemsize(abc.text(),count);
					}else if(kind.equals("itemshape")) {
						VO.setItemshape(abc.text(),count);
					}
					//System.out.println(kind+(count+1)+" : "+abc.text());
					count++;
					if(count==10) {break;}
				}
				/*
				System.out.println();
				System.out.print("상품번호: "+itemurl);
				System.out.print("		"+VO.getItemname());
				System.out.print("		price: "+VO.getItemprice());
				System.out.println("		selno: "+VO.getSelno());
				System.out.println("content: "+VO.getItemcontent());
				System.out.println("category: "+VO.getCategory2());
				System.out.println("image: "+VO.getImage1());
				for(int z=0; z<VO.getItemshape().length; z++) {
					if(VO.getItemshape()[z]==null) {
						break;
					}
					System.out.println(z+1+" "+VO.getItemshape()[z]);
				}
				for(int z=0; z<VO.getItemsize().length; z++) {
					if(VO.getItemsize()[z]==null) {
						break;
					}
					System.out.println(z+1+" "+VO.getItemsize()[z]);
				}
				*/
				DB.write_crawler(VO);
				break;
				/*Elements img = item.select(".imageThumb_0");// a img
				System.out.println(img.size());
				for(Element abc : img) {
					System.out.println(abc);
				}*/
			}
		}
	}

	public static String getList(String KEY_WORD, int PAGE) {
		return KEY_WORD+"="+PAGE;
	}

	public static String getEachitem(String itemurl) {
		return itemurl;
	}
	
	
}
