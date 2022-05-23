//
//  AddTaskRouter.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/23.
//

import ModernRIBs

protocol AddTaskInteractable: Interactable {
    var router: AddTaskRouting? { get set }
    var listener: AddTaskListener? { get set }
}

protocol AddTaskViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AddTaskRouter: ViewableRouter<AddTaskInteractable, AddTaskViewControllable>, AddTaskRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: AddTaskInteractable, viewController: AddTaskViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
