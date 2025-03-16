import SwiftUI

struct ComicsVerticalScroll: View {
    
    @StateObject var viewModel = CharacterDetailsViewModel()
    
    let character: Character
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if viewModel.isLoading {
                
                LoadingView()
                    .frame(height: 180)
                
            } else if let error = viewModel.error {
                
                Text("Failed to load comics: \(error.localizedDescription)")
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
                Button("Retry") {
                    Task {
                        await viewModel.loadComics(characterId: character.id)
                    }
                }
                .padding(.horizontal)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.bottom, 8)
            } else if viewModel.comics.isEmpty {
                
                Text("No comics available for this character.")
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
            } else {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {
                        ForEach(viewModel.comics) { comic in
                            ComicCard(comic: comic)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.loadComics(characterId: character.id)
            }
        }
    }
}
