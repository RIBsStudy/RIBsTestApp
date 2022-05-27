//
//  TJToDoListInteractor.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/18.
//

import ModernRIBs

protocol TJToDoListRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func attachTopup()
    func attachAddTask()
    func detachAddTask()
}

protocol TJToDoListPresentable: Presentable {
    var listener: TJToDoListPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol TJToDoListListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class TJToDoListInteractor: PresentableInteractor<TJToDoListPresentable> {

    weak var router: TJToDoListRouting?
    weak var listener: TJToDoListListener?

    let presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: TJToDoListPresentable) {
        self.presentationDelegateProxy = AdaptivePresentationControllerDelegateProxy()
        super.init(presenter: presenter)
        presenter.listener = self
        self.presentationDelegateProxy.delegate = self
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

extension TJToDoListInteractor: TJToDoListInteractable {
    
    func addTaskDidTapClose() {
        router?.detachAddTask()
    }
    
    func topupDidClose() {
//      router?.detachTopup()
    }
    
    func topupDidFinish() {
//      router?.detachTopup()
    }
}

// MARK: - TJToDoListInteractor

extension TJToDoListInteractor: TJToDoListPresentableListener {
    func didTapAddTask() {
        router?.attachAddTask()
    }
    func didTapTopup() {
        router?.attachTopup()
    }
    
    func didTapClose() {
    }
  
    func didSelectItem(at index: Int) {
    }
}

// MARK: - AdaptivePresentationControllerDelegate

extension TJToDoListInteractor: AdaptivePresentationControllerDelegate {
  func presentationControllerDidDismiss() {
    router?.detachAddTask()
  }
}
