package com.apollo.service.impl;

import java.util.List;

public interface UserService {

    List<?> getAllUsers(String type);

    Object getUserById(String type, Long id);

}
