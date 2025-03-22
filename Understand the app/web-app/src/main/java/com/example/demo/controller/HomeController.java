package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.net.InetAddress;
import java.net.UnknownHostException;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        try {
            // Get the local IP address of the server
            String ipAddress = InetAddress.getLocalHost().getHostAddress();
            model.addAttribute("ipAddress", ipAddress);
        } catch (UnknownHostException e) {
            e.printStackTrace();
            model.addAttribute("ipAddress", "Unable to fetch IP");
        }

        return "index";
    }
}
