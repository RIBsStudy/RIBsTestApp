//
//  ImhoTodoNewItemRouter.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs

protocol ImhoTodoNewItemInteractable: Interactable {
    var router: ImhoTodoNewItemRouting? { get set }
    var listener: ImhoTodoNewItemListener? { get set }
}

protocol ImhoTodoNewItemViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ImhoTodoNewItemRouter: ViewableRouter<ImhoTodoNewItemInteractable, ImhoTodoNewItemViewControllable>, ImhoTodoNewItemRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ImhoTodoNewItemInteractable, viewController: ImhoTodoNewItemViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
