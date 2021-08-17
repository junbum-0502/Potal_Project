package com.jun.potal.common.paging;

public class Paging {

	// 입력받을 값
	private String type; // 페이징 처리할 항목
	private int currentPage; // 현재 페이지
	private int total; // 전체 게시물 수
	private int cntPerPage; // 페이지당 게시물 수
	private int blockCnt; // 하단에 표시될 페이지블록 개수
	private String sort; // 정렬 기준 컬럼
	private String direction; // 정렬 방향
	private String title;
	private String author;
	
	// 계산할 값
	private int blockStart; // 시작블록
	private int blockEnd; // 마지막 블록
	private int lastPage; // 마지막 페이지
	private int prev; // 이전 버튼
	private int next; // 다음 버튼
	
	// 쿼리 between 문에서 사용할 rownum 범위
	private int queryStart;
	private int queryEnd;
	
	private Paging(PagingBuilder builder) {
		this.type = builder.type;
		this.currentPage = builder.currentPage;
		this.total = builder.total;
		this.cntPerPage = builder.cntPerPage;
		this.blockCnt = builder.blockCnt;	
		this.sort = builder.sort;
		this.direction = builder.direction;
		this.title = builder.title;
		this.author = builder.author;
		calBlockStartAndEnd();	
		calQueryStartAndEnd();
		calPrevAndNext();
	}
	
	public static PagingBuilder builder() {
		return new PagingBuilder();
	}
	
	private void calLastPage() {
		lastPage = (total-1) / cntPerPage + 1;
	}
	
	private void calBlockStartAndEnd() {
		calLastPage(); // 마지막페이지 계산
		
		blockStart = ((currentPage-1)/blockCnt) * blockCnt + 1;
		blockEnd = blockStart + blockCnt - 1;
		
		blockStart = blockStart < 1? 1:blockStart;
		blockEnd = blockEnd > lastPage ? lastPage:blockEnd;
	}
	
	private void calQueryStartAndEnd() {
		queryEnd = currentPage * cntPerPage;
		queryStart = queryEnd - cntPerPage + 1;
	}
	
	private void calPrevAndNext() {
		prev = currentPage == 1? 1 : currentPage -1;
		next = currentPage == lastPage? lastPage : currentPage + 1;
	}
	
	public static class PagingBuilder{
		private String type; // 페이징 처리할 항목
		private int currentPage; // 현재 페이지
		private int total; // 전체 게시물 수
		private int cntPerPage; // 페이지당 게시물 수
		private int blockCnt; // 하단에 표시될 페이지블록 개수
		private String sort;
		private String direction;
		private String title;
		private String author;
		
		public PagingBuilder type(String val) {
			this.type = val;
			return this;
		}
		
		public PagingBuilder currentPage(int val) {
			this.currentPage = val;
			return this;
		}
		
		public PagingBuilder total(int val) {
			this.total = val;
			return this;
		}
		
		public PagingBuilder cntPerPage(int val) {
			this.cntPerPage = val;
			return this;
		}
		
		public PagingBuilder blockCnt(int val) {
			this.blockCnt = val;
			return this;
		}
		
		public PagingBuilder sort(String val) {
			this.sort = val;
			return this;
		}
		
		public PagingBuilder direction(String val) {
			this.direction = val;
			return this;
		}
		
		public PagingBuilder title(String val) {
			this.title = val;
			return this;
		}
		
		public PagingBuilder author(String val) {
			this.author = val;
			return this;
		}
		
		public Paging build() {
			return new Paging(this);
		}
	}
	
	
	
	public void setType(String type) {
		this.type = type;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public void setBlockCnt(int blockCnt) {
		this.blockCnt = blockCnt;
	}

	public String getType() {
		return type;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public int getTotal() {
		return total;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public int getBlockCnt() {
		return blockCnt;
	}
	public int getBlockStart() {
		return blockStart;
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public int getLastPage() {
		return lastPage;
	}
	public int getPrev() {
		return prev;
	}
	public int getNext() {
		return next;
	}
	public int getQueryStart() {
		return queryStart;
	}
	public int getQueryEnd() {
		return queryEnd;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Override
	public String toString() {
		return "Paging [type=" + type + ", currentPage=" + currentPage + ", total=" + total + ", cntPerPage="
				+ cntPerPage + ", blockCnt=" + blockCnt + ", sort=" + sort + ", direction=" + direction + ", title="
				+ title + ", author=" + author + ", blockStart=" + blockStart + ", blockEnd=" + blockEnd + ", lastPage="
				+ lastPage + ", prev=" + prev + ", next=" + next + ", queryStart=" + queryStart + ", queryEnd="
				+ queryEnd + "]";
	}

	
	

}
