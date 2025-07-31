package com.example.study.service.validator;


import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Constraint(validatedBy = StrongPasswordValidator.class)  // class de validate du lieu
@Target({ElementType.METHOD, ElementType.FIELD}) //pham vi validate du lieu
@Retention(RetentionPolicy.RUNTIME) // chay annotation khi runtime
@Documented
public @interface StrongPassword {
    String message() default "Minimum eight characters, at least one uppercase letter," +
            " one lowercase letter, one number and one special character";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
