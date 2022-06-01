//
//  JHTodoListBuilder.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/05/31.
//

import ModernRIBs

protocol JHTodoListDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class JHTodoListComponent: Component<JHTodoListDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol JHTodoListBuildable: Buildable {
    func build(withListener listener: JHTodoListListener) -> JHTodoListRouting
}

final class JHTodoListBuilder: Builder<JHTodoListDependency>, JHTodoListBuildable {

    override init(dependency: JHTodoListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: JHTodoListListener) -> JHTodoListRouting {
        let component = JHTodoListComponent(dependency: dependency)
        let viewController = JHTodoListViewController()
        let interactor = JHTodoListInteractor(presenter: viewController)
        interactor.listener = listener
        return JHTodoListRouter(interactor: interactor, viewController: viewController)
    }
}
