//
//  MemberListManager.swift
//  MemberList
//
//  Created by yujaehong on 2023/03/10.
//

import UIKit

final class MemberListManger {
    // 멤버리스트를 저장하기 위한 배열
    private var memberList: [Member] = []
    
    // 전체 멤버 리스트 만들기 (꼭 필요하지 않고, 원래 배열에 멤버 생성해도 됨)
    func makeMembersListDatas(){
        memberList = [
            Member(name: "홍길동", age: 20, phone: "010-1111-2222", address: "서울"),
            Member(name: "임꺽정", age: 23, phone: "010-2222-3333", address: "서울"),
            Member(name: "스티브", age: 50, phone: "010-1234-1234", address: "미국"),
            Member(name: "쿡", age: 30, phone: "010-7777-7777", address: "캘리포니아"),
            Member(name: "베조스", age: 50, phone: "010-2222-7777", address: "하와이"),
            Member(name: "배트맨", age: 40, phone: "010-3333-1234", address: "고담씨티"),
            Member(name: "조커", age: 40, phone: "010-4321-1234", address: "고담씨티")
        ]
    }

    // 전체 멤버 리스트 얻기
    func getMemberList() -> [Member] {
        return memberList
    }
    
    // 새로운 멤버 만들기
    func makeNewMember(_ member: Member){
        memberList.append(member)
    }
    
    // 기존 멤버의 정보 업데이트
    func updateMemberInfo(index: Int, _ member: Member){
        memberList[index] = member
    }
    
    // 특정 멤버 얻기 (굳이 필요 없지만, 서브스크립트 구현해보기)
    subscript(index: Int) -> Member{
        get{
            return memberList[index]
        }
    }
}
