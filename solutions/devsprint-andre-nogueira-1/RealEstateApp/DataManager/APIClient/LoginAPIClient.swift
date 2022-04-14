import Foundation

public final class LoginAPIClient {
    
    func getLoginModel(completion: @escaping (Result<(Data, URLResponse), Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-realestate-app/main/api/login.json")!) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response {
                completion(.success((data, response)))
            }
            
            assertionFailure("Failure")
        }
    }
}
