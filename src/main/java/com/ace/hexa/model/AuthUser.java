package com.ace.hexa.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AuthUser {
    private long user_id;
    private String user_name;
    private String user_email;
    private String user_password;
    private int role_id;
    private String user_role;
    private int _token;
}
