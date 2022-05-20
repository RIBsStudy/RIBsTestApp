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
//        let tabOneRootRouting = tabOneHome.build(withListener: interactor)
//        let tabTwoRootRouting = tabTwoHome.build(withListener: interactor)
//        let tabThreeRootRouting = tabThreeHome.build(withListener: interactor)
//
//        attachChild(tabOneHomeRouting)
//        attachChild(tabTwoHomeRouting)
//        attachChild(tabThreeHomeRouting)
//
//        let viewControllers = [
//          NavigationControllerable(root: tabOneHomeRouting.viewControllable),
//          NavigationControllerable(root: tabTwoHomeRouting.viewControllable),
//          NavigationControllerable(root: tabThreeHomeRouting.viewControllable),
//        ]
//
//        viewController.setViewControllers(viewControllers)
    }
}
