//
//  MapsViewModel.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import Foundation

class MapsViewModel {
    private let getMapsService = GetMapsService.shared
    
    var maps: Binder<[Map]?> = Binder(nil)
    
    func fetchMapsList() {
        getMapsService.fetchData { (result) -> (Void) in
            switch result {
            case .success(let maps):
                self.maps.value = maps
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
