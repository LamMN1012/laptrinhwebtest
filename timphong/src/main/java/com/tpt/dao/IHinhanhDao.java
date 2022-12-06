package com.tpt.dao;

import java.util.List;

import com.tpt.model.HinhanhModel;

public interface IHinhanhDao
{
	public List<HinhanhModel> getHinhanhP(int id_p);
	public boolean insertHinhanh(HinhanhModel hinhanh);
	public boolean deleteHinhanh(String hinhanh);
	public boolean editHinhanh(String newhinhanh, String oldHinhanh);
	public boolean deleteHinhanhP(int id_p);
	
}
