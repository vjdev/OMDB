//
//  MovieHomeViewModel.swift
//  OMDB
//
//  Created by vijeesh k on 02/01/24.
//

import Foundation
import Combine

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
