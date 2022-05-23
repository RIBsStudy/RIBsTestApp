//
//  TJToDoListInteractor.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/18.
//

import ModernRIBs

protocol TJToDoListRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol TJToDoListPresentable: Presentable {
    var listener: TJToDoListPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol TJToDoListListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class TJToDoListInteractor: PresentableInteractor<TJToDoListPresentable>, TJToDoListInteractable {

    weak var router: TJToDoListRouting?
    weak var listener: TJToDoListListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: TJToDoListPresentable) {
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

// MARK: - TJToDoListInteractor

extension TJToDoListInteractor: TJToDoListPresentableListener {
  func didTapClose() {
  }
  
  func didSelectItem(at index: Int) {
  }
}
