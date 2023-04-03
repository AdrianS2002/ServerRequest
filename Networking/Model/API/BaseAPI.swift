import Foundation

class BaseAPI{

   
    
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let df = DateFormatter()
        df.dateFormat = "dd MM yyyy"
        decoder.dateDecodingStrategy = .formatted(df)
        return decoder
        
    }()

}
