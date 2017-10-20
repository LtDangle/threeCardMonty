//
//  ViewController.swift
//  2017-MyFirstApp
//
//  Created by C4Q on 10/16/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBOutlet weak var winCount: UILabel!
    
    
    var myArr = [UIButton]()
    var winningButton = UIButton()
    override func viewDidLoad() {
        myArr = [leftButton, rightButton, middleButton]
        winningButton = myArr[Int(arc4random_uniform(3))]
        
        winningButton.setImage(UIImage(named: "ace_of_spades"), for: .disabled)
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender == winningButton {
            displayLabel.text = "You Win"
            winCount.text = String(Int(winCount.text!)! + 1)
        } else {
            displayLabel.text = "You Lose"
            sender.setImage(UIImage(named: "2_of_diamonds"), for: .disabled)
        }
        myArr.forEach{$0.isEnabled = false}
    }
    
    @IBAction func resetGame(_ sender: Any) {
        displayLabel.text = "Find The Ace"
        myArr.forEach{
            $0.setImage(UIImage(named:"red_joker"), for: .disabled)
            $0.isEnabled = true
        }
        
        
        winningButton = myArr[Int(arc4random_uniform(3))]
        winningButton.setImage(UIImage(named: "ace_of_spades"), for: .disabled)
        
    }
    
}

