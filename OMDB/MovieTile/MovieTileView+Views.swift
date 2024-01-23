//
//  MovieTileView+Views.swift
//  OMDB
//
//  Created by vijeesh k on 23/01/24.
//

import SwiftUI

extension MovieTileView {
    private var moviePosterImageView: some View {
        HStack {
            AsyncImage(url: movieTileViewModel.posterImage, scale: 4)
                .frame(width: 30, height: 30)
        }
    }
    
    private var movieTitleView: some View {
        Text(movieTileViewModel.title)
    }
    
    private var imdbRatingView: some View {
        Text(movieTileViewModel.imdbRating)
            .padding(2)
            .background(Color.gray)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
    
    private var genreView: some View {
        Text(movieTileViewModel.genre)
    }
    
    private var movieDescriptionView: some View {
        VStack(alignment: .leading) {
            movieTitleView
            imdbRatingView
            genreView
        }
    }
    
    var movieTileView: some View {
        HStack {
            moviePosterImageView
                .padding(.trailing, 20)
                movieDescriptionView
                .padding(.leading, 16)
                Spacer()
        }
    }
}
