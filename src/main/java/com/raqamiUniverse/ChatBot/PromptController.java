package com.raqamiUniverse.ChatBot;

import com.raqamiUniverse.ChatBot.service.LLamaAiService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class PromptController {
    private final LLamaAiService llamaAiService;
    @GetMapping("/message/ai")
    public String generate(@RequestParam String message){
       return llamaAiService.generateResult(message);
    }
}
