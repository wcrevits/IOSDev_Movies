//
//  ActorView.swift
//  Movies
//
//  Created by Wout Crevits on 10/12/2025.
//

import SwiftUI

struct ActorView: View {
    var actor: Actor
    @Environment(MovieDataStore.self) var movieDataStore
    @Environment(PathStore.self) var path
    var body: some View {
        VStack{
            Text("Actor: " + actor.firstName + " " + actor.lastName).bold(true)
            Divider()
            Text("Birthday: " + actor.birthday)
            Spacer()
            Divider()
            VStack{
                Text("Movie(s)").bold(true)
                ForEach(movieDataStore.getMovies(actor: actor), id: \.self){ movie in
                    NavigationLink(value: Route.movie(movie)){
                        Text(movie.title).foregroundStyle(.red)
                    }
                }
            }
            Spacer()
            Divider()
            RouteView()
        }
    }
}
