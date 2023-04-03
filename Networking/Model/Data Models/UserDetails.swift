import Foundation

struct UserDetails: Decodable {
    let id: Int
    let firstname: String
    let lastname: String
    let maidenname: String
    let age: Int
    let gender: Gender
    let email: String
    let phone: String
    let username: String
    let password: String
    let birthDate: Date?
    let image: URL
    let bloodGroup: String
    let eyeColor: String
    let address: Address
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstname = "firstName"
        case lastname = "lastName"
        case maidenname = "maidenName"
        case age
        case gender
        case email
        case phone = "phone"
        case username = "username"
        case password = "password"
        case image = "image"
        case bloodGroup = "bloodGroup"
        case eyeColor = "eyeColor"
        case address = "address"
        case birthDate
    }
    // folosim o extensie a protocolului KeyedDecodingContainer???
    // folosim biblioteca CodableAlamofire??
    init(from decoder: Decoder) throws { // HOMEWORK: Sa cautati o solutie pentru a nu mai scrie tot acest init atunci cand am un date de deserializat
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.firstname = try container.decode(String.self, forKey: .firstname)
        self.lastname = try container.decode(String.self, forKey: .lastname)
        self.maidenname = try container.decode(String.self, forKey: .maidenname)
        self.age = try container.decode(Int.self, forKey: .age)
        self.gender = try container.decode(Gender.self, forKey: .gender)
        self.email = try container.decode(String.self, forKey: .email)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
        self.image = try container.decode(URL.self, forKey: .image)
        self.bloodGroup = try container.decode(String.self, forKey: .bloodGroup)
        self.eyeColor = try container.decode(String.self, forKey: .eyeColor)
        self.address = try container.decode(Address.self, forKey: .address)
        let birthDateString = try container.decode(String.self, forKey: .birthDate)
        let dateFormatter = DateFormatter() // https://nsdateformatter.com/
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.birthDate = dateFormatter.date(from: birthDateString)
    }
}

struct Address:  Decodable {
    let address: String
    let city: String
    let coordinates: Coordinates
    let postalCode: String
    let state: String
}

struct Coordinates: Decodable {
    let lat: Double
    let lng: Double
}

enum Gender: String, Decodable {
    case male = "male"
    case female = "female"
}

