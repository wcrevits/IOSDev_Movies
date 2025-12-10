//
//  Route.swift
//  Movies
//
//  Created by Wout Crevits on 10/12/2025.
//

import Foundation

enum Route : Hashable {
    case movie(Movie)
    case actor(Actor)
    case director(Director)
}
