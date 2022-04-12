import Foundation



public final class LoginAPIClient {
    
    func pegaloginmodel(completion: @escaping(LoginModel?, Error?) -> ()) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-realestate-app/main/api/login.json")!
        var loginModel: LoginModel?
    
        
        let dataTask = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                completion(try decoder.decode(LoginModel.self, from: data), nil)
//                loginModel = try decoder.decode(LoginModel.self, from: data)
                
            } catch {
                completion(nil, error)
            }
        }

            dataTask.resume()
    }
    
}

