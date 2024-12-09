//
//  ContentView.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = VisitViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ScheduleView(viewModel: viewModel)
            }
            .tag(0)
            .tabItem {
                Label("Schedule", systemImage: "calendar")
            }
            
            NavigationStack {
                VisitView(viewModel: viewModel)
            }
            .tag(1)
            .tabItem {
                Label("Current", systemImage: "person.fill")
            }
        }
        .onChange(of: viewModel.currentVisit) { oldValue, newValue in
            if newValue != nil {
                selectedTab = 1
            }
        }
    }
}
