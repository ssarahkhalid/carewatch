//
//  VisitViewModel.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import Foundation
import SwiftUI

class VisitViewModel: ObservableObject {
    @Published var currentVisit: Visit?
    @Published var schedule: Schedule
    @Published var isClockingIn = false
    
    init() {
        // Add sample visits
        let sampleVisits = [
            Visit(patientName: "John Doe", 
                  startTime: Date(),
                  endTime: nil,
                  address: "123 Main St", 
                  tasks: [],
                  isCompleted: false),
            Visit(patientName: "Jane Smith", 
                  startTime: Date().addingTimeInterval(3600),
                  endTime: nil,
                  address: "456 Oak Ave", 
                  tasks: [],
                  isCompleted: false)
        ]
        
        self.schedule = Schedule(visits: sampleVisits, date: Date())
    }
    
    func clockIn(visit: Visit) {
        var updatedVisit = visit
        updatedVisit.startTime = Date()
        currentVisit = updatedVisit
    }
    
    func clockOut() {
        guard var visit = currentVisit else { return }
        visit.endTime = Date()
        visit.isCompleted = true
        currentVisit = nil
    }
    
    func updateNotes(_ notes: String) {
        if var visit = currentVisit {
            visit.progressNotes = notes
            currentVisit = visit
        }
    }
}
