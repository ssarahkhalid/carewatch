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
    let visit: Visit
    
    var body: some View {
        VStack {
            if viewModel.currentVisit == nil {
                Button("Clock In") {
                    viewModel.clockIn(visit: visit)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
            } else {
                VStack(spacing: 20) {
                    NavigationLink("View Service Tasks", destination: TaskListView(viewModel: viewModel))
                    
                    NavigationLink("Add Progress Note", destination: 
                        VoiceNoteView(notes: Binding(
                            get: { viewModel.currentVisit?.progressNotes ?? "" },
                            set: { viewModel.updateNotes($0) }
                        ))
                    )
                    
                    Button("Clock Out") {
                        viewModel.clockOut()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
            }
        }
        .navigationTitle(visit.patientName)
    }
}
