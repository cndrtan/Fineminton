//
//  ShotViewModel.swift
//  Fineminton
//
//  Created by Theresia Saputri on 26/08/22.
//

import Foundation
import Combine

class ShotViewModel: ObservableObject{
    
    //@Published var shots: [Shot] = fetchShot("ShotData.json")
    
    @Published var shots = [
        Shot(id: 1, shotName: "Clear/Lob", shotImage: "Clear_Lob", shotSummary: String(localized: "Pukulan jauh ke area belakang lawan"), shotDescription: String(localized: "Jenis pukulan yang paling direkomendasikan untuk mengambil waktu dengan tujuan menengahkan lapangan adalah pukulan clear yang mendalam. Ketika anda bingung, pukulan clear bisa menjadi hal pertama yang anda lakukan. Pukulan clear yang digunakan untuk bertahan dapat disamakan dengan pukulan lob pada tenis."), isOpen: true),
        
        Shot(id: 2, shotName: "Smash", shotImage: "Smash", shotSummary: String(localized: "Pukulan menukik keras ke daerah lawan"), shotDescription: String(localized: "Jenis pukulan yang paling direkomendasikan untuk mengambil waktu dengan tujuan menengahkan lapangan adalah pukulan clear yang mendalam. Ketika anda bingung, pukulan clear bisa menjadi hal pertama yang anda lakukan. Pukulan clear yang digunakan untuk bertahan dapat disamakan dengan pukulan lob pada tenis."), isOpen: false),
        
        Shot(id: 3, shotName: "Drop Shot", shotImage: "Dropshot", shotSummary: String(localized: "Pukulan yang jatuh di dekat net lawan"), shotDescription: String(localized: "Jenis pukulan yang paling direkomendasikan untuk mengambil waktu dengan tujuan menengahkan lapangan adalah pukulan clear yang mendalam. Ketika anda bingung, pukulan clear bisa menjadi hal pertama yang anda lakukan. Pukulan clear yang digunakan untuk bertahan dapat disamakan dengan pukulan lob pada tenis."), isOpen: false),
        
        Shot(id: 4, shotName: "Drive Shot", shotImage: "Drive", shotSummary: String(localized: "Pukulan cepat dan mendatar ke area lawan"), shotDescription: String(localized: "Jenis pukulan yang paling direkomendasikan untuk mengambil waktu dengan tujuan menengahkan lapangan adalah pukulan clear yang mendalam. Ketika anda bingung, pukulan clear bisa menjadi hal pertama yang anda lakukan. Pukulan clear yang digunakan untuk bertahan dapat disamakan dengan pukulan lob pada tenis."), isOpen: false)
    ]
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

