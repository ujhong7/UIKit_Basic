//
//  ViewController.swift
//  UpDownGame
//
//  Created by yujaehong on 2023/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var randomNum = Int.random(in: 1...10)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        introduceLabel.text = "선택하세요"
        numberLabel.text = ""
        
    }
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let numString = sender.currentTitle!
        numberLabel.text = numString
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        introduceLabel.text = "다시 선택하세요"
        numberLabel.text = ""
        randomNum = Int.random(in: 1...10)
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        guard let numString = numberLabel.text else{
            introduceLabel.text = "X"
            return
        }
        
        guard let mySelectedNum = Int(numString) else{
            introduceLabel.text = "X"
            return
        }
        
        if randomNum > mySelectedNum{
            introduceLabel.text = "UP"
        }else if randomNum < mySelectedNum{
            introduceLabel.text = "DOWN"
        }else{
            introduceLabel.text = "BINGO👍"
        }
        
        
    }
    
    
    
}

