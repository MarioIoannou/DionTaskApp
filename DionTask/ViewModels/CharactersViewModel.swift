import Foundation

@MainActor
class CharactersViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private let apiService = MarvelAPIService()
    private var offset = 0
    private var hasMoreCharacters = true

    func fetchCharacters() {
        
        guard !isLoading && hasMoreCharacters else { return }
        
        isLoading = true
        
        Task {
            do {
                
                let fetchedCharacters = try await apiService.requestCharacters(offset: offset)
                
                characters.append(contentsOf: fetchedCharacters)
                offset += fetchedCharacters.count
                
                if fetchedCharacters.isEmpty || fetchedCharacters.count < 10 {
                    hasMoreCharacters = false
                }
                
                error = nil
                
            } catch {
                
                print("Error", error)
                self.error = error
            }
            
            isLoading = false
        }
    }
}
