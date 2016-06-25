package ltx.model;

import java.io.Serializable;

public class Pagination implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 145646464664632L;

	private int pageNum = 1; // 当前页数

	private int pageSize = 10; // 每页显示记录的条数

	private int totalCount; // 总的记录条数

	private int totalPageCount; // 总的页数

	@SuppressWarnings("unused")
	private int startPos; // 开始位置，从0开始

	@SuppressWarnings("unused")
	private boolean hasFirst;// 是否有首页

	@SuppressWarnings("unused")
	private boolean hasPre;// 是否有前一页

	@SuppressWarnings("unused")
	private boolean hasNext;// 是否有下一页

	@SuppressWarnings("unused")
	private boolean hasLast;// 是否有最后一页

	public Pagination(int totalCount, int pageNum) {
		this.totalCount = totalCount;
		this.pageNum = pageNum;
	}

	public int getTotalPageCount() {
		totalPageCount = getTotalCount() / getPageSize();
		return (totalCount % pageSize == 0) ? totalPageCount
				: totalPageCount + 1;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartPos() {
		return (pageNum - 1) * pageSize;
	}

	public void setStartPos(int startPos) {
		this.startPos = startPos;
	}

	/**
	 * 是否是第一页
	 * 
	 * @return
	 */
	public boolean isHasFirst() {
		return (pageNum == 1) ? false : true;
	}

	public void setHasFirst(boolean hasFirst) {
		this.hasFirst = hasFirst;
	}

	public boolean isHasPre() {
		// 如果有首页就有前一页，因为有首页就不是第一页
		return isHasFirst() ? true : false;
	}

	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}

	public boolean isHasNext() {
		// 如果有尾页就有下一页，因为有尾页表明不是最后一页
		return isHasLast() ? true : false;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	public boolean isHasLast() {
		// 如果不是最后一页就有尾页
		return (pageNum == getTotalCount()) ? false : true;
	}

	public void setHasLast(boolean hasLast) {
		this.hasLast = hasLast;
	}

}