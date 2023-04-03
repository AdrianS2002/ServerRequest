import Foundation



class UsersAPI: BaseAPI{
    
    func getUsers(
        completionHandler: @escaping ([User]?, Error?) -> ()) {
        let urlString = "https://dummyjson.com/users"
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(
            with: urlRequest) { data, response, error in // pe thread secundar (Alamofire in schimb, ne trece automat pe ui(main) thread )
                DispatchQueue.main.async { // trece pe ui(main) thread
                    if let error {
                        completionHandler(nil, error)
                    } else if let data {
                        do {
                            let usersWrapper = try JSONDecoder().decode(UsersWrapper.self, from: data)
                            completionHandler(usersWrapper.users, nil)
                        } catch {
                            completionHandler(nil, error)
                        }
                    } else {
                        let unknownError = MessageError(message: "UnkwnonError")
                        completionHandler(nil, unknownError)
                    }
                }
            }
        task.resume()
    }
    
    func getUserDetails(
        id: Int,
        completionHandler: @escaping (UserDetails?, Error?) -> ()
    ) {
        let urlString = "https://dummyjson.com/users/\(String(id))" // interpolarea unui int > 1000 presepune imparitea claselor prin . sau , in functie de zona userului
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    completionHandler(nil, error)
                } else if let data = data {
                    do {
                        let userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
                        completionHandler(userDetails, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                } else {
                    let unknownError = MessageError(message: "UnknownError")
                    completionHandler(nil, unknownError)
                }
            }
        }
        task.resume()
    }
    
    // cum adaugam body / query params
    // dummy methods
    
    func getUserDetilsUsingQueryParm(id: Int) {
        
        let queryParams: [String: String] = [
            "id": String(id),
            "name": "orlando" // and many more
        ]
        
        let urlString = "https://dummyjson.com/users"
        let url = URL(string: urlString)!
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponents?.queryItems = queryItems
        
        var urlRequest = URLRequest(url: (urlComponents?.url)!)
    }
    
    func postRequestWithBodyParams(user: User) {
        
        let urlString = "https://dummyjson.com/users"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        let encodedUser = try! JSONEncoder().encode(user)
        request.httpMethod = "POST"
        request.httpBody = encodedUser
        
        ///
        
    }
    
}

