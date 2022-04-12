public struct LoginModel: Decodable {
    let success: Bool
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
    }
}
