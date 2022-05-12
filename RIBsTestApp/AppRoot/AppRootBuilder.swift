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
        
//        let tabOneHome = tabOneHomeBuilder(dependency: component)
//        let tabTwoHome = tabTwoHomeBuilder(dependency: component)
//        let tabThreeHome = tabThreeHomeBuilder(dependency: component)
        
        let interactor = AppRootInteractor(presenter: tabBar)
        
        let router = AppRootRouter(
            interactor: interactor,
            viewController: tabBar
            // tabOneHome: tabOneHome,
            // tabTwoHome: tabTwoHome,
            // tabThreeHome: tabThreeHome
        )
        
        return router
    }
}
