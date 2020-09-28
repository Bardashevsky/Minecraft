//
//  DetailViewModel.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 28.09.2020.
//

import Foundation

class DetailViewModel {
    
    private let db = StorageService.shared
    
    var map: Binder<Map?> = Binder(nil)
    
    init(map: Map) {
        self.map.value = map
    }
    
    func addToFavorite(success: () ->()?, filed: ()->()?) {
        guard let map = map.value else { return }
        if !db.mapsList().contains(map) {
            self.db.insertMap(map: map)
            success()
        } else {
            filed()
        }
    }
}
