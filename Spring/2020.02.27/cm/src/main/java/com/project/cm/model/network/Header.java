package com.project.cm.model.network;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Header<T> {
    private LocalDateTime transactionTime; // api 통신시간

    private String resultCode; // api 응답코드

    private String description;  // api 설명

    private Pagination pagination;

    private T data;

    public static <T> Header<T> OK() { // OK
        return (Header<T>)Header.builder()
        .transactionTime(LocalDateTime.now())
        .resultCode("OK")
        .description("OK")
        .build();
    }

    public static <T> Header<T> OK(T data) { // OK
        return (Header<T>)Header.builder()
                .transactionTime(LocalDateTime.now())
                .resultCode("OK")
                .description("OK")
                .data(data)
                .build();
    }

    public static <T> Header<T> OK(T data, Pagination pagination) { // OK
        return (Header<T>)Header.builder()
                .transactionTime(LocalDateTime.now())
                .resultCode("OK")
                .description("OK")
                .data(data)
                .pagination(pagination)
                .build();
    }

    public static <T> Header<T> ERROR(String description) { // OK
        return (Header<T>)Header.builder()
                .transactionTime(LocalDateTime.now())
                .resultCode("ERROR")
                .description(description)
                .build();
    }
}
