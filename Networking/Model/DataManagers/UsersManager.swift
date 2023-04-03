import Foundation

class UsersManager {
    
    static let instance = UsersManager()
    private let usersAPI = UsersAPI()
    
    private init() {}
    
//    func getUsers(completionHandler: @escaping ([User]?, Error?) -> ()) {
//        usersAPI.getUsers { users, error in
//            completionHandler(users, error)
//        }
//    }
    
    func getUsers(completionHandler: @escaping ([User]?, Error?) -> ()) {
        usersAPI.getUsers(completionHandler: completionHandler)
    }
    
    func getUserDetails(
        id: Int,
        completionHandler: @escaping (UserDetails?, Error?) -> ()
    ) {
        usersAPI.getUserDetails(
            id: id,
            completionHandler: completionHandler
        )
    }
}
