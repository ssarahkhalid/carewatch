//
//  Schedule.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import Foundation

struct Schedule {
    var visits: [Visit]
    var date: Date
    
    func visitsForToday() -> [Visit] {
        // For now, return all visits
        return visits
    }
}