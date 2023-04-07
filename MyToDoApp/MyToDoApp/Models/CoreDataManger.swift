//
//  CoreDataManger.swift
//  MyToDoApp
//
//  Created by yujaehong on 2023/04/07.
//

import UIKit
import CoreData



// MARK: - Todo 관리하는 매니저 (코어데이터 관리)

final class CoreDataManger {
    
    // 싱글톤으로 만들기
    static let shared = CoreDataManger()
    private init() {}
    
    
    // 앱 델리게이트
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // 임시저장소
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    // 엔터티(실체) 이름 (코어데이터에 저장된 객체)
    let modelName: String = "ToDoData"
    
    
    
    // MARK: - [Read] 코어데이터에 저장된 데이터 모두 읽어오기
    func getToDoListFromCoreData() -> [ToDoData] { // 83강
        var toDoList: [ToDoData] = []
        
        
    }
    
    
    // MARK: - [Create] 코어데이터에 데이터 생성하기
    
    
    
    // MARK: - [Delete] 코어데이터에서 데이터 삭제하기 (일치하는 데이터 찾아서 -> 삭제)
    
    
    // MARK: - [Update] 코어데이터에서 데이터 수정하기 (일치하는 데이터 찾아서 ===> 수정)
    
}
