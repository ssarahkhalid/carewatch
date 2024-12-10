//
//  TaskListView.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import Foundation
import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: VisitViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.currentVisit?.tasks ?? []) { task in
                TaskRow(task: task) { isCompleted, note in
                    viewModel.updateTask(task, isCompleted: isCompleted, note: note)
                }
            }
        }
        .navigationTitle("Tasks")
    }
}

struct TaskRow: View {
    let task: Task
    let onToggle: (Bool, String?) -> Void
    @State private var showingNoteSheet = false
    @State private var note = ""
    
    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            HStack(spacing: 10) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    .onTapGesture {
                        onToggle(true, nil)
                    }
                
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(!task.isCompleted ? .red : .gray)
                    .onTapGesture {
                        showingNoteSheet = true
                    }
            }
        }
        .sheet(isPresented: $showingNoteSheet) {
            NavigationView {
                Form {
                    TextField("ADL Comment", text: $note)
                }
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            onToggle(false, note)
                            note = ""
                            showingNoteSheet = false
                        }
                        .disabled(note.isEmpty)
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            note = ""
                            showingNoteSheet = false
                        }
                    }
                }
            }
        }
    }
}