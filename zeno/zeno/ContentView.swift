//
//  ContentView.swift
//  zeno
//
//  Created by Alan Liu on 8/17/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var context

    @State private var showCreate = false
    @Query private var items: [HabitList]
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("background")
                    .ignoresSafeArea()
                    .overlay(alignment: .topLeading) {
                        Image(systemName: "house.fill")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .padding(.top, 50.0)
                            .padding(.leading, 25.0)
                            .foregroundColor(.white)

                    }
                
                VStack(alignment: .leading)  {
                    Text(
                        Date()
                            .formatted(date: .complete, time: .omitted)
                    )
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding([.top, .leading])
                    
                    List {
                        Section {
                            ForEach(items) { item in
                                HStack {
                                    Text(item.title)
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(.white)
                                    Spacer()
                                    
                                    Button {
                                        withAnimation {
                                            item.isCompleted.toggle()
                                        }
                                    } label: {
                                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                            .font(.largeTitle)
                                            .contentTransition(.symbolEffect(.replace.offUp.wholeSymbol))
                                            .foregroundColor(.white)
                                    }
                                    .buttonStyle(.plain)
                                    
                                    
                                }
                                .swipeActions {
                                    Button(role: .destructive) {
                                        
                                        withAnimation {
                                            context.delete(item)
                                        }
                                        
                                    } label: {
                                        Label("Delete", systemImage: "Trash")
                                            .symbolVariant(.fill)
                                    }
                                }
                            }
                            .listRowBackground(Color.charcoal)
                            .listRowSeparator(.hidden)
                        } header: { Text("habits").foregroundStyle(Color.white)}
                        
                    }
                    .background {
                        Color.clear
                    }
                    .scrollContentBackground(.hidden)
                }
                .padding(.top, 200)
                
            }
            
            
            
                    .toolbar {
                        ToolbarItem {
                            Button(action: { showCreate.toggle()
                            }, label: {
                                Label("Add Item", systemImage: "plus")
                            })
                            
                        }
                    }
                    .sheet(isPresented: $showCreate, content: {
                        NavigationStack{
                            CreateView()
                        }
                        .presentationDetents([.medium])
                    })
            }
        }
        
    }


#Preview {
    ContentView()
}
