import SwiftUI

struct CharactersListView: View {
    
    @StateObject var viewModel = CharactersViewModel()
    
    let columns = [GridItem(.adaptive(minimum: 160))]
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                if let error = viewModel.error {
                    
                    VStack {
                        
                        Text("Error loading characters")
                            .font(.headline)
                            .padding()
                        
                        Text(error.localizedDescription)
                            .multilineTextAlignment(.center)
                            .padding()
                            .foregroundColor(.red)
                        
                        Button("Retry") {
                            viewModel.fetchCharacters()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding()
                } else {
                    
                    ScrollView {
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            
                            ForEach(viewModel.characters) { character in
                                    
                                CharacterNavigationLink(character: character, viewModel: viewModel)
                                
                                    .onAppear {
                                        
                                        if character.id == viewModel.characters.last?.id {
                                            viewModel.fetchCharacters()
                                        }
                                        
                                    }
                            }
                            
                            if viewModel.isLoading && !viewModel.characters.isEmpty {
                                LoadingView()
                            }
                        }
                        .padding()
                    }
                }
                
                if viewModel.isLoading && viewModel.characters.isEmpty {
                    LoadingView()
                }
            }
            .onAppear {
                if viewModel.characters.isEmpty {
                    viewModel.fetchCharacters()
                }
            }
        }
    }
}

struct CharacterNavigationLink: View {
    
    let character: Character
    
    @ObservedObject var viewModel: CharactersViewModel
    
    var body: some View {
        NavigationLink(destination: MarvelCharacterDetailsView(character: character, viewModel: viewModel)) {
            CharacterCard(character: character)
        }
    }
}

