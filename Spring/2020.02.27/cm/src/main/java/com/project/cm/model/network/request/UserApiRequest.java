package com.project.cm.model.network.request;

import com.project.cm.model.enumclass.UserStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.procedure.spi.ParameterRegistrationImplementor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserApiRequest {

    private  Long id;

    private String account;
    private  String password;
    private UserStatus status;
    private String email;
    private String phoneNumber;

    private LocalDateTime registeredAt;
    private LocalDateTime unregisteredAt;
}
