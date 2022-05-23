//
//  ImhoTodoHomeRouter.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs

protocol ImhoTodoHomeInteractable: Interactable, ImhoTodoNewItemListener {
    var router: ImhoTodoHomeRouting? { get set }
    var listener: ImhoTodoHomeListener? { get set }
}

protocol ImhoTodoHomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ImhoTodoHomeRouter: ViewableRouter<ImhoTodoHomeInteractable,
                                ImhoTodoHomeViewControllable>,
                                ImhoTodoHomeRouting {

    private let todoNewItem: ImhoTodoNewItemBuildable
    private var todoNewItemRouting: Routing?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(
        interactor: ImhoTodoHomeInteractable,
        viewController: ImhoTodoHomeViewControllable,
        todoNewItem: ImhoTodoNewItemBuildable
    ) {
        self.todoNewItem = todoNewItem
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTodoNewItem() {
        if todoNewItemRouting != nil {
            return
        }

        let router = todoNewItem.build(withListener: interactor)
        router.viewControllable.uiviewController.modalPresentationStyle = .fullScreen
        viewControllable.present(router.viewControllable, animated: true, completion: nil)
        
        self.todoNewItemRouting = router
        attachChild(router)
    }
    
    func detachTodoNewItem() {
        guard let router = todoNewItemRouting else { return }
        
        viewControllable.dismiss(completion: nil)
        detachChild(router)
        todoNewItemRouting = nil
    }
}
