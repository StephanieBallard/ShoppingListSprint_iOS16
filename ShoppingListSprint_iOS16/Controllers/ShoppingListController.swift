//
//  ShoppingListController.swift
//  ShoppingListSprint_iOS16
//
//  Created by Stephanie Ballard on 3/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ShoppingListController: Codable {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingItems: [ShoppingItem] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    func createItem(name: String, hasBeenAdded: Bool) {
        let shoppingItem = ShoppingItem(name: name, hasBeenAdded: hasBeenAdded)
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }
    
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let itemsURL = documentsDir.appendingPathComponent("items.plist")
        return itemsURL
    }
    
    func saveToPersistentStore() {
        guard let persistentFileURL = persistentFileURL else { return }
        
        do {
            
            let encoder = PropertyListEncoder()
            let itemsPlist = try encoder.encode(shoppingItems)
            
            try itemsPlist.write(to: persistentFileURL)
            
        } catch {
            print("Error saving items: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let persistentFileURL = persistentFileURL else { return }
        
        do {
            
            let decoder = PropertyListDecoder()
            let itemsPlist = try Data(contentsOf: persistentFileURL)
            
            let items = try decoder.decode([ShoppingItem].self, from: itemsPlist)
            self.shoppingItems = items
            
        } catch {
            print("Error decoding items: \(error)")
        }
    }
}
