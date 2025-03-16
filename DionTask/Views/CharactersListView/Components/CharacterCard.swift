import SwiftUI

struct CharacterCard: View {
    
    let character: Character
    
    private var secureImageUrl: URL? {
        
        let urlString = "\(character.thumbnail.path).\(character.thumbnail.extension)"
        
        let secureString = urlString.replacingOccurrences(of: "http://", with: "https://")
        
        return URL(string: secureString)
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            AsyncImage(url: secureImageUrl) { thumbnail in
                
                thumbnail.resizable().scaledToFill()
                
            } placeholder: {
                Color.gray
            }
            
            VStack {
                
                Spacer()
                
                Text(character.name)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black.opacity(0.3))
                    )
            }
        }
        .frame(width: 150, height: 180)
        .clipped()
        .cornerRadius(10)
    }
}
