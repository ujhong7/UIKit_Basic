//
//  ViewController.swift
//  MemberList
//
//  Created by yujaehong on 2023/03/10.
//

import UIKit

final class ViewController: UIViewController {

    // 테이블뷰
    private let tableView = UITableView()

    // MVC패턴을 위한 데이터 매니저 (배열 관리 - 데이터)
    var memberListManger = MemberListManger()
    
    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = .white
        setupDatas()
        setupTableView()
        setupNaviBar()
        setupTableViewConstraints()
    }

    //
    func setupNaviBar(){
        title = "회원목록"
        
        // 네비게이션바 설정관련
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 네비게이션바 오른쪽 상단 버튼 설정
//        self.navigationItem.rightBarButtonItem = self.plusButton
        
    }
    
    func setupTableView(){
        tableView.dataSource = self
        
        tableView.rowHeight = 60
    }
    
    func setupDatas(){
        memberListManger.makeMembersListDatas() // 일반적으로는 서버에 요청
        
    }
    
    
    
    // 테이블뷰의 오토레이아웃 설정
    func setupTableViewConstraints(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
    }
    
    
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memberListManger.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}
