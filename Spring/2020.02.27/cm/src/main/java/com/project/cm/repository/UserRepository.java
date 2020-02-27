package com.project.cm.repository;

import com.project.cm.model.entity.User;
import org.graalvm.compiler.nodes.calc.IntegerDivRemNode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

    User findFirstByPhoneNumberOrderByIdDesc(String phoneNumber);

}
