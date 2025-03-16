//
//  CharacterModel.swift
//  DionTask
//
//  Created by Marios Ioannou on 16/3/25.
//

import Foundation

struct CharactersAPIResponse: Codable {
    let data: MarvelData
}

struct MarvelData: Codable {
    let results: [Character]
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let thumbnail: Thumbnail
    let resourceURI: String
    
    var imageUrl: URL? {
        URL(string: "\(thumbnail.path).\(self.thumbnail.extension)".replacingOccurrences(of: "http://", with: "https://"))
    }
}

struct Thumbnail: Codable {
    let path: String
    let `extension`: String
}
