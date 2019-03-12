package new_product;
import java.util.ArrayList;
public class hashtag {
	 public static hashtag Hash = new  hashtag();
	 public static  hashtag getHash() {
		 return Hash;
	 }
	 
	 private ArrayList<String> menu1=null;
	 private ArrayList<String> menu2=null;
	
	public String[] Hash() {   
		String[] hash=new String[15];    //
		menu1=new ArrayList<String>(){{
			add("거실");  add("냉장고");  add("데코");  add("벽지");  add("서랍장");
			   add("식기");  add("수납장");  add("소파");  add("세탁기");  add("세면대");
			   add("어린이");  add("옷장");  add("의류");  add("의자");  add("이불");
			   add("주방");  add("조명");  add("정원");  add("장난감");  add("인테리어");
			   add("책상");  add("침대");  add("매트리스");  add("컴퓨터");  add("화장대");
			}};
		for(int i=0; i<hash.length; i++) {
			int random=(int)(Math.random()*(menu1.size()));
			hash[i]=menu1.get(random);
			menu1.remove(random);
		}
		return hash;
	}
	
	public String[] HashCate() {   
		String[] hash=new String[25];    //
		menu2=new ArrayList<String>(){{
			add("거실");  add("냉장고");  add("데코");  add("벽지");  add("서랍장");
			   add("식기");  add("수납장");  add("소파");  add("세탁기");  add("세면대");
			   add("어린이");  add("옷장");  add("의류");  add("의자");  add("이불");
			   add("주방");  add("조명");  add("정원");  add("장난감");  add("인테리어");
			   add("책상");  add("침대");  add("매트리스");  add("컴퓨터");  add("화장대");
			}};
		for(int i=0; i<hash.length; i++) {
			int random=(int)(Math.random()*(menu2.size()));
			hash[i]=menu2.get(random);
			menu2.remove(random);
		}
		return hash;
	}
}