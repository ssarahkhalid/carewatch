//
//  VisitViewModel.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import Foundation

class VisitViewModel: ObservableObject {
    @Published var currentVisit: Visit?
    @Published var schedule: Schedule
    
    init() {
        // Initialize with empty schedule
        self.schedule = Schedule(visits: [], date: Date())
        
        // Add some sample data
        let sampleTasks = [
            Task(title: "Check blood pressure", isCompleted: false, notes: "Target: 120/80"),
            Task(title: "Give medication", isCompleted: false, notes: "2 pills with water"),
            Task(title: "Check temperature", isCompleted: false, notes: "Normal range: 97-99°F")
        ]
        
        let sampleVisits = [
            Visit(patientName: "John Doe", 
                  startTime: Date(),
                  address: "123 Main St",
                  tasks: sampleTasks,
                  isCompleted: false),
            Visit(patientName: "Jane Smith",
                 startTime: Date().addingTimeInterval(3600),
                 address: "456 Oak Ave",
                 tasks: sampleTasks,
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
        guard var visit = currentVisit else { return }
        visit.progressNotes = notes
        currentVisit = visit
    }
}
