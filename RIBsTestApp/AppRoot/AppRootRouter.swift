//
//  AppRootRouter.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/12.
//

import ModernRIBs

protocol AppRootInteractable: Interactable, JHTodoListener
{
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    func setViewControllers(_ viewControllers: [ViewControllable])
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {
    
    private let jhTodo: JHTodoBuildable
    private var jhTodoRouting: ViewableRouting?
    
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        jhTodo: JHTodoBuildable
    ) {
        self.jhTodo = jhTodo
        
        super.init(interactor: interactor,
                   viewController: viewController)
        interactor.router = self
    }
    
    func attachTabs() {
        
        let jhTodoRouting = jhTodo.build(withListener: interactor)
        
        attachChild(jhTodoRouting)
        
        let viewControllers = [
            NavigationControllerable(root: jhTodoRouting.viewControllable)
        ]
        
        viewController.setViewControllers(viewControllers)
        
//        viewController.setViewControllers(viewControllers)
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
