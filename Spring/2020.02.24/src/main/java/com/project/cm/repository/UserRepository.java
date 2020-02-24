package com.project.cm.repository;

import com.project.cm.model.entity.User;
import org.graalvm.compiler.nodes.calc.IntegerDivRemNode;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User,Long> {

    Optional<User> findByAccount(String account);

    Optional<User> findByEmail(String email);

    Optional<User> findAllByAccountAndEmail(String account, String email);

}
