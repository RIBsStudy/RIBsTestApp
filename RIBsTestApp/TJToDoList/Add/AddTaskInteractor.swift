//
//  AddTaskInteractor.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/23.
//

import ModernRIBs

protocol AddTaskRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol AddTaskPresentable: Presentable {
    var listener: AddTaskPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AddTaskListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class AddTaskInteractor: PresentableInteractor<AddTaskPresentable>, AddTaskInteractable, AddTaskPresentableListener {

    weak var router: AddTaskRouting?
    weak var listener: AddTaskListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: AddTaskPresentable) {
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
