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
}
