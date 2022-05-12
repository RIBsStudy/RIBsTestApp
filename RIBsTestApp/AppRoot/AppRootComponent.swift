//
//  AppRootComponent.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/12.
//

import Foundation
import ModernRIBs

final class AppRootComponent: Component<AppRootDependency> {
    
  private let rootViewController: ViewControllable
  
  init(
    dependency: AppRootDependency,
    rootViewController: ViewControllable
  ) {
    self.rootViewController = rootViewController
    super.init(dependency: dependency)
  }
}
