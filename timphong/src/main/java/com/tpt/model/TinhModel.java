package com.tpt.model;

import java.util.List;

public class TinhModel
{
	private int matinh;
	private String tentinh;
	//private List<Huyen> huyens;
	//private List<Phong> phongs;
	public TinhModel()
	{
	}
	public TinhModel(int matinh, String tentinh, List<HuyenModel> huyens, List<PhongModel> phongs)
	{
		super();
		this.matinh = matinh;
		this.tentinh = tentinh;
		//this.huyens = huyens;
		//this.phongs = phongs;
	}
	public int getMatinh()
	{
		return matinh;
	}
	public void setMatinh(int matinh)
	{
		this.matinh = matinh;
	}
	public String getTentinh()
	{
		return tentinh;
	}
	public void setTentinh(String tentinh)
	{
		this.tentinh = tentinh;
	}
	/*
	public List<Huyen> getHuyens()
	{
		return huyens;
	}
	public void setHuyens(List<Huyen> huyens)
	{
		this.huyens = huyens;
	}
	public List<Phong> getPhongs()
	{
		return phongs;
	}
	public void setPhongs(List<Phong> phongs)
	{
		this.phongs = phongs;
	}
	*/
	
	
}
