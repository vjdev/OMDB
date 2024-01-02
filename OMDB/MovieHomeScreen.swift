//
//  ContentView.swift
//  OMDB
//
//  Created by vijeesh k on 02/01/24.
//

import SwiftUI
import Combine
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
            //viewModel.search(searchText: newValue)
        }
    }
}

final class MovieHomeViewModel: ObservableObject {
    @Published var searchText = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] value in
                self?.search(searchText: value)
            }.store(in: &cancellable)
    }
    
    func search(searchText: String) {
        print("Search: \(searchText)")
    }
}

#Preview {
    MovieHomeScreen()
}

