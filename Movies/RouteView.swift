//
//  RouteView.swift
//  Movies
//
//  Created by Wout Crevits on 10/12/2025.
//

import SwiftUI

struct RouteView: View {
    @Environment(PathStore.self) var pathStore
    var body: some View {
        VStack{
            Text("Overview navigationStack").bold(true)
            ForEach(Array(pathStore.path.enumerated()), id: \.offset){ index, route in
                switch route {
                case .director(let director):
                    Button("Director " + director.firstName + " " + director.lastName){
                        pathStore.reduceArray(index: index)
                    }.buttonStyle(.borderless)
                case .actor(let actor):
                    Button("Actor " + actor.firstName + " " + actor.lastName){
                        pathStore.reduceArray(index: index)
                    }.buttonStyle(.borderless).foregroundStyle(Color.gray)
                case .movie(let movie):
                    Button("Movie " + movie.title){
                        pathStore.reduceArray(index: index)
                    }.buttonStyle(.borderless).foregroundStyle(.blue)
                }
            }
            
            Button("Clear") {
                pathStore.clear()
            }
        }
    }
}
