//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Jeff Norton on 7/11/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    // MARK: - Stored Properties
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    // MARK: - Action(s)
    
    @IBAction func drawButtonTapped(sender: UIButton) {
        
        CardController.drawCards(1) { (cards) in
            
            guard let card = cards.first else { return }
            
            ImageController.imageForURL(card.imageURL, completion: { (image) in
                
                guard let image = image else { return }
                
                self.cardImageView.image = image
                
            })
            
        }
        
    }
    
}
