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
        
        let jhTodo = JHTodoBuilder(dependency: component)
        
        let router = AppRootRouter(
            interactor: interactor,
            viewController: tabBar,
            jhTodo: jhTodo
        )
        
        return router
    }
}
