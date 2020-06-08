package com.example.demo.member.vo;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

@Service
public class RestTemplateTestService {

    private ApiService<Response> apiService;

    @Autowired
    public RestTemplateTestService(ApiService<Response> apiService) {
        this.apiService = apiService;
    }

    public Response callPostExternalServer() {
        Person person = new Person();
        person.setName("jake");
        person.setAge(10);
        person.info.put("gender", "male");

        return apiService.post("https://postman-echo.com/post", HttpHeaders.EMPTY, person, Response.class).getBody();
    }
}


