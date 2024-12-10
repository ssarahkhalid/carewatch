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
            NavigationLink(destination: VisitView(viewModel: viewModel, visit: visit)) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(visit.patientName)
                        .font(.headline)
                        .lineLimit(1)
                        .foregroundColor(visit == viewModel.currentVisit ? .green : .primary)
                    Text(visit.address)
                        .font(.subheadline)
                        .lineLimit(2)
                        .foregroundColor(visit == viewModel.currentVisit ? .green : .primary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(getVisitBackgroundColor(visit))
                )
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Schedule")
    }
    
    private func getVisitBackgroundColor(_ visit: Visit) -> Color {
        if visit.isCompleted {
            return Color.blue
        } else if viewModel.currentVisit?.id == visit.id {
            return Color.green
        }
        return Color.blue.opacity(0.3)
    }
}