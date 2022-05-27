//
//  ImhoTodoHomeInteractor.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs
import Foundation

protocol ImhoTodoHomeRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func attachTodoNewItem()
    func detachTodoNewItem()
}

protocol ImhoTodoHomePresentable: Presentable {
    var listener: ImhoTodoHomePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    func update(with: ImhoTodoItemPresentationModel)
}

protocol ImhoTodoHomeListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ImhoTodoHomeInteractor: PresentableInteractor<ImhoTodoHomePresentable>,
                                    ImhoTodoHomeInteractable,
                                    ImhoTodoHomePresentableListener {

    weak var router: ImhoTodoHomeRouting?
    weak var listener: ImhoTodoHomeListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ImhoTodoHomePresentable) {
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
    
    func showNewItem() {
        router?.attachTodoNewItem()
    }
    
    func doneWithNewItem(title: String, description: String, date: Date) {
        guard !title.isEmpty else {
            router?.detachTodoNewItem()
            return
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY.MM.dd"
        
        let dateString = dateFormatter.string(from: date)
        
        let data = ImhoTodoItemPresentationModel(
            title: title,
            description: description,
            date: dateString, status: .todo
        )
        
        presenter.update(with: data)
        router?.detachTodoNewItem()
    }
}
