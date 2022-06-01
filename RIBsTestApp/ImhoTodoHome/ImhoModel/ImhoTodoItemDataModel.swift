//
//  ImhoTodoItemModel.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/27.
//

import Foundation

struct ImhoTodoItemDataModel {
    var id: String
    var title: String
    var description: String
    var date: Date
    var status: ImhoTodoItemStatus
    
    mutating func toggleStatus() {
        status = status == .todo ? .done : .todo
    }
}


