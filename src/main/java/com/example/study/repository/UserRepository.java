package com.example.study.repository;

import com.example.study.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User  newUser);
    List<User> findAllByEmail(String email);
    List<User> findAll();
}
