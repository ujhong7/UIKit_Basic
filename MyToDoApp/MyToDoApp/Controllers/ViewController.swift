 //
//  ViewController.swift
//  MyToDoApp
//
//  Created by yujaehong on 2023/04/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // 모델(저장 데이터를 관리하는 코어데이터)
    let toDoManager = CoreDataManger.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupTableView()
    }

    
    
    // 화면에 다시 진입할때마다 테이블뷰 리로드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    
    func setupNaviBar() {
        self.title = "메모"
        
        // 네비게이션 우측에 Plus버튼 만들기
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        plusButton.tintColor = .black
        navigationItem.rightBarButtonItem = plusButton
    }
    
    
    func setupTableView() {
        tableView.dataSource = self
        
        // 테이블뷰위 선 없애기
        tableView.separatorStyle = .none
    }
    
    @objc func plusButtonTapped() {
        performSegue(withIdentifier: "ToDoCell", sender: nil)
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoManager.getToDoListFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}


extension ViewController: UITableViewDelegate {
    
}
