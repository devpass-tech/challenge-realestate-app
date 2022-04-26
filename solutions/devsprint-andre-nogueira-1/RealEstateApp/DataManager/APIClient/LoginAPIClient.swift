import Foundation

protocol LoginAPIClientProtocol: AnyObject {
    func fetchProperties(completion: @escaping (Result<[Property], ErrorRequest>) -> Void)
}

public final class LoginAPIClient {
    func fetchProperties(completion: @escaping (Result<LoginModel, ErrorRequest>) -> Void) {
        let urlString = ManagerGetURL.getLoginURL()
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorRequest.urlNotValid))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data else {
                completion(.failure(ErrorRequest.invalidJson))
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(LoginModel.self, from: data)
                completion(.success(result))
            } catch {
                print(error)
                completion(.failure(ErrorRequest.noData))
            }
        }
        
        task.resume()
    }
}
