//
//  Task.swift
//  CareWatch Watch App
//
//  Created by sarah khalid on 2024-12-07.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
    let notes: String
}
