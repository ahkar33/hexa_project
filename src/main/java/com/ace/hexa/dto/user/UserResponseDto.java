package com.ace.hexa.dto.user;

import lombok.Data;

@Data
public class UserResponseDto {

	private long user_id;
	private String user_name;
	private int user_role;
	private String user_role_name;
	private String user_email;
	private String user_password;
	private int user_status;
}
