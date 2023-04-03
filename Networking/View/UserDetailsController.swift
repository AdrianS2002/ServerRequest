import Foundation
import UIKit
import Kingfisher

class UserDetailsController: UIViewController {
    
    @IBOutlet weak private var firstNameLabel: UILabel!
    @IBOutlet weak private var lastNameLabel: UILabel!
    @IBOutlet weak private var maidenNameLabel: UILabel!
    @IBOutlet weak private var genderLabel: UILabel!
    @IBOutlet weak private var birthdateLabel: UILabel!
    @IBOutlet weak private var profilePictureImageView: UIImageView!
    
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    
    private let viewModel = UserDetailsViewModel()
    
    var id: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getUserDetails(id: id)
        activityIndicator.startAnimating()
        firstNameLabel.isHidden = true
        lastNameLabel.isHidden = true
        maidenNameLabel.isHidden = true
        genderLabel.isHidden = true
        birthdateLabel.isHidden = true
        profilePictureImageView.isHidden = true
    }
    
}

extension UserDetailsController: UserDetailsDelegate {
    func userDetailsHasChanged(newValue: UserDetails) {
        firstNameLabel.isHidden = true
        firstNameLabel.text = newValue.firstname
        
        lastNameLabel.isHidden = false
        lastNameLabel.text = newValue.lastname
        
        maidenNameLabel.isHidden = false
        maidenNameLabel.text = newValue.maidenname
        
        genderLabel.isHidden = false
        genderLabel.text = newValue.gender.rawValue
        
        if let birthDate = newValue.birthDate {
            birthdateLabel.isHidden = false
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            birthdateLabel.text = dateFormatter.string(from: birthDate)
        } else {
            birthdateLabel.isHidden = true
        }
        profilePictureImageView.isHidden = false
        profilePictureImageView.kf.setImage(with: newValue.image)
        activityIndicator.isHidden=true
    }
}
