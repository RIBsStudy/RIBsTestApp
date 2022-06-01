//
//  JHTodoListInteractor.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/05/31.
//

import ModernRIBs

protocol JHTodoListRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol JHTodoListPresentable: Presentable {
    var listener: JHTodoListPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol JHTodoListListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class JHTodoListInteractor: PresentableInteractor<JHTodoListPresentable>, JHTodoListInteractable, JHTodoListPresentableListener {

    weak var router: JHTodoListRouting?
    weak var listener: JHTodoListListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: JHTodoListPresentable) {
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
