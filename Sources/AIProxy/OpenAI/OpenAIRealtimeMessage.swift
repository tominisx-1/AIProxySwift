//
//  OpenAIRealtimeMessage.swift
//  AIProxy
//
//  Created by Lou Zell on 12/29/24.
//  Update by harr-sudo 05/05/2025

nonisolated public enum OpenAIRealtimeMessage: Sendable {
    case error(String?)
    case sessionCreated // "session.created"
    case sessionUpdated // "session.updated"
    case responseCreated // "response.created"
    case responseAudioDelta(String) // "response.audio.delta"
    case inputAudioBufferSpeechStarted // "input_audio_buffer.speech_started"
    case responseFunctionCallArgumentsDone(String, String, String) // "response.function_call_arguments.done"
    
    // Add new cases for transcription
    case responseTranscriptDelta(EnrichedResponseTranscriptDelta) // "response.audio_transcript.delta"
    case responseTranscriptDone(EnrichedResponseTranscriptDelta) // "response.audio_transcript.done"
    case inputAudioBufferTranscript(String) // "input_audio_buffer.transcript"
    case inputAudioTranscriptionDelta(EnrichedInputTranscriptDelta) // "conversation.item.input_audio_transcription.delta"
    case inputAudioTranscriptionCompleted(EnrichedInputTranscriptDelta) // "conversation.item.input_audio_transcription.completed"
}



//response.output_audio_transcript.delta
public struct EnrichedResponseTranscriptDelta: Sendable {
    public let content_index: Int
    public let text: String
    public let event_id: String
    public let item_id: String
    public let output_index: Int
    public let response_id: String
    public let is_done: Bool
    
    public init(
        content_index: Int,
        text: String,
        event_id: String,
        item_id: String,
        output_index: Int,
        response_id: String,
        is_done: Bool
    ) {
        self.content_index = content_index
        self.text = text
        self.event_id = event_id
        self.item_id = item_id
        self.output_index = output_index
        self.response_id = response_id
        self.is_done = is_done
    }

}




//conversation.item.input_audio_transcription.delta
public struct EnrichedInputTranscriptDelta: Sendable {
    public let content_index: Int
    public let text: String
    public let event_id: String
    public let item_id: String
    public let is_done: Bool
    
    public init(
        content_index: Int,
        text: String,
        event_id: String,
        item_id: String,
        is_done: Bool
    ) {
        self.content_index = content_index
        self.text = text
        self.event_id = event_id
        self.item_id = item_id
        self.is_done = is_done
    }

}
