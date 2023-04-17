//
//  NetworkService.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 16.04.23.
//

import Foundation
import os

// Network service for fetching and decoding data from api for coffee images
class NetworkService {
    private static let serverURL = URL(string: "https://coffee.alexflipnote.dev/random.json")
    static var decoder = JSONDecoder()
    static func getImageURLData() async throws -> ImageURLData {
        guard let url = serverURL else {
            throw NetworkError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try decoder.decode(ImageURLData.self, from: data)
    }
}
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case requestFailed(Error)
    case invalidData
}
