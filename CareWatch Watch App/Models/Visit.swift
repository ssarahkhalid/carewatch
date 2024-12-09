//
//  Visit.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import Foundation

struct Visit: Identifiable, Equatable {
    let id = UUID()
    var patientName: String
    var startTime: Date
    var endTime: Date?
    var address: String
    var tasks: [Task]
    var progressNotes: String?
    var isCompleted: Bool
    
    static func == (lhs: Visit, rhs: Visit) -> Bool {
        lhs.id == rhs.id
    }
}