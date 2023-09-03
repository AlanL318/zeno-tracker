//
//  HabitList.swift
//  zeno
//
//  Created by Alan Liu on 8/17/23.
//

import Foundation
import SwiftData


@Model
final class HabitList {
    var title: String
    var isCompleted: Bool
    
    init(title: String = "", isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
    
}
