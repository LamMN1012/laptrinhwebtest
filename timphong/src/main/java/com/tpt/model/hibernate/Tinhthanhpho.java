package com.tpt.model.hibernate;
// default package
// Generated Dec 5, 2022, 10:49:34 PM by Hibernate Tools 4.3.6.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Tinhthanhpho generated by hbm2java
 */
@Entity
@Table(name = "tinhthanhpho", catalog = "timphong")
public class Tinhthanhpho implements java.io.Serializable {

	private Long id;
	private Quocgia quocgia;
	private String tenTinhThanhPho;
	private Set<Quanhuyen> quanhuyens = new HashSet<Quanhuyen>(0);

	public Tinhthanhpho() {
	}

	public Tinhthanhpho(Quocgia quocgia, String tenTinhThanhPho) {
		this.quocgia = quocgia;
		this.tenTinhThanhPho = tenTinhThanhPho;
	}

	public Tinhthanhpho(Quocgia quocgia, String tenTinhThanhPho, Set<Quanhuyen> quanhuyens) {
		this.quocgia = quocgia;
		this.tenTinhThanhPho = tenTinhThanhPho;
		this.quanhuyens = quanhuyens;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "ID", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "quocGiaId", nullable = false)
	public Quocgia getQuocgia() {
		return this.quocgia;
	}

	public void setQuocgia(Quocgia quocgia) {
		this.quocgia = quocgia;
	}

	@Column(name = "tenTinhThanhPho", nullable = false, length = 200)
	public String getTenTinhThanhPho() {
		return this.tenTinhThanhPho;
	}

	public void setTenTinhThanhPho(String tenTinhThanhPho) {
		this.tenTinhThanhPho = tenTinhThanhPho;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tinhthanhpho")
	public Set<Quanhuyen> getQuanhuyens() {
		return this.quanhuyens;
	}

	public void setQuanhuyens(Set<Quanhuyen> quanhuyens) {
		this.quanhuyens = quanhuyens;
	}

}
