//
//  AppRootRouter.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/12.
//

import ModernRIBs

protocol AppRootInteractable: Interactable,
                              TJToDoListListener
{
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    func setViewControllers(_ viewControllers: [ViewControllable])
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {
    
    private let tjToDoList: TJToDoListBuildable
    
    private var tjToDoListRouting: ViewableRouting?
    
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        tjToDoList: TJToDoListBuildable
    ) {
        self.tjToDoList = tjToDoList
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTabs() {
        let tjToDoListRouting = tjToDoList.build(withListener: interactor)
        
        attachChild(tjToDoListRouting)
        
        let viewControllers = [
            NavigationControllerable(root: tjToDoListRouting.viewControllable)
        ]
        
        viewController.setViewControllers(viewControllers)
    }
}
