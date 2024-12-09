//
//  VisitView.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import Foundation
import SwiftUI

struct VisitView: View {
    @ObservedObject var viewModel: VisitViewModel
    @State private var showingTasks = false
    @State private var showingVoiceNote = false
    @State private var progressNotes: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                if let visit = viewModel.currentVisit {
                    Text(visit.patientName)
                        .font(.title3)
                        .bold()
                    
                    Button(action: { showingTasks.toggle() }) {
                        Label("Tasks", systemImage: "checklist")
                            .frame(maxWidth: .infinity)
                    }
                    .sheet(isPresented: $showingTasks) {
                        TaskListView(tasks: visit.tasks)
                    }
                    
                    Button(action: { showingVoiceNote.toggle() }) {
                        Label("Progress Note", systemImage: "mic.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .sheet(isPresented: $showingVoiceNote) {
                        VoiceNoteView(notes: $progressNotes)
                            .onDisappear {
                                viewModel.updateNotes(progressNotes)
                            }
                    }
                    
                    Button(action: { viewModel.clockOut() }) {
                        Label("Clock Out", systemImage: "arrow.right.circle.fill")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding()
        }
    }
}