//
//  GetMapsService.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import Foundation

class GetMapsService {
    
    static let shared = GetMapsService()
    private init() {}
    
    func fetchData(complition: @escaping (Result<[Map], Error>) -> (Void)) {
        guard let path = Bundle.main.path(forResource: "maps", ofType: "json") else { return }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let maps =  try JSONDecoder().decode([Map].self, from: data)
            complition(.success(maps))
        } catch {
            complition(.failure(error))
        }
        
    }
}
