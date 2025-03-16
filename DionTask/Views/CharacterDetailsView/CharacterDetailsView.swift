import SwiftUI

struct MarvelCharacterDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel: CharactersViewModel
    
    @State private var currentIndex: Int
    
    let character: Character
    
    init(character: Character, viewModel: CharactersViewModel) {
        
        self.character = character
        self.viewModel = viewModel
        
        let selectedCharacterId = character.id
        let charactersList = viewModel.characters
        
        let defaultPosition = 0
        
        var characterPosition = defaultPosition
        
        for position in 0..<charactersList.count {
            
            let characterAtPosition = charactersList[position]
            
            if characterAtPosition.id == selectedCharacterId {
                
                characterPosition = position
                break
            }
        }
        _currentIndex = State(initialValue: characterPosition)
    }
    
    var body: some View {
        
        TabView(selection: $currentIndex) {
            
            ForEach(
                Array(
                    viewModel.characters.enumerated()), id: \.element.id) { index, character in
                        
                        characterDetailView(character: character)
                            .tag(index)
                    }
        }
        .onChange(of: currentIndex) { newIndex in
            if newIndex >= viewModel.characters.count - 2 {
                viewModel.fetchCharacters()
            }
        }
        .tabViewStyle(
            PageTabViewStyle(
                indexDisplayMode: .never
            )
        )
    }
    
    private func characterDetailView(character: Character) -> some View {
        
        ZStack(alignment: .bottom) {
            
            let secureImageUrl = URL(string: "\(character.thumbnail.path).\(character.thumbnail.extension)".replacingOccurrences(of: "http://", with: "https://"))
            
            AsyncImage(url: secureImageUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .clipped()
                    .ignoresSafeArea()
            } placeholder: {
                Color.gray
            }
            .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text(character.name)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black.opacity(0.3))
                    )
                    .padding(EdgeInsets(top: 60, leading: 15, bottom: 0, trailing: 0))
                
                ComicsVerticalScroll(character: character)
                    .padding(.bottom, 60)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black.opacity(0.3))
                )
                .padding(8)
        }
        )
    }
}


