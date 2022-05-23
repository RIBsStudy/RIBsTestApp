//
//  TJToDoListRouter.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/18.
//

import ModernRIBs

protocol TJToDoListInteractable: Interactable {
    var router: TJToDoListRouting? { get set }
    var listener: TJToDoListListener? { get set }
}

protocol TJToDoListViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class TJToDoListRouter: ViewableRouter<TJToDoListInteractable, TJToDoListViewControllable>, TJToDoListRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: TJToDoListInteractable, viewController: TJToDoListViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
