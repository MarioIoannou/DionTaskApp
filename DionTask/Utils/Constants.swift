
struct Constants {
    
    struct API {
        static let baseURL = "https://gateway.marvel.com"
        
        struct KEYS {
            static let publicKey = "ef06f795a1b0876c237209048ce00ace"
            static let privateKey = "aaee141db56087ea8974d94e221ad615de3d56ee"
            
        }
        
        struct ENDPOINT {
            static let marverlCharactersEndpoint = "/v1/public/characters"
            
            static func marverlCharactersComicsEndpoint(characterId: Int) -> String {
                return "/v1/public/characters/\(characterId)/comics"
            }
        }
        
        struct QUERY_PARAMETERS {
            static let limit = "limit"
            static let offset = "offset"
            static let apiKey = "apikey"
            static let timestamp = "ts"
            static let hash = "hash"
        }
    }
}
