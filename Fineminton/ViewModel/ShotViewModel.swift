//
//  ShotViewModel.swift
//  Fineminton
//
//  Created by Theresia Saputri on 26/08/22.
//

import Foundation
import Combine

class ShotViewModel: ObservableObject{
    @Published var shots: [Shot] = fetchShot("ShotData.json")
}

func fetchShot <T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
