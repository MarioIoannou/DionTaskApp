import Foundation
import CryptoKit

class MarvelAPIService: ObservableObject {

    private let baseURL: String
    private let publicKey: String
    private let privateKey: String

    init(
        baseURL: String = Constants.API.baseURL,
        publicKey: String = Constants.API.KEYS.publicKey,
        privateKey: String = Constants.API.KEYS.privateKey
    ) {
        self.baseURL = baseURL
        self.publicKey = publicKey
        self.privateKey = privateKey
    }

    // API Methods
    
    func requestCharacters(offset: Int = 0) async throws -> [Character] {
        
        var components = URLComponents(string: baseURL + Constants.API.ENDPOINT.charactersEndpoint)!
        
        
        components.queryItems = [
            URLQueryItem(name: Constants.API.QUERY_PARAMETERS.offset, value: "\(offset)"),
            URLQueryItem(name: Constants.API.QUERY_PARAMETERS.limit, value: "10")
        ] + generateAuthParams()

        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        print("URL: \(url.absoluteString)")

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        print("Status: \(httpResponse.statusCode)")
        
        if httpResponse.statusCode != 200 {
            
            if let responseString = String(data: data, encoding: .utf8) {
                
                print("Error response: \(responseString)")
                
            }
            throw URLError(.badServerResponse)
        }
        
        do {
            
            let decoder = JSONDecoder()
            let response = try decoder.decode(CharactersAPIResponse.self, from: data)
            return response.data.results
            
        } catch {
            
            print("Error: \(error)")
            
            if let responseString = String(data: data, encoding: .utf8) {
                
                print("Response: \(responseString)")
                
            }
            
            throw error
        }
    }

    func requestComics(for characterId: Int) async throws -> [Comic] {
        
        var components = URLComponents(string: baseURL + Constants.API.ENDPOINT.comicsEndpoint(characterId: characterId))!
        
        components.queryItems = generateAuthParams()

        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        print("URL: \(url.absoluteString)")

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        print("Status: \(httpResponse.statusCode)")
        
        if httpResponse.statusCode != 200 {

            if let responseString = String(data: data, encoding: .utf8) {
                
                print("Error response: \(responseString)")
                
            }
            throw URLError(.badServerResponse)
        }
        
        do {
            let decoder = JSONDecoder()
            let comicsResponse = try decoder.decode(ComicsAPIResponse.self, from: data)
            return comicsResponse.data.results
        } catch {
            
            print("error: \(error)")

            if let responseString = String(data: data, encoding: .utf8) {
                
                print("Response: \(responseString)")
                
            }
            throw error
        }
    }
    
    // Additional Methos
    
    private func generateAuthParams() -> [URLQueryItem] {
        
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash = generateHash(timestamp: timestamp)

        return [
            URLQueryItem(name: Constants.API.QUERY_PARAMETERS.timestamp, value: timestamp),
            URLQueryItem(name: Constants.API.QUERY_PARAMETERS.apiKey, value: publicKey),
            URLQueryItem(name: Constants.API.QUERY_PARAMETERS.hash, value: hash)
        ]
    }

    private func generateHash(timestamp: String) -> String {
        
        let combined = timestamp + privateKey + publicKey
        let inputData = Data(combined.utf8)
        let hash = Insecure.MD5.hash(data: inputData)
        return hash.map { String(format: "%02hhx", $0) }.joined()
        
    }
}
