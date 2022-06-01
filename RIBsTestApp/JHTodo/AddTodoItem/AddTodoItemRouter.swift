//
//  AddTodoItemRouter.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/06/01.
//

import ModernRIBs

protocol AddTodoItemInteractable: Interactable {
    var router: AddTodoItemRouting? { get set }
    var listener: AddTodoItemListener? { get set }
}

protocol AddTodoItemViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AddTodoItemRouter: ViewableRouter<AddTodoItemInteractable, AddTodoItemViewControllable>, AddTodoItemRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: AddTodoItemInteractable, viewController: AddTodoItemViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
