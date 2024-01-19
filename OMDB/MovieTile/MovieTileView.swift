//
//  MovieTileView.swift
//  OMDB
//
//  Created by vijeesh k on 19/01/24.
//

import SwiftUI

struct MovieTileView: View {
    @ObservedObject private var viewModel: MovieHomeViewModel
    private let movieTileViewModel: MovieTileViewModel!
    init(viewModel: MovieHomeViewModel) {
        self.viewModel = viewModel
        movieTileViewModel = MovieTileViewModel(viewModel: viewModel)
    }
    
    private func showTile() -> Bool {
        viewModel.movies?.title != nil
    }
    
    var body: some View {
        if showTile() {
            showMovieTileView()
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func showMovieTileView() -> some View {
        HStack {
            HStack {
                Image(movieTileViewModel.posterImage)
                VStack(alignment: .leading) {
                    Text(movieTileViewModel.title)
                    Text(movieTileViewModel.imdbRating)
                        .padding(2)
                        .background(Color.gray)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text(movieTileViewModel.genre)
                }
            }
            .padding(.leading, 16)
            Spacer()
        }
    }
}
