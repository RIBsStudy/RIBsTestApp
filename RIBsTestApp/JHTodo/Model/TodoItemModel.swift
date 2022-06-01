//
//  TodoItemModel.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/06/01.
//

import Foundation

enum TodoItemStatus {
    case todo
    case done
    case none
    
    var title: String {
        switch self {
        case .todo:
            return "진행중"
        case .done:
            return "완료"
        default:
            return ""
        }
    }
    
    static func getStatus(title: String) -> TodoItemStatus {
        if title == "진행중" {
            return .todo
        } else if title == "완료" {
            return .done
        } else {
            return .none
        }
    }
}
    
struct TodoItem {
    let title: String
    let desc: String
    let date: String
    var status: TodoItemStatus
    
    mutating func updateStatus(with status: TodoItemStatus) {
        self.status = status
    }
}

