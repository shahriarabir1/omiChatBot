package com.raqamiUniverse.ChatBot.service;

import lombok.RequiredArgsConstructor;
import org.springframework.ai.chat.model.ChatResponse;
import org.springframework.ai.chat.prompt.Prompt;
import org.springframework.ai.ollama.OllamaChatModel;
import org.springframework.ai.ollama.api.OllamaOptions;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LLamaAiService {
    private final OllamaChatModel chatModel;
    public String generateResult(String prompt){
        ChatResponse response=chatModel.call(
                new Prompt(
                        prompt,
                        OllamaOptions.create()
                                .withModel("llama2")
                )
        );
        return response.getResult().getOutput().getContent();
    }
}
