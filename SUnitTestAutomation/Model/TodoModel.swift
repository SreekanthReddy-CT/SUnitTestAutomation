//
//  TodoModel.swift
//  SUnitTestAutomation
//
//  Created by YML on 31/07/23.
//

import Foundation

struct TodoModel: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var completed: Bool = false
}
