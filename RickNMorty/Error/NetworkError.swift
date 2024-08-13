//
//  Error.swift
//  RickNMorty
//
//  Created by Marvin John on 13.08.24.
//

import Foundation

enum NetworkError: Error{
    case badURL
    case requestFailed
    case invalidResponse
    case decodingError
    case networkError
    
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "The URL is invalid"
        case.requestFailed:
            return "The request failed. Please try again."
        case.invalidResponse:
            return "The server response was invalid."
        case.decodingError:
            return "Failded to decode the data"
        case .networkError:
            return "Network error. Please check your internet connection."
        }
    }
}
