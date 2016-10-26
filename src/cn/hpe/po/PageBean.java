package cn.hpe.po;

import java.util.List;


/**
 * 分页实体类
 * @author Administrator
 *
 */
public class PageBean {
	private int currentPage = 1   ;  //当前页数  
	private int perPageRows = 10; // 每页显示结果条数
	
	private int totalPage;      //总页数
	private int totalSize;      // 总条数
	
	private List<?> result;         // 返回的结果集

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPerPageRows() {
		return perPageRows;
	}

	public void setPerPageRows(int perPageRows) {
		this.perPageRows = perPageRows;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}

	public List<?> getResult() {
		return result;
	}

	public void setResult(List<?> result) {
		this.result = result;
	}
	public PageBean(){
		
	}

	public PageBean(int currentPage, int perPageRows, int totalPage, int totalSize,
			List<?> result) {
		super();
		this.currentPage = currentPage;
		this.perPageRows = perPageRows;
		this.totalPage = totalPage;
		this.totalSize = totalSize;
		this.result = result;
	}

	@Override
	public String toString() {
		return "PageBean [nowPage=" + currentPage + ", perPageRows=" + perPageRows
				+ ", allPages=" + totalPage + ", totalRows=" + totalSize
				+ ", result=" + result + "]";
	}

}
