//
//  FavoriteViewModel.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 28.09.2020.
//

import Foundation

class FavoriteViewModel {
    let db = StorageService.shared
    
    var maps: Binder<[Map]?> = Binder(nil)
    var error: Binder<Error?> = Binder(nil)
    
    func fetchMapsList() {
        maps.value = db.mapsList()
    }
}
