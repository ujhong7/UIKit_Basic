//
//  DetailViewController.swift
//  MemberList
//
//  Created by yujaehong on 2023/03/13.
//

import UIKit

class DetailViewController: UIViewController {

    // MVC패턴을 위해 따로만든 뷰
    private let detailView = DetailView()
    
    // 전화면에서 Member데이터를 전달 받기 위한 변수
    var member: Member?
    
    // MVC패턴을 위해서 view교체
    override func loadView(){
        view = detailView
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setButtonAction()
    }
    
    // 멤버를 뷰에 전달 ⭐️ (뷰에서 알아서 화면 셋팅)
    private func setupData(){
        detailView.member = member
        // 데이터 전달: ViewController -> DetailViewController -> DetailView
    }

    // 뷰에 있는 버튼의 타겟 설정
    func setButtonAction(){
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    
    
    
    // MARK: - SAVE버튼 or UPDATE버튼이 눌렸을때의 동작
    
    @objc func saveButtonTapped(){
        print("버튼이 눌림")
    }
}
