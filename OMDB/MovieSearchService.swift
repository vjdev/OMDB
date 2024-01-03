//
//  WeatherService.swift
//  NewsApp With SwiftUI Framework
//
//  Created by Алексей Воронов on 21.07.2019.
//  Copyright © 2019 Алексей Воронов. All rights reserved.
//

import Foundation
import Combine

final class MovieSearchService: MovieSearchServiceProtocol {
    private let apiProvider = APIProvider<WeatherEndpoint>()
    private var cancellables = Set<AnyCancellable>()
    var moviePassthrough = PassthroughSubject<MovieResponse, APIErrors>()
    
    func searchMovie(with searchString: String) {
        apiProvider.getData(from: .getMovieName(searchString: searchString))
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:
                        print("Success")
                    case .failure:
                        self?.moviePassthrough.send(completion: .failure(.badRequest))
                    }
                },
                receiveValue: { [weak self] movieResponse in
                    self?.moviePassthrough.send(movieResponse)
                }
            )
            .store(in: &cancellables)
    }
}

