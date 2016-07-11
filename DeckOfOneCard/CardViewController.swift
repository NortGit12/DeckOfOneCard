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
    
    // MARK: - General
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action(s)
    
    @IBAction func drawButtonTapped(sender: UIButton) {
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
