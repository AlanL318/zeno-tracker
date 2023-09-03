//
//  zenoApp.swift
//  zeno
//
//  Created by Alan Liu on 8/17/23.
//

import SwiftUI
import SwiftData

@main
struct zenoApp: App {
    
    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: HabitList.self)
        } catch {
            fatalError("Could not initalize ModelContainer")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: HabitList.self)
        }
    }
}
