//
//  moviesView.swift
//  Movies
//
//  Created by Wout Crevits on 10/12/2025.
//

import SwiftUI

struct MoviesView: View {
    @State var selectedMovie : Movie?
    @Environment(MovieDataStore.self) var movieDataStore
    @Environment(PathStore.self) var pathStore
    var body: some View {
        @Bindable var path = pathStore
        NavigationStack(path: $path.path){
            VStack{
                List(movieDataStore.getMovies(), id: \.self, selection: $selectedMovie) { movie in
                    NavigationLink(value: Route.movie(movie)) {
                        VStack(alignment: .leading){
                            Text(movie.title).bold(true)
                            Text(movie.description)
                        }
                    }
                }.navigationTitle(Text("Movies")).navigationDestination(for: Route.self) { route in
                    switch route {
                    case .movie(let movie):
                        MovieDetailView(selectedMovie: movie)
                    case .actor(let actor):
                        ActorView(actor: actor)
                    case .director(let director):
                        DirectorView(director: director)
                    }
                    
                }
                
            }
        }
    }
}
