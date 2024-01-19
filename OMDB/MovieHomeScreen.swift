//
//  ContentView.swift
//  OMDB
//
//  Created by vijeesh k on 02/01/24.
//

import SwiftUI

struct MovieHomeScreen: View {
    @State var searchText: String = ""
    @State private var searchIsActive = true
    @StateObject private var viewModel = MovieHomeViewModel()
    @State private var showMovieTileView: Bool = false
    
    var body: some View {
        NavigationView {
            NavigationStack {
                MovieTileView(viewModel: viewModel)
                Spacer()
            }.searchable(text: $searchText, isPresented: $searchIsActive)
                .navigationTitle(viewModel.screenTitle)
                .navigationBarTitleDisplayMode(.large)
        }
        .onChange(of: searchText) { _, newValue in
            viewModel.searchText = newValue
        }
        .onReceive(viewModel.$movies) { movie in
            showMovieTileView = movie?.title != nil
        }
    }
}

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

#Preview {
    MovieHomeScreen()
}

