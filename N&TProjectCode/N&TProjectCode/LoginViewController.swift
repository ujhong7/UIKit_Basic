//
//  ViewController.swift
//  N&TProjectCode
//
//  Created by yujaehong on 2023/03/05.
//

import UIKit

class LoginViewController: UIViewController {

    // 로그인 버튼
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    func makeUI(){
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // 버튼 누르면 동작하는 코드 -> 코드로 탭바 + 네비게이션바 설정
    @objc func nextButtonTapped(){
        // 탭바 컨트롤러의 생성
        let tabBarVC = UITabBarController()
        
        // 첫번째 화면은 네비게이션컨트롤러로 만들기 (기본루트뷰 설정)
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        let vc4 = FourthViewController()
        let vc5 = FifthViewController()
        
        // 탭바 이름들 설정
        vc1.title = "main"
        vc2.title = "Search"
        vc3.title = "Post"
        vc4.title = "Likes"
        vc5.title = "Me"
        
        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white
        
        // 탭바 이미지 설정
        guard let items = tabBarVC.tabBar.items else {return}
        
        items[0].image = UIImage(systemName: "square.and.arrow.up")
        items[1].image = UIImage(systemName: "folder")
        items[2].image = UIImage(systemName: "paperplane")
        items[3].image = UIImage(systemName: "doc")
        items[4].image = UIImage(systemName: "note")
        
        // 프리젠트로 탭바 띄우기
        present(tabBarVC, animated: true)
        
    }

}

