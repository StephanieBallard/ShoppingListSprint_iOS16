//
//  ShoppingItemCollectionViewCell.swift
//  ShoppingListSprint_iOS16
//
//  Created by Stephanie Ballard on 3/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        isAddedLabel.text = shoppingItem.hasBeenAdded ? "add" : "not added"
        imageView.image = shoppingItem.foodImage
        itemLabel.text = shoppingItem.name
    }
}

