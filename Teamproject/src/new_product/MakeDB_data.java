package new_product;
import java.util.ArrayList;
public class MakeDB_data {
	private int itemno=0;				private String itemname="";
	private long itemprice=0;			private String write_date="";
	private int selno=0;					private String itemcontent="";
	private String category1="";		private String category2="";
	private int itemoption1=0;			private int itemoption2=0;
	private String image="";

	private ArrayList<String> list=new ArrayList<String>(){{
		   add("�Ž�");  add("�����");  add("����");  add("����");  add("������");
		   add("�ı�");  add("������");  add("����");  add("��Ź��");  add("�����");
		   add("���");  add("����");  add("�Ƿ�");  add("����");  add("�̺�");
		   add("�ֹ�");  add("����");  add("����");  add("�峭��");  add("���׸���");
		   add("å��");  add("ħ��");  add("����");  add("��ǻ��");  add("ȭ���");
	}};
	
	public int getItemno() {return itemno;	}
	public void setItemno(int itemno) {this.itemno = itemno;}
	public String getItemname() {return itemname;}
	public void setItemname(String itemname) {
		int random=(int)(Math.random()*(list.size()));
		this.itemname=list.get(random);
	}
	public long getItemprice() {return itemprice;}
	public void setItemprice(long itemprice) {
		this.itemprice = ((int)(Math.random()*100)+1)*10000;
	}
	public String getWrite_date() {return write_date;}
	public void setWrite_date(String write_date) {this.write_date = write_date;}
	public int getSelno() {return selno;}
	public void setSelno(int selno) {
		this.selno = (int)(Math.random()*10)+1;
	}
	public String getItemcontent() {return itemcontent;}
	public void setItemcontent(String itemcontent) {this.itemcontent = itemcontent;}
	public String getCategory1() {return category1;}
	public void setCategory1(String category1) {this.category1=category1;}
	public String getCategory2() {return category2;}
	public void setCategory2(String category2) {
		this.category2=getItemname();
	}
	public int getItemoption1() {return itemoption1;}
	public void setItemoption1(int itemoption1) {
		this.itemoption1 = (int)(Math.random()*10)+1;
	}
	public int getItemoption2() {	return itemoption2;}
	public void setItemoption2(int itemoption2) {
		this.itemoption2 = (int)(Math.random()*10)+1;
	}
	public String getImage() {return image;}
	public void setImage(String image) {
		this.image = getItemname();
	}	
}
