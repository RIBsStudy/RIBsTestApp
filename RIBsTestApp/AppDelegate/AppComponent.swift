//
//  AppComponent.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/12.
//

import Foundation
import ModernRIBs

final class AppComponent: Component<EmptyDependency>, AppRootDependency {
    init() {
        super.init(dependency: EmptyComponent())
    }
}
