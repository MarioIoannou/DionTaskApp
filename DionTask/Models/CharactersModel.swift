import Foundation

struct CharactersAPIResponse: Codable {
    let data: CharactersList
}

struct CharactersList: Codable {
    let results: [Character]
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let thumbnail: Thumbnail
    
    var imageUrl: URL? {
        URL(string: "\(thumbnail.path).\(self.thumbnail.extension)".replacingOccurrences(of: "http://", with: "https://"))
    }
}

struct Thumbnail: Codable {
    let path: String
    let `extension`: String
}
