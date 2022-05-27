//
//  ImhoTodoItemStatus.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/27.
//

import Foundation

enum ImhoTodoItemStatus {
    case todo
    case done
    
    var text: String {
        switch self {
        case .todo: return "todo"
        case .done: return "done"
        }
    }
}
