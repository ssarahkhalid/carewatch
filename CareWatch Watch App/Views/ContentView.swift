//
//  ContentView.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var visitViewModel = VisitViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ScheduleView(viewModel: visitViewModel)
            }
            .tag(0)
            .tabItem {
                Label("Schedule", systemImage: "calendar")
            }
            
            NavigationStack {
                if let currentVisit = visitViewModel.currentVisit {
                    VisitView(viewModel: visitViewModel, visit: currentVisit)
                } else {
                    Text("No active visit")
                        .foregroundColor(.secondary)
                }
            }
            .tag(1)
            .tabItem {
                Label(visitViewModel.currentVisit != nil ? "Active Visit" : "Current", 
                      systemImage: visitViewModel.currentVisit != nil ? "person.fill.checkmark" : "person.fill")
            }
        }
        .onChange(of: visitViewModel.currentVisit) { _, newVisit in
            if newVisit != nil {
                selectedTab = 1
            }
        }
    }
}