//
//  TopupRouter.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/26.
//

import ModernRIBs

protocol TopupInteractable: Interactable {
    var router: TopupRouting? { get set }
    var listener: TopupListener? { get set }
}

protocol TopupViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
}

final class TopupRouter: Router<TopupInteractable>, TopupRouting {

    
    private let addTaskBuildable: AddTaskBuildable
    private var addTaskRouting: Routing?
    
    init(
        interactor: TopupInteractable,
        viewController: ViewControllable,
        addTaskBuildable: AddTaskBuildable
    ) {
        self.viewController = viewController
        self.addTaskBuildable = addTaskBuildable
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }

    // MARK: - Private

    private let viewController: ViewControllable
}
