//
//  Entry.swift
//  Journal
//
//  Created by Darianne Salinas on 6/1/22.
//

import Foundation

class Entry: Codable {
    var title: String
    var body: String
    let timestamp: Date
    
    init(title: String, body: String, timestamp: Date = Date()) {   //added default value to date
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
}

/* Implement the Equatable protocol for the Entry class. The Equatable protocol helps to check for equality between variables of a specific class. To ensure that the two objects we are comparing are the same, we will need to make sure the values of all the variables (title, body, and timestamp) are the same.
 */
extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.body == rhs.body && lhs.timestamp == rhs.timestamp
    }
}
