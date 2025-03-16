//
//  MarvelCharacterComicsViewModel.swift
//  task2
//
//  Created by Marios Ioannou on 14/3/25.
//

import Foundation

@MainActor
class MarvelCharacterComicsViewModel: ObservableObject {
    
    @Published var comics: [Comic] = []
    @Published var error: Error?
    @Published var isLoading = false

    private let service = MarvelAPIService()

    func loadComics(characterId: Int) async {
        guard !isLoading else { return }
        
        isLoading = true
        do {
            comics = try await service.requestComics(for: characterId)
            error = nil
        } catch {
            print("Error loading comics:", error)
            self.error = error
            // Don't clear comics array on error to maintain previous state if any
        }
        isLoading = false
    }
}
