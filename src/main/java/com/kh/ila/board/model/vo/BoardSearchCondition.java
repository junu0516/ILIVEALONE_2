package com.kh.ila.board.model.vo;

public class BoardSearchCondition {

		private String title;
		private String content;
		private String writer;
		
		public BoardSearchCondition() {
		
		}
		public BoardSearchCondition(String title, String content, String writer) {
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
			return "BoardSearchCondition [title=" + title + ", content=" + content + ", writer=" + writer + "]";
		}
		
		
}
