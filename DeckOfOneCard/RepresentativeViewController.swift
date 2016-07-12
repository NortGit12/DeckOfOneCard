//
//  RepresentativeViewController.swift
//  DeckOfOneCard
//
//  Created by Jeff Norton on 7/11/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import UIKit

class RepresentativeViewController: UIViewController {

    // MARK: - Stored Properties
    
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var repsTextArea: UITextView!
    
    // MARK: - Action(s)
    
    @IBAction func seeRepsButtonTapped(sender: UIButton) {
        
        print("[RepresentativeViewController.seeRepsButtonTapped(...)]")
        
        if let state = stateTextField.text where state.characters.count > 0 {
            
            RepresentativeController.getRepresentativesByState(state) { (representatives) in
                
                let repDetailsForDisplay = representatives.map{ "\($0.name)\n\tParty: \($0.party)\n\tState: \($0.state)\n\tDistrict: \($0.district)\n\tPhone: \($0.phone)\n\tOffice: \($0.office)\n\tLink: \($0.link)" }
                
                var displayText = ""
                var counter = 0
                for repDetail in repDetailsForDisplay {
                    
                    if counter > 0 {
                        displayText += "\n"
                    }
                    
                    displayText += repDetail
                    
                    counter += 1
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.repsTextArea.text = displayText
                })
                
            }
            
        }
        
        stateTextField.resignFirstResponder()
        
    }
    

}
