package com.study.www.dto;

import lombok.Data;

@Data
public class BoardVO {
	
	private Integer no;
	private String b_title;
	private String b_content;
	private String b_name;
	private Integer b_check;
	private String b_joindate;
	private String b_updatedate;
	private String b_pub;
}
