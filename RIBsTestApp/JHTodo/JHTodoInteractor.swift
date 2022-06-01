//
//  JHTodoInteractor.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/05/31.
//

import ModernRIBs

protocol JHTodoRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func attachList()
    func attachAddTodoItem()
    func detachAddTodoItem()
}

protocol JHTodoPresentable: Presentable {
    var listener: JHTodoPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol JHTodoListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class JHTodoInteractor: PresentableInteractor<JHTodoPresentable>, JHTodoInteractable, JHTodoPresentableListener {

    weak var router: JHTodoRouting?
    weak var listener: JHTodoListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: JHTodoPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        
        router?.attachList()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

extension JHTodoInteractor {
    
    func moveToAddTodoVC() {
        print("addTodo")
        router?.attachAddTodoItem()
    }
}
