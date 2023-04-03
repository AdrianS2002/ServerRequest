import Foundation

struct MessageError: Error {
    let message: String
}

// PLAYGROUND


extension String {
    
    func intValue() throws -> Int {
        if let int = Int(self) {
            return int
        } else {
            throw(MessageError(message: "Cast not possible"))
        }
    }
}


func errorHandlingExample() throws {
    /*
     pt a marca o un bloc care poate sa arunce o eroare -> throws
     pt a arunca o eroare folosim throw(Error)
     pt a executa un bloc de cod care arunca o eroare si pentru a prinde prima eroare aruncata este nevoie sa executam blocul de cod folosind
     urmatoarea sintaxa
     */
     
//        do {
//            let string = "123d"
//            let int = try string.intValue()
//            print(int)
//        } catch {
//            print(error)
//        }
     
//        let string = "123"
//        if let int = try? string.intValue() {
//            print(int)
//        }
    
    let string = "123"
    let int = try string.intValue()
}
