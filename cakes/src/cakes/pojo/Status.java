package cakes.pojo;

public class Status {

		private int sid;

		private String status;
		
		public Status(int sid){
			this.sid=sid;
		}
		
		public int getSid() {
			return sid;
		}
		public void setSid(int sid) {
			this.sid = sid;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}


}
