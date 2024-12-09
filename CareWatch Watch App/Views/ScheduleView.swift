//
//  ScheduleView.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import Foundation
import SwiftUI

struct ScheduleView: View {
    @ObservedObject var viewModel: VisitViewModel
    
    var body: some View {
        List(viewModel.schedule.visits) { visit in
            Button(action: {
                viewModel.clockIn(visit: visit)
            }) {
                VStack(alignment: .leading) {
                    Text(visit.patientName)
                        .font(.headline)
                    Text(visit.address)
                        .font(.subheadline)
                }
            }
            .buttonStyle(.plain) // Keeps native look
        }
    }
}