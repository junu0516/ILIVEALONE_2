package com.kh.ila.housing.model.vo;

public class HousingSearchCondition {

		private String title;
		private String content;
		private String writer;
		
		public HousingSearchCondition() {
		
		}
		public HousingSearchCondition(String title, String content, String writer) {
			super();
			this.title = title;
			this.content = content;
			this.writer = writer;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		
		@Override
		public String toString() {
			return "HousingSearchConditionSearchCondition [title=" + title + ", content=" + content + ", writer=" + writer + "]";
		}
		
		
}
