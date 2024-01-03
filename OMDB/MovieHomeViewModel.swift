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
}

// MARK: - MovieResponse
struct MovieResponse: Codable {
    let title, year, rated, released: String?
    let runtime, genre, director, writer: String?
    let actors, plot, language, country: String?
    let awards: String?
    let poster: String?
    let ratings: [Rating]?
    let metascore, imdbRating, imdbVotes, imdbID: String?
    let type, dvd, boxOffice, production: String?
    let website, response: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}

// MARK: - Rating
struct Rating: Codable {
    let source, value: String?

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
