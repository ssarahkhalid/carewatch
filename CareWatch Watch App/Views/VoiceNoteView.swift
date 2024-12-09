//
//  VoiceNoteView.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import Foundation
import SwiftUI
#if canImport(Speech) && !os(watchOS)
import Speech
#endif

struct VoiceNoteView: View {
    @Binding var notes: String
    @State private var isRecording = false
    #if canImport(Speech) && !os(watchOS)
    @State private var speechRecognizer = SFSpeechRecognizer()
    @State private var recognitionTask: SFSpeechRecognitionTask?
    @State private var audioEngine = AVAudioEngine()
    #endif
    
    var body: some View {
        VStack {
            TextField("Notes", text: $notes)
                .textFieldStyle(.plain)
                .padding()
            
            Button(action: {
                if isRecording {
                    stopRecording()
                } else {
                    startRecording()
                }
            }) {
                Image(systemName: isRecording ? "stop.circle.fill" : "mic.circle.fill")
                    .font(.system(size: 44))
                    .foregroundColor(isRecording ? .red : .blue)
            }
        }
        .onAppear {
            #if canImport(Speech) && !os(watchOS)
            requestSpeechAuthorization()
            #endif
        }
    }
    
    private func requestSpeechAuthorization() {
        #if canImport(Speech) && !os(watchOS)
        SFSpeechRecognizer.requestAuthorization { status in
            // Handle authorization status
        }
        #endif
    }
    
    private func startRecording() {
        #if canImport(Speech) && !os(watchOS)
        // Implementation for starting voice recording
        #else
        // Provide simulator feedback or alternative implementation
        print("Speech recognition not available in watchOS simulator")
        #endif
        isRecording = true
    }
    
    private func stopRecording() {
        #if canImport(Speech) && !os(watchOS)
        // Implementation for stopping voice recording
        #endif
        isRecording = false
    }
}
