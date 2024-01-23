//
//  MovieDetailsScreen.swift
//  OMDB
//
//  Created by vijeesh k on 23/01/24.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject private var viewModel: MovieHomeViewModel
    private var movieTitleViewModel: MovieTileViewModel!
    
    init(viewModel: MovieHomeViewModel) {
        self.viewModel = viewModel
        self.movieTitleViewModel = MovieTileViewModel(viewModel: viewModel)
    }
    
    var body: some View {
        VStack {
            posterImageView
            Text(movieTitleViewModel.title)
            Spacer()
        }
    }
    
    private var posterImageView: some View {
        VStack {
            AsyncImage(url: movieTitleViewModel.posterImage) { image in
                image
                    .resizable()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 350)
            } placeholder: {
                Color.gray.opacity(0.1)
            }
        }
    }
}
