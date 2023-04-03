import UIKit
class UsersController: UIViewController {
    
    @IBOutlet weak private var usersLabel: UILabel!
    
    private let viewModel = UsersViewModel()
    
    override func viewDidLoad() {
        viewModel.delegate = self
        viewModel.getUsers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let destination = segue.destination as! UserDetailsController
            destination.id = (sender as! Int)
        }
    }
    
    @IBAction private func onPickRandomUserPressed(_ sender: Any) {
        let randomInt = Int.random(in: (0...10))
        if let users = viewModel.users {
            let index =  randomInt % (users.count - 1)
            let pickedUser = users[index]
            performSegue(withIdentifier: "segue", sender: pickedUser.id)
        }
    }
}


extension UsersController: UsersViewModelDelegate {
    func usersHasChanged(newValue: [User]) {
        let names = newValue.map {
            $0.firstName + " " + $0.lastName
        }
        let joinedNames = names.joined(separator: ", ")
        usersLabel.text = joinedNames
    }
}


/*
 Model -> ViewModel -> View
 API -> DataManager -> ViewModel -> View
 */

struct Person {
    let age: Int
}

func mapExample() {
    
    let ints = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    // f(x) = 2 * x => [2, 4, 6 ..., 20]
    
    let ints2 = ints.map { 2 * $0 }
    
    let persons = [
        Person(age: 10),
        Person(age: 11),
        Person(age: 12)
    ]
    let ages = persons.map {$0.age}
}

