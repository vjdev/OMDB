//
//  MovieTileView.swift
//  OMDB
//
//  Created by vijeesh k on 19/01/24.
//

import SwiftUI

struct MovieTileView: View {
    @ObservedObject private var viewModel: MovieHomeViewModel
    let movieTileViewModel: MovieTileViewModel!
    
    init(viewModel: MovieHomeViewModel) {
        self.viewModel = viewModel
        movieTileViewModel = MovieTileViewModel(viewModel: viewModel)
    }
        
    var body: some View {
        if viewModel.showTile {
            movieTileView
                .padding(20)
        } else {
            EmptyView()
        }
    }
}
