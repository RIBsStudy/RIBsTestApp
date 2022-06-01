//
//  AppRootComponent.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/12.
//

import Foundation
import ModernRIBs

final class AppRootComponent: Component<AppRootDependency>,
                              TJToDoListDependency,
                              ImhoTodoHomeDependency {
    var imhoTodoListRepository: ImhoTodoListRepository
    
    private let rootViewController: ViewControllable
    
    init(
        dependency: AppRootDependency,
        rootViewController: ViewControllable
    ) {
        self.rootViewController = rootViewController
        self.imhoTodoListRepository = ImhoTodoListRepository()
        super.init(dependency: dependency)
    }
}
