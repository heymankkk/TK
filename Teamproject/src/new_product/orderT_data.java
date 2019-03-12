package new_product;
public class orderT_data {
	private String selno="";		private int totalprice=0;
	private String rcvemail="";	private String rcvphone="";
	private String rcvname="";	private String rcvaddress="";
	private int custno=0;		private int orderno=0;
	private String message="";	private int cartcustno=0;
	
	
	public int getCartcustno() {
		return cartcustno;
	}

	public void setCartcustno(int cartcustno) {
		this.cartcustno = cartcustno;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSelno() {
		return selno;
	}


	public void setSelno(String selno) {
		this.selno = selno;
	}


	public int getTotalprice() {
		return totalprice;
	}


	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}


	public String getRcvemail() {
		return rcvemail;
	}


	public void setRcvemail(String rcvemail) {
		this.rcvemail = rcvemail;
	}


	public String getRcvphone() {
		return rcvphone;
	}


	public void setRcvphone(String rcvphone) {
		this.rcvphone = rcvphone;
	}


	public String getRcvname() {
		return rcvname;
	}


	public void setRcvname(String rcvname) {
		this.rcvname = rcvname;
	}


	public String getRcvaddress() {
		return rcvaddress;
	}


	public void setRcvaddress(String rcvaddress) {
		this.rcvaddress = rcvaddress;
	}


	public int getCustno() {
		return custno;
	}


	public void setCustno(int custno) {
		this.custno = custno;
	}


	public int getOrderno() {
		return orderno;
	}


	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	
	
}
