//
//  ContentView.swift
//  Reviews
//
//  Created by rwalther28 on 7/31/25.
//

import SwiftUI

extension Color {
    static let brightYellow = Color(red: 1.0, green: 1.0, blue: 0.2)
    static let deepBlue = Color(red: 0, green: 0.2, blue: 0.6)
}

struct ContentView: View {
    @State private var searchText = ""
    @State private var showingWriteReview = false
    let items = ["English", "Science", "Math", "Social Studies"]
    
    var filteredItems: [String] {
        if searchText.isEmpty {
            return []
        } else {
            return items.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredItems, id: \.self) { item in
                Text(item)
                    .foregroundColor(.deepBlue)
                    .padding(5)
            }
            .listStyle(.plain)
            .background(Color.brightYellow.opacity(0.3))
            .navigationTitle("Buff 'n' Blue Reviews")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingWriteReview = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.deepBlue)
                    }
                }
            }
            .searchable(text: $searchText, prompt: Text("Search for a class").foregroundColor(.deepBlue))
            .sheet(isPresented: $showingWriteReview) {
                WriteReview()
            }
        }
    }
}

struct WriteReview: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                // form
            }
            .navigationTitle("Add a Review")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.deepBlue)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        dismiss()
                    }
                    .foregroundColor(.deepBlue)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
