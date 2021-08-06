package com.jun.potal.vo;

public class ServiceType {

	private int stIdx;
	private String info;
	
	public ServiceType() {
		
	}

	public int getStIdx() {
		return stIdx;
	}

	public void setStIdx(int stIdx) {
		this.stIdx = stIdx;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Override
	public String toString() {
		return "ServiceType [stIdx=" + stIdx + ", info=" + info + "]";
	}
	
	
	
	
	
}
