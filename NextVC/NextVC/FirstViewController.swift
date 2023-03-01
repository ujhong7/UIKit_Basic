//
//  FirstViewController.swift
//  NextVC
//
//  Created by yujaehong on 2023/03/01.
//

import UIKit

class FirstViewController: UIViewController {
    
    let mainLabel = UILabel()
    // 클로저 실행 형태
    let backButton: UIButton = {
        // 버튼 관련 설정
        let button = UIButton(type: .custom)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 일반적으로 데이터를 받을땐 옵셔널 씀
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        makeAutoLayout()
    }
     
    func setup(){
        // 레이블 관련 설정
        // mainLabel.text = "FirstViewController"
        mainLabel.text = someString
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        
        view.addSubview(mainLabel)
        view.addSubview(backButton)
        
        view.backgroundColor = .gray
    }
    
    
    func makeAutoLayout(){
        // 레이블 오토레이아웃
        mainLabel.translatesAutoresizingMaskIntoConstraints = false // 자동으로 잡아주는 것 꺼주기
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // 버튼 오토레이아웃
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    @objc func backButtonTapped(){
        self.dismiss(animated: true)
        print(#function)
    }
    
}
