import Foundation

@MainActor
class CharacterDetailsViewModel: ObservableObject {
    
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
            
            print("error:", error)
            
            self.error = error
        }
        
        isLoading = false
    }
}
