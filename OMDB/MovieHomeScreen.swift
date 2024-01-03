//
//  ContentView.swift
//  OMDB
//
//  Created by vijeesh k on 02/01/24.
//

import SwiftUI

struct MovieHomeScreen: View {
    @State var searchText: String = ""
    @State private var searchIsActive = false
    @StateObject private var viewModel = MovieHomeViewModel()
    
    var body: some View {
        NavigationView {
            NavigationStack {
            }.searchable(text: $searchText, isPresented: $searchIsActive)
                .navigationTitle("Movie Finder")
                .navigationBarTitleDisplayMode(.large)
        }
        .onChange(of: searchText) { _, newValue in
            viewModel.searchText = newValue
        }
        .onReceive(viewModel.$movies) { movies in
            print("Here are the movies: \(movies)")
        }
    }
}

#Preview {
    MovieHomeScreen()
}

