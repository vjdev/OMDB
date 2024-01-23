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
                .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: searchText) { _, newValue in
            viewModel.searchText = newValue
        }
        .onReceive(viewModel.$movies) { movie in
            showMovieTileView = movie?.title != nil
        }
    }
}

#Preview {
    MovieHomeScreen()
}

