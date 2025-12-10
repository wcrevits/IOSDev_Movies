//
//  ContentView.swift
//  Movies
//
//  Created by Wout Crevits on 10/12/2025.
//

import SwiftUI

struct ContentView: View {
    @State var loading = true
    @Environment(MovieDataStore.self) var movieDataStore
    var body: some View {
        VStack {
            if loading {
                ProgressView("Loading")
            }
            else {
                MoviesView()
            }
        }.task {
            await movieDataStore.loadData()
            loading = false
        }
    }
}
