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
                  startTime: Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!,
                  endTime: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date())!,
                  address: "123 Main St",
                  tasks: sampleTasks,
                  progressNotes: nil,
                  isCompleted: false,
                  displayTime: "9:00 AM - 10:00 AM"),
            Visit(patientName: "Jane Smith",
                 startTime: Calendar.current.date(bySettingHour: 10, minute: 30, second: 0, of: Date())!,
                 endTime: Calendar.current.date(bySettingHour: 11, minute: 30, second: 0, of: Date())!,
                 address: "456 Oak Ave",
                 tasks: sampleTasks,
                 progressNotes: nil,
                 isCompleted: false,
                 displayTime: "10:30 AM - 11:30 AM")
        ]
        
        self.schedule = Schedule(visits: sampleVisits, date: Date())
    }
    
    private func formatDisplayTime(start: Date, end: Date?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let startString = formatter.string(from: start)
        guard let end = end else { return startString }
        let endString = formatter.string(from: end)
        return "\(startString) - \(endString)"
    }
    
    func clockIn(visit: Visit) {
        var updatedVisit = visit
        updatedVisit.startTime = Date()
        updatedVisit.displayTime = formatDisplayTime(start: updatedVisit.startTime, end: updatedVisit.endTime)
        currentVisit = updatedVisit
    }
    
    func clockOut() {
        if let index = schedule.visits.firstIndex(where: { $0.id == currentVisit?.id }) {
            schedule.visits[index].isCompleted = true
        }
        currentVisit = nil
    }
    
    func updateNotes(_ notes: String) {
        guard var visit = currentVisit else { return }
        visit.progressNotes = notes
        currentVisit = visit
    }
    
    func updateTask(_ task: Task, isCompleted: Bool, note: String? = nil) {
        guard var visit = currentVisit else { return }
        if let index = visit.tasks.firstIndex(where: { $0.id == task.id }) {
            visit.tasks[index].isCompleted = isCompleted
            currentVisit = visit
        }
    }
}
