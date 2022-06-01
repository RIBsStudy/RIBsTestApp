//
//  AddTodoItemInteractor.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/06/01.
//

import ModernRIBs

protocol AddTodoItemRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol AddTodoItemPresentable: Presentable {
    var listener: AddTodoItemPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AddTodoItemListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class AddTodoItemInteractor: PresentableInteractor<AddTodoItemPresentable>, AddTodoItemInteractable, AddTodoItemPresentableListener {

    weak var router: AddTodoItemRouting?
    weak var listener: AddTodoItemListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: AddTodoItemPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
