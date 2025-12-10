//
//  PathStore.swift
//  Movies
//
//  Created by Wout Crevits on 10/12/2025.
//

import SwiftUI

@Observable
class PathStore {
    var path = [Route]()
    
    func clear() {
        path = []   
    }
    
    func reduceArray(index: Int){
        path = Array(path.prefix(index + 1))
    }
}
