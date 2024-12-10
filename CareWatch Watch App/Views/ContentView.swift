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
                VisitView(viewModel: visitViewModel)
            }
            .tag(1)
            .tabItem {
                Label("Current", systemImage: "person.fill")
            }
        }
        .onChange(of: visitViewModel.currentVisit) { oldValue, newValue in
            if newValue != nil {
                selectedTab = 1
            }
        }
    }
}