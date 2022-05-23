//
//  AppRootBuilder.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/12.
//

import ModernRIBs

protocol AppRootDependency: Dependency {}

// MARK: - Builder

protocol AppRootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class AppRootBuilder: Builder<AppRootDependency>, AppRootBuildable {
    
    override init(dependency: AppRootDependency) {
        super.init(dependency: dependency)
    }
    
    func build() -> LaunchRouting {
        let tabBar = RootTabBarController()
        
        let component = AppRootComponent(
            dependency: dependency,
            rootViewController: tabBar
        )
        
        let interactor = AppRootInteractor(presenter: tabBar)
        
        let tjToDoList = TJToDoListBuilder(dependency: component)
        let imhoTodoHome = ImhoTodoHomeBuilder(dependency: component)
        
        let router = AppRootRouter(
            interactor: interactor,
            viewController: tabBar,
            tjToDoList: tjToDoList,
            imhoTodoHome: imhoTodoHome
        )
        
        return router
    }
}
