//
//  AppRootRouter.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/12.
//

import ModernRIBs

protocol AppRootInteractable: Interactable,
                              TJToDoListListener,
                              ImhoTodoHomeListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    func setViewControllers(_ viewControllers: [ViewControllable])
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {
    
    private let tjToDoList: TJToDoListBuildable
    private var imhoTodoHome: ImhoTodoHomeBuildable
    
    private var tjToDoListRouting: ViewableRouting?
    private var imhoTodoHomeRouting: ViewableRouting?
    
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        tjToDoList: TJToDoListBuildable,
        imhoTodoHome: ImhoTodoHomeBuildable
    ) {
        self.tjToDoList = tjToDoList
        self.imhoTodoHome = imhoTodoHome
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTabs() {
        let tjToDoListRouting = tjToDoList.build(withListener: interactor)
        let imhoTodoHomeRouting = imhoTodoHome.build(withListener: interactor)
        
        attachChild(tjToDoListRouting)
        attachChild(imhoTodoHomeRouting)
        
        let viewControllers = [
            NavigationControllerable(root: tjToDoListRouting.viewControllable),
            NavigationControllerable(root: imhoTodoHomeRouting.viewControllable)
        ]
        
        viewController.setViewControllers(viewControllers)
    }
}
