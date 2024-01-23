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
        VStack(alignment: .leading) {
            posterImageView
            HStack {
                titleView
                yearReleasedView
                Spacer()
            }
            HStack {
                genreView
                    .padding(.trailing, 16)
                durationView
                Spacer()
            }
            movieDescriptionView
            Spacer()
        }.padding(.leading, 16)
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
    
    private var titleView: some View {
        Text(movieTitleViewModel.title)
    }
    
    private var yearReleasedView: some View {
        Text("(\(viewModel.movies?.year ?? ""))")
    }
    
    private var genreView: some View {
        Text(viewModel.movies?.genre ?? "")
    }
    
    private var movieDescriptionView: some View {
        Text(viewModel.movies?.plot ?? "")
    }
    
    private var durationView: some View {
        Text(viewModel.movies?.runtime ?? "")
    }
}
