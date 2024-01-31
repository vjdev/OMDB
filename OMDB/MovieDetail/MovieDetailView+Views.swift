//
//  MovieDetailView+Views.swift
//  OMDB
//
//  Created by vijeesh k on 31/01/24.
//

import SwiftUI

extension MovieDetailView {
    var titleView: some View {
        Text(movieTitleViewModel.title)
    }
    
    var yearReleasedView: some View {
        Text("(\(viewModel.movies?.year ?? ""))")
    }
    
    var genreView: some View {
        Text(viewModel.movies?.genre ?? "")
    }
    
    var movieDescriptionView: some View {
        Text(viewModel.movies?.plot ?? "")
    }
    
    var durationView: some View {
        Text(viewModel.movies?.runtime ?? "")
    }
}
