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
                NavigationLink(destination: MovieDetailView(viewModel: viewModel)) {
                    MovieTileView(viewModel: viewModel)
                }
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

struct MovieDetailView: View {
    @ObservedObject private var viewModel: MovieHomeViewModel
    
    init(viewModel: MovieHomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Hello World!")
    }
}

#Preview {
    MovieHomeScreen()
}

