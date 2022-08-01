//
//  JSONManager.swift
//  Quotes
//
//  Created by Jaydeepsinh Parmar on 8/2/22.
//

import Foundation

struct Quote: Codable {
    var quote, author: String
    
    static let allQuotes: [Quote] = Bundle.main.decode(file: "quotes.json")
    static let samplePerson: Quote = allQuotes[0]
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could Not Find the \(file) in project")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could Not Find the \(file) in project")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could Not Find the \(file) in project")
        }
        
        return decodedData
    }
}

