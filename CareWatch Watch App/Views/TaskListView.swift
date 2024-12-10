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
                TaskRow(task: task) { isCompleted in
                    viewModel.updateTask(task, isCompleted: isCompleted)
                }
            }
        }
        .navigationTitle("Tasks")
    }
}

struct TaskRow: View {
    let task: Task
    let onToggle: (Bool) -> Void
    
    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)
                .onTapGesture {
                    onToggle(!task.isCompleted)
                }
        }
    }
}