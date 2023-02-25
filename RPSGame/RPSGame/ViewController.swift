//
//  ViewController.swift
//  RPSGame
//
//  Created by yujaehong on 2023/02/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var comChoice = Rps(rawValue: Int.random(in: 0...2))!
    var myChoice = Rps(rawValue: Int.random(in: 0...2))!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
    }


    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        let select = sender.currentTitle
        
        switch select{
        case "가위":
            myChoice = Rps(rawValue: 2)!
        case "바위":
            myChoice = Rps(rawValue: 0)!
        case "보":
            myChoice = Rps(rawValue: 1)!
        default:
            break
        }
    }
    
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "선택하세요"
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        switch comChoice{
        case .rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case .paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case .scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        switch myChoice{
        case .rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case .paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case .scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        if comChoice == myChoice{
            mainLabel.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper{
            mainLabel.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors{
            mainLabel.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock{
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
    }
}
    


