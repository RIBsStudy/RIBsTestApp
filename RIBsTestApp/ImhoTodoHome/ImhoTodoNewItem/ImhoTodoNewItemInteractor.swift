//
//  ImhoTodoNewItemInteractor.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs
import Foundation

protocol ImhoTodoNewItemRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ImhoTodoNewItemPresentable: Presentable {
    var listener: ImhoTodoNewItemPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ImhoTodoNewItemListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func doneWithNewItem(title: String, description: String, date: Date)
}

final class ImhoTodoNewItemInteractor: PresentableInteractor<ImhoTodoNewItemPresentable>, ImhoTodoNewItemInteractable, ImhoTodoNewItemPresentableListener {

    weak var router: ImhoTodoNewItemRouting?
    weak var listener: ImhoTodoNewItemListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ImhoTodoNewItemPresentable) {
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
    
    func doneButtonTapped(title: String, description: String, date: Date) {
        listener?.doneWithNewItem(title: title, description: description, date: date)
    }
}
