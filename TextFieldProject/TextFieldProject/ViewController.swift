//
//  ViewController.swift
//  TextFieldProject
//
//  Created by yujaehong on 2023/02/27.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray
        textField.placeholder = "이메일을 입력하세요"
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.always
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        
        // 키보드 올라옴 (최초 응답자 설정)
        textField.becomeFirstResponder()
        
        // 텍스트필드의 대리자가 뷰컨트롤러가됨
        // (텍스트필드에서 일어나는 일을 전달받음)
        textField.delegate = self
    }


    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
    
    // 입력을 시작할때 호출 (시작하지 말지 물어보는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 입력이 시작되면 호출 (시점)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    // 내용을 삭제할 때 호출 (삭제할지 말지를 물어보는 것)
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 글자내용이 (한글자 한글자) 입력되거나 지워질때 호출 (허용할지 말지를 물어보는 것)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        print("텍스트필드 입력값:\(string)")
        
        // 입력되고 있는 글자가 '숫자'인 경우 입력을 허용하지 않는 논리
        if Int(string) != nil {  // (숫자로 변환이 된다면 nil이 아닐테니)
            return false
        } else {
            // 10글자이상 입력되는 것을 막는 코드
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
        
    }
    
    // 엔터키가 눌려졌을때 호출 (동작할지 말지 물어보는 것)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 입력이 끝날때 호출 (끝낼지 말지 물어보는 것)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        
        // 아무것도 입력이 되어 있지 않으면, 입력을 끝내지 못하게
        if textField.text == ""{
            textField.placeholder = "Type Something!"
            return false
        } else{
            return true
        }
    }
    
    // 입력이 (실제) 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        textField.text = ""
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
}

