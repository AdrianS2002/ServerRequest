import Foundation

struct UsersWrapper: Decodable {
    let users: [User]
}

struct User: Codable {
    let id: Int
    let firstName: String
    let lastName: String
}

/*
 decodare: data -> Obiect // Decodable
 encodare: Obiect -> data // Encodable
 
 Codable: Decodable & Encodable
 
 */
