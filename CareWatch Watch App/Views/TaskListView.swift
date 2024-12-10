//
//  TaskListView.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import Foundation
import SwiftUI

struct TaskListView: View {
    @Binding var tasks: [Task]
    
    var body: some View {
        List {
            ForEach($tasks) { $task in
                HStack {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(task.isCompleted ? .green : .gray)
                        .onTapGesture {
                            task.isCompleted.toggle()
                        }
                    
                    VStack(alignment: .leading) {
                        Text(task.title)
                            .strikethrough(task.isCompleted)
                        if let notes = task.notes {
                            Text(notes)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
    }
}