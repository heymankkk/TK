package new_product;
import java.util.ArrayList;

public class DB_data {
	private int itemno=0;			private String itemname="";
	private long itemprice=0;		private String write_date="";
	private int selno=0;				private String itemcontent="";
	private int score=0;				private String category1="";
	private String category2="";	private String image1="";
	private String image2="";		private String image3="";
	private String image4="";		private String image5="";
	private String itemshape1="";	private String itemshape2="";
	private String itemshape3="";	private String itemshape4="";
	private String itemshape5="";	private String itemshape6="";
	private String itemshape7="";	private String itemshape8="";
	private String itemshape9="";	private String itemshape10="";
	private String itemsize1="";		private String itemsize2="";
	private String itemsize3="";		private String itemsize4="";
	private String itemsize5="";		private String itemsize6="";
	private String itemsize7="";		private String itemsize8="";
	private String itemsize9="";		private String itemsize10="";
	private ArrayList<String> shape = new ArrayList<String>();
	private ArrayList<String> size = new ArrayList<String>();
	private ArrayList<String> imgcount = new ArrayList<String>();
	public void setShape() {
		if(itemshape1!=null) {shape.add(itemshape1);}
		if(itemshape2!=null) {shape.add(itemshape2);}
		if(itemshape3!=null) {shape.add(itemshape3);}
		if(itemshape4!=null) {shape.add(itemshape4);}
		if(itemshape5!=null) {shape.add(itemshape5);}
		if(itemshape6!=null) {shape.add(itemshape6);}
		if(itemshape7!=null) {shape.add(itemshape7);}
		if(itemshape8!=null) {shape.add(itemshape8);}
		if(itemshape9!=null) {shape.add(itemshape9);}
		if(itemshape10!=null) {shape.add(itemshape10);}
	}
	public ArrayList<String> getShape(){
		return shape;
	}
	public void setSize() {
		if(itemsize1!=null) {size.add(itemsize1);}
		if(itemsize2!=null) {size.add(itemsize2);}
		if(itemsize3!=null) {size.add(itemsize3);}
		if(itemsize4!=null) {size.add(itemsize4);}
		if(itemsize5!=null) {size.add(itemsize5);}
		if(itemsize6!=null) {size.add(itemsize6);}
		if(itemsize7!=null) {size.add(itemsize7);}
		if(itemsize8!=null) {size.add(itemsize8);}
		if(itemsize9!=null) {size.add(itemsize9);}
		if(itemsize10!=null) {size.add(itemsize10);}
	}
	public ArrayList<String> getSize(){
		return size;
	}
	public void setImgcount() {
		if(image1!=null) {imgcount.add(image1);}
		if(image2!=null) {imgcount.add(image2);}
		if(image3!=null) {imgcount.add(image3);}
		if(image4!=null) {imgcount.add(image4);}
		if(image5!=null) {imgcount.add(image5);}

	}
	public ArrayList<String> getImgcount(){
		return imgcount;
	}
	
	
	public int getItemno() {
		return itemno;
	}


	public void setItemno(int itemno) {
		this.itemno = itemno;
	}


	public String getItemname() {
		return itemname;
	}


	public void setItemname(String itemname) {
		this.itemname = itemname;
	}


	public long getItemprice() {
		return itemprice;
	}


	public void setItemprice(long itemprice) {
		this.itemprice = itemprice;
	}


	public String getWrite_date() {
		return write_date;
	}


	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}


	public int getSelno() {
		return selno;
	}


	public void setSelno(int selno) {
		this.selno = selno;
	}


	public String getItemcontent() {
		return itemcontent;
	}


	public void setItemcontent(String itemcontent) {
		this.itemcontent = itemcontent;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public String getCategory1() {
		return category1;
	}


	public void setCategory1(String category1) {
		this.category1 = category1;
	}


	public String getCategory2() {
		return category2;
	}


	public void setCategory2(String category2) {
		this.category2 = category2;
	}


	public String getImage1() {
		return image1;
	}


	public void setImage1(String image1) {
		this.image1 = image1;
	}


	public String getImage2() {
		return image2;
	}


	public void setImage2(String image2) {
		this.image2 = image2;
	}


	public String getImage3() {
		return image3;
	}


	public void setImage3(String image3) {
		this.image3 = image3;
	}


	public String getImage4() {
		return image4;
	}


	public void setImage4(String image4) {
		this.image4 = image4;
	}


	public String getImage5() {
		return image5;
	}


	public void setImage5(String image5) {
		this.image5 = image5;
	}


	public String getItemshape1() {
		return itemshape1;
	}


	public void setItemshape1(String itemshape1) {
		this.itemshape1 = itemshape1;
	}


	public String getItemshape2() {
		return itemshape2;
	}


	public void setItemshape2(String itemshape2) {
		this.itemshape2 = itemshape2;
	}


	public String getItemshape3() {
		return itemshape3;
	}


	public void setItemshape3(String itemshape3) {
		this.itemshape3 = itemshape3;
	}


	public String getItemshape4() {
		return itemshape4;
	}


	public void setItemshape4(String itemshape4) {
		this.itemshape4 = itemshape4;
	}


	public String getItemshape5() {
		return itemshape5;
	}


	public void setItemshape5(String itemshape5) {
		this.itemshape5 = itemshape5;
	}


	public String getItemshape6() {
		return itemshape6;
	}


	public void setItemshape6(String itemshape6) {
		this.itemshape6 = itemshape6;
	}


	public String getItemshape7() {
		return itemshape7;
	}


	public void setItemshape7(String itemshape7) {
		this.itemshape7 = itemshape7;
	}


	public String getItemshape8() {
		return itemshape8;
	}


	public void setItemshape8(String itemshape8) {
		this.itemshape8 = itemshape8;
	}


	public String getItemshape9() {
		return itemshape9;
	}


	public void setItemshape9(String itemshape9) {
		this.itemshape9 = itemshape9;
	}


	public String getItemshape10() {
		return itemshape10;
	}


	public void setItemshape10(String itemshape10) {
		this.itemshape10 = itemshape10;
	}


	public String getItemsize1() {
		return itemsize1;
	}


	public void setItemsize1(String itemsize1) {
		this.itemsize1 = itemsize1;
	}


	public String getItemsize2() {
		return itemsize2;
	}


	public void setItemsize2(String itemsize2) {
		this.itemsize2 = itemsize2;
	}


	public String getItemsize3() {
		return itemsize3;
	}


	public void setItemsize3(String itemsize3) {
		this.itemsize3 = itemsize3;
	}


	public String getItemsize4() {
		return itemsize4;
	}


	public void setItemsize4(String itemsize4) {
		this.itemsize4 = itemsize4;
	}


	public String getItemsize5() {
		return itemsize5;
	}


	public void setItemsize5(String itemsize5) {
		this.itemsize5 = itemsize5;
	}


	public String getItemsize6() {
		return itemsize6;
	}


	public void setItemsize6(String itemsize6) {
		this.itemsize6 = itemsize6;
	}


	public String getItemsize7() {
		return itemsize7;
	}


	public void setItemsize7(String itemsize7) {
		this.itemsize7 = itemsize7;
	}


	public String getItemsize8() {
		return itemsize8;
	}


	public void setItemsize8(String itemsize8) {
		this.itemsize8 = itemsize8;
	}


	public String getItemsize9() {
		return itemsize9;
	}


	public void setItemsize9(String itemsize9) {
		this.itemsize9 = itemsize9;
	}


	public String getItemsize10() {
		return itemsize10;
	}


	public void setItemsize10(String itemsize10) {
		this.itemsize10 = itemsize10;
	}
	
	
}
