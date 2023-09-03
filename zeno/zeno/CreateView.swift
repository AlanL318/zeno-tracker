//
//  CreateView.swift
//  zeno
//
//  Created by Alan Liu on 8/17/23.
//

import SwiftUI
import SwiftData

struct CreateView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var item = HabitList()
    
    var body: some View {

            List {
                TextField("Name", text: $item.title)
                Button("Create") {
                    withAnimation {
                        context.insert(item)
                    }
                    dismiss()
                }
            }
            .background(.charcoal)
            .scrollContentBackground(.hidden)
            }
        }


#Preview {
    CreateView()
        .modelContainer(for: HabitList.self)
}
