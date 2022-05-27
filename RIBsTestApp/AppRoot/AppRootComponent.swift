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
                              AddTaskDependency,
                              TopupDependency {
    
    lazy var addTaskBuildable: AddTaskBuildable = {
      return AddTaskBuilder(dependency: self)
    }()
    
    lazy var topupBuildable: TopupBuildable = {
      return TopupBuilder(dependency: self)
    }()
    
    var topupBaseViewController: ViewControllable { rootViewController.topViewControllable }
    private let rootViewController: ViewControllable
  
    init(
        dependency: AppRootDependency,
        rootViewController: ViewControllable
    ) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
}
