//
//  MoviesApp.swift
//  Movies
//
//  Created by Wout Crevits on 10/12/2025.
//

import SwiftUI

@main
struct MoviesApp: App {
    @State var pathStore = PathStore()
    @State var movieDataStore = MovieDataStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(movieDataStore).environment(pathStore)
        }
    }
}
