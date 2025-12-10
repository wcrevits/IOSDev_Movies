//
//  MovieDataStore.swift
//  Movies
//
//  Created by Dirk Hostens on 04/12/2023.
//

import Foundation

@Observable
class MovieDataStore {
    private var movies = Movies()
    
    init(){
        Task {
            await loadData()
        }
    }
    
    func getMovies() -> [Movie] {
        return movies.movies
    }
    
    func getMovies(director: Director) -> [Movie] {
        let movies = getMovies()
        let newArray = movies.filter { movie in
            return director.firstName == movie.director.firstName && director.lastName == movie.director.lastName
        }
        return newArray
    }
    
    func getMovies(actor: Actor) -> [Movie] {
        let movies = getMovies()
        let newArray = movies.filter { movie in
            return movie.actors.contains(where: { $0.firstName == actor.firstName && $0.lastName == actor.lastName })
        }
        return newArray
    }
    
    func getActors(director: Director) -> [Actor] {
        let movies = getMovies(director : director)
        var actors : [Actor] = []
        
        for movie in movies {
            actors.append(contentsOf: movie.actors)
        }
        return actors
    }
    
    private func sort() {
        movies.movies.sort { movie1, movie2 in
            return movie1.title < movie2.title
        }
    }
    
    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            let data : Movies = load("movies.json")
            movies.movies = data.movies
            sort()
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load uurrooster:", error)
            //movies is lege array
        }
    }
}
