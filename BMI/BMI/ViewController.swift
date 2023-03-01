//
//  ViewController.swift
//  BMI
//
//  Created by yujaehong on 2023/02/28.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    // bmi 계산 결과값 보관하기 위한 변수
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        configureUI()
        
    }


    func configureUI(){
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        calculateButton.layer.cornerRadius = 5
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
    }
    
    // BMI 계산하기 - 버튼 누르면 (다음화면)
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        bmi = calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
    }
    
    // 조건에 따라 다음화면 이동할지 말지
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == ""{
            mainLabel.text = "키와 몸무게를 입력하세요!"
            mainLabel.textColor = UIColor.red
            return false
        }
        
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = .black
        return true
    }
    
    // 다음화면 넘어가기 전에 준비 (일반적으로 데이터 전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        
    }
    
    
    
    // BMI 계산 메서드
    func calculateBMI(height: String, weight: String) -> Double{
        guard let h = Double(height), let w = Double(weight) else { return 0.0 }
        var bmi = w / ( h * h ) * 10000
        bmi = round(bmi * 10) / 10
        print("BMI 결과값: \(bmi)")
        return bmi
    }
    
    
    
}


extension ViewController: UITextFieldDelegate{
    // ddd
}
