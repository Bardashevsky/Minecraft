//
//  StorageService.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import Foundation
import SQLite

class StorageService {
    
    var database: Connection!
    
    static let shared = StorageService()
    private init() {}
    
    let usersTable = Table("maps")
    
    let id = Expression<Int>("id")
    var image = Expression<String>("image")
    var file = Expression<String>("file")
    var title_def = Expression<String>("title_def")
    var title_ru = Expression<String>("title_ru")
    var desc_def = Expression<String>("desc_def")
    var desc_ru = Expression<String>("desc_ru")
    
    //MARK: - Create Database -
    func createTable() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("map").appendingPathExtension("sqlite3")
            let database = try Connection(fileURL.path)
            self.database = database
        } catch {
            print(error)
        }
        
        let createTable = self.usersTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.image)
            table.column(self.file)
            table.column(self.title_def)
            table.column(self.title_ru)
            table.column(self.desc_def)
            table.column(self.desc_ru)
        }
        
        do {
            try self.database.run(createTable)
            print("Created Table")
        } catch {
            print(error)
        }
    }
    //MARK: - Insert maps -
    public func insertMap(map: Map) {
        
        let insertUser = self.usersTable.insert(self.image <- map.images[0]["image"]!,
                                                self.file <- map.file,
                                                self.title_def <- map.title_def,
                                                self.title_ru <- map.title_ru,
                                                self.desc_def <- map.desc_def,
                                                self.desc_ru <- map.desc_ru)
        
        do {
            try self.database.run(insertUser)
            print("INSERTED MAP")
        } catch {
            print(error)
        }
        
    }
    
    //MARK: - Get maps -
    public func mapsList() -> [Map] {
        var mapsArra = [Map]()
        do {
            let maps = try self.database.prepare(self.usersTable)
            for map in maps {
                mapsArra.append(Map(images: [["image": map[self.image]]], file: map[self.file], title_def: map[self.title_def], title_ru: map[self.title_ru], desc_def: map[self.desc_def], desc_ru: map[self.desc_ru]))
            }
        } catch {
            print(error)
        }
        return mapsArra
    }
}

