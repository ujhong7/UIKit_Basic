//
//  ViewController.swift
//  TableView
//
//  Created by yujaehong on 2023/03/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // 테이블뷰의 데이터를 표시하기 위한 배열
    var movieArray: [Movie] = []
    // MVC패턴을 위한 데이터 매니저 (배열관리 - 데이터)
    var movieDataManager = DataManger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupDatas()
    }
    
    func setupTableView(){
        title = "영화목록"
        // 델리게이트 패턴의 대리자 생성
        tableView.dataSource = self
        tableView.delegate = self
        // 셀의 높이 설정
        tableView.rowHeight = 120
    }
    
    func setupDatas(){
        movieDataManager.makeMovieData() // 일반적으로는 서버에 요청
        movieArray = movieDataManager.getMovieData() // 데이터 받아서 뷰컨의 배열에 저장
    }
    
    // 데이터 추가
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        print(#function)
        movieDataManager.updateMovieData() // 일반적으로는 서버에 요청(데이터 업데이트)
        movieArray = movieDataManager.getMovieData() // 다시 데이터 받아서 뷰컨의 배열에 저장
        tableView.reloadData() // ⭐️ 테이블뷰 다시 불러오기
    }
    
}


extension ViewController: UITableViewDataSource{
    //  1️⃣ 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)를 뷰컨트롤러에게 물어봄 numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        
        return movieArray.count
    }
    
    //  2️⃣ 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어봄 (어떻게 그릴지) cellForRowAt 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        // (힙에 올라간) 재사용 가능한 셀을 꺼내서 사용하는 메서드 (애플이 이미 잘 만들어 놓음!)
        // (사전에 셀을 등록하는 과정이 내부 매커니즘에 존재)
        cell.mainImageView.image = movieArray[indexPath.row].movieImage             // indexPath.row = 행
        cell.movieNameLabel.text = movieArray[indexPath.row].movieName              // indexPath.section  = 그룹
        cell.descriptionLabel.text = movieArray[indexPath.row].movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
}


extension ViewController: UITableViewDelegate{
    
    // 셀이 선택이 되었을 때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄 didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    // prepare세그웨이 (데이터 전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            let detailVC = segue.destination as! DetailViewController
            let index = sender as! IndexPath
            
            // 배열에서 아이템을 꺼내서, 다음화면으로 전달
            detailVC.movieData = movieArray[index.row]
        }
    }
    
}
