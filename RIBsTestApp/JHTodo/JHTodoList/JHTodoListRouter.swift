//
//  JHTodoListRouter.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/05/31.
//

import ModernRIBs

protocol JHTodoListInteractable: Interactable {
    var router: JHTodoListRouting? { get set }
    var listener: JHTodoListListener? { get set }
}

protocol JHTodoListViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class JHTodoListRouter: ViewableRouter<JHTodoListInteractable, JHTodoListViewControllable>, JHTodoListRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: JHTodoListInteractable, viewController: JHTodoListViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
