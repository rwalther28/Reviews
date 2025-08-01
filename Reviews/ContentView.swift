//
//  ContentView.swift
//  Reviews
//
//  Created by rwalther28 on 7/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let items = ["English", "Science", "Math", "Social Studies"]
    var filteredItems: [String] {
        if searchText.isEmpty {
            return []
        } else {
            return items.filter {$0.localizedCaseInsensitiveContains(searchText)}
        }
    }
    var body: some View {
        NavigationStack {
            List(filteredItems, id: \.self) { item in
            Text(item)
            }
            .listStyle(.plain)
            .navigationTitle("Buff 'n' Blue Reviews")
            .searchable(text: $searchText, prompt: "Search for a class")
            VStack {
                
            }
            .navigationTitle("Buff 'n' Blue Reviews")
        }
    }
}

#Preview {
    ContentView()
}
