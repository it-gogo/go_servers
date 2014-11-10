package com.go.common.fileupload;

/**
 * 文件进度实体
 */
public class Go_ProgressEntity {
	private long pBytesRead = 0L;//已读文件数
	private long pContentLength = 0L;//文件总长度
	private int pItems;//数量
	public long getpBytesRead() {
		return pBytesRead;
	}
	public void setpBytesRead(long pBytesRead) {
		this.pBytesRead = pBytesRead;
	}
	public long getpContentLength() {
		return pContentLength;
	}
	public void setpContentLength(long pContentLength) {
		this.pContentLength = pContentLength;
	}
	public int getpItems() {
		return pItems;
	}
	public void setpItems(int pItems) {
		this.pItems = pItems;
	}
	@Override
	public String toString() {
		return "ProgressEntity [pBytesRead=" + pBytesRead + ", pContentLength="
				+ pContentLength + ", pItems=" + pItems + "]";
	}
}
