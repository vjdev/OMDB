//
//  MovieHomeViewModel.swift
//  OMDB
//
//  Created by vijeesh k on 02/01/24.
//

import Foundation
import Combine

final class MovieHomeViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var movies: MovieResponse?
    
    private var cancellable = Set<AnyCancellable>()
    private let service: MovieSearchServiceProtocol
    let screenTitle: String = "Movie Finder"
    
    init(service: MovieSearchServiceProtocol = MovieSearchService()) {
        self.service = service
        $searchText
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] value in
                self?.search(searchText: value)
            }.store(in: &cancellable)
        
        
        service.moviePassthrough.sink { completion in
        } receiveValue: { movies in
            self.movies = movies
        }.store(in: &cancellable)

    }
    
    private func search(searchText: String) {
        service.searchMovie(with: searchText)
    }
    
    var showTile: Bool {
        movies?.title != nil
    }
}
