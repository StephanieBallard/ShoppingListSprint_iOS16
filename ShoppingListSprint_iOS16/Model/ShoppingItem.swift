//
//  ShoppingItem.swift
//  ShoppingListSprint_iOS16
//
//  Created by Stephanie Ballard on 3/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var hasBeenAdded: Bool = false
    
    var foodImage: UIImage {
        return UIImage(named: name)!
    }
}

    
