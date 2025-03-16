import Foundation

struct ComicsAPIResponse: Codable {
    let data: ComicsList
}

struct ComicsList: Codable {
    let results: [Comic]
}

struct Comic: Codable, Identifiable {
    let id: Int
    let thumbnail: Thumbnail
    let urls: [ComicURL]
    
    var imageUrl: URL? {
        URL(string: "\(thumbnail.path).\(thumbnail.extension)".replacingOccurrences(of: "http://", with: "https://"))
    }
}

struct ComicURL: Codable {
    let type: String
    let url: String
}
