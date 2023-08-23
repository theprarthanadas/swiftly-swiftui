//
//  Mission.swift
//  Moonshot
//
//  Created by Prarthana Das on 23/08/23.
//

import Foundation



struct Mission: Identifiable, Codable {
    
    struct CrewRole: Codable{
        var name: String
        var role: String
    }
    
    var id: Int
    var crew: [CrewRole]
    var description: String
    var launchDate: Date?
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
}
