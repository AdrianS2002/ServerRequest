import Foundation

protocol UserDetailsDelegate: AnyObject {
    func userDetailsHasChanged(newValue: UserDetails)
}

final class UserDetailsViewModel {
    
    private let usersManager = UsersManager.instance
    
    weak var delegate: UserDetailsDelegate?
    
    func getUserDetails(id: Int) {
        usersManager.getUserDetails(id: id) { userDetails, error in
            if let userDetails {
                self.delegate?.userDetailsHasChanged(newValue: userDetails)
            }
        }
    }
    
}
