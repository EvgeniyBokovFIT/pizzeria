package com.boots.repository;

import com.boots.entity.RegisteredUsers;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegisteredUsersRepository extends JpaRepository<RegisteredUsers, Long> {
    RegisteredUsers findByMail(String mail);
}
