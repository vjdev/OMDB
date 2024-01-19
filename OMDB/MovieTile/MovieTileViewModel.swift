//
//  MovieTileViewModel.swift
//  OMDB
//
//  Created by vijeesh k on 19/01/24.
//

import Foundation

final class MovieTileViewModel {
    private var viewModel: MovieHomeViewModel
    
    init(viewModel: MovieHomeViewModel) {
        self.viewModel = viewModel
    }
    
    var title: String {
        viewModel.movies?.title ?? ""
    }
    var posterImage: String {
        viewModel.movies?.poster ?? ""
    }
    var genre: String {
        viewModel.movies?.genre ?? ""
    }
    
    var imdbRating: String {
        viewModel.movies?.imdbRating ?? ""
    }
}
