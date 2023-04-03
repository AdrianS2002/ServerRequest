import Foundation
import UIKit

protocol UsersViewModelDelegate: AnyObject {
    func usersHasChanged(newValue: [User])
}

final class UsersViewModel {
    
    private let usersManager = UsersManager.instance
    weak var delegate: UsersViewModelDelegate?
    
    private(set) var users: [User]?
    
    func getUsers() {
        usersManager.getUsers { users, error in
            if let users {
                self.users = users
                self.delegate?.usersHasChanged(newValue: users)
            }
        }
    }
}


/*
 
 MVVM
 
 Model ViewModel View
 API <-> DataManager <-> ViewModel <-> View
 async
 
 
 */
