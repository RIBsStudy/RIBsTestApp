//
//  ImhoTodoListRepository.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/06/02.
//

import Foundation
import Combine

protocol ImhoTodoListRepositoryType {
    var list: ReadOnlyCurrentValuePublisher<[ImhoTodoItemDataModel]> { get }
    func changeStatus(at index: Int)
    func delete(at index: Int)
}

class ImhoTodoListRepository: ImhoTodoListRepositoryType {
    
    var list: ReadOnlyCurrentValuePublisher<[ImhoTodoItemDataModel]> { todoListDataSubject }
    
    private var todoListDataSubject = CurrentValuePublisher<[ImhoTodoItemDataModel]>([
        ImhoTodoItemDataModel(
            id: UUID().uuidString,
            title: "독서모임: 죽음의 수용소 읽기",
            description: "",
            date: Date(),
            status: .todo
        ),
        ImhoTodoItemDataModel(
            id: UUID().uuidString,
            title: "Swift Expert 스터디: 챕터 2 읽기",
            description: "",
            date: Date(),
            status: .todo
        ),
        ImhoTodoItemDataModel(
            id: UUID().uuidString,
            title: "RIBs 스터디: ToDo 앱 개발하기",
            description: "",
            date: Date(),
            status: .done
        )
      ])
    
    init() {}
}

extension ImhoTodoListRepository {
    
    func changeStatus(at index: Int) {
        guard todoListDataSubject.value.count > index else {
            return
        }
        
        var new = todoListDataSubject.value
        new[index].toggleStatus()
        
        todoListDataSubject.send(new)
    }
    
    func add(_ data: ImhoTodoItemDataModel) {
        var new = todoListDataSubject.value
        new.append(data)
        
        todoListDataSubject.send(new)
    }
    
    func delete(at index: Int) {
        guard todoListDataSubject.value.count > index else {
            return
        }
        
        var new = todoListDataSubject.value
        new.remove(at: index)
        
        todoListDataSubject.send(new)
    }
}
