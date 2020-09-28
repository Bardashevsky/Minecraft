//
//  Map.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import Foundation

struct Map: Decodable, Hashable, Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title_ru == rhs.title_ru
    }
    
    var images: [[String: String]]
    var file: String
    var title_def: String
    var title_ru: String
    var desc_def: String
    var desc_ru: String
    
    init(images: [[String: String]], file: String, title_def: String, title_ru: String, desc_def: String, desc_ru: String) {
        self.images = images
        self.file = file
        self.title_def = title_def
        self.title_ru = title_ru
        self.desc_def = desc_def
        self.desc_ru = desc_ru
    }
}
