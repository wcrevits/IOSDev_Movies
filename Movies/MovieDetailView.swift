//
//  MovieDetailView.swift
//  Movies
//
//  Created by Wout Crevits on 10/12/2025.
//

import SwiftUI

struct MovieDetailView: View {
    @State var selectedMovie: Movie
    @Environment(PathStore.self) var path
    var body: some View {
        VStack(){
            VStack(alignment: .center){
                Text(selectedMovie.title).foregroundStyle(Color.red).font(Font.largeTitle)
                Text(selectedMovie.description)
            }
            Divider()
            Spacer()
            VStack{
                Text("Actors").bold(true)
                ForEach(selectedMovie.actors, id: \.self){ actor in
                    NavigationLink(value: Route.actor(actor)) {
                        Text(actor.firstName + " " + actor.lastName).foregroundStyle(Color.red)
                    }
                }
            }
            Divider()
            VStack{
                Text("Director").bold(true)
                NavigationLink(value: Route.director(selectedMovie.director)) {
                    Text(selectedMovie.director.firstName).foregroundStyle(Color.red)                }
            }
            
            Spacer()
            Divider()
            RouteView()
        }
    }
}
