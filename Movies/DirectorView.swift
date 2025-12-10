//
//  DirectorView.swift
//  Movies
//
//  Created by Wout Crevits on 10/12/2025.
//

import SwiftUI

struct DirectorView: View {
    var director: Director
    @Environment(MovieDataStore.self) var movieData : MovieDataStore
    @Environment(PathStore.self) var path

    var body: some View {
        VStack{
            Text("Director: " + director.firstName + " " + director.lastName).bold(true)
            Divider()
            Spacer()
            Divider()
            VStack{
                Text("Movie(s)").bold(true)
                ForEach(movieData.getMovies(director: director), id: \.self){ movie in
                    NavigationLink(value: Route.movie(movie)){
                        Text(movie.title).foregroundStyle(.red)
                    }
                }
                Spacer()
                Divider()
                VStack{
                    Text("Actors work with:")
                    ForEach(movieData.getActors(director: director), id: \.self){ actor in
                        NavigationLink(value: Route.actor(actor)){
                            Text(actor.firstName + " " + actor.lastName).foregroundStyle(.red)
                        }
                        
                    }
                }
                Spacer()
                Divider()
                
                RouteView()
            }
        }
    }
}
