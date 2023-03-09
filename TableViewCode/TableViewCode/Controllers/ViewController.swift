//
//  ViewController.swift
//  TableViewCode
//
//  Created by yujaehong on 2023/03/07.
//

import UIKit

final class ViewController: UIViewController {

    private let tableView = UITableView()
    
    // 테이블뷰의 데이터를 표시하기 위한 배열
    var movieArray: [Movie] = []
    
    // MVC패턴을 위한 데이터 매니저 (배열관리 - 데이터)
    var movieDataManger = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNaviBar()
        setupTableView()
        setupDatas()
        setupTableViewConstraints()
    }

    func setupNaviBar(){
        title = "영화목록"
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정 ⭐️
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setupTableView(){
        // 델리게이트 패턴의 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        
        // 셀의 높이 설정
        tableView.rowHeight = 120
        
        // 셀의 등록과정 ⭐️ (스토리보드 사용시에는 스토리보드에서 자동등록)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    func setupDatas(){
        movieDataManger.makeMovieData() // 일반적으로는 서버에 요청
        movieArray = movieDataManger.getMovieData() // 데이터 받아서 뷰컨의 배열에 저장
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
    // 1️⃣ 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)를 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    // 2️⃣ 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MyTableViewCell
         
        // ⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️
//        cell.mainImageView.image = movieArray[indexPath.row].movieImage
//        cell.movieNameLabel.text = movieArray[indexPath.row].movieName
//        cell.descriptionLabel.text = movieArray[indePath.row].movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    // 셀이 선택 되었을 때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음 화면으로 이동
        let detailVC = DetailViewController()
        detailVC.movieData = movieArray[indexPath.row]
        // show(detailVC, sender: nil)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

