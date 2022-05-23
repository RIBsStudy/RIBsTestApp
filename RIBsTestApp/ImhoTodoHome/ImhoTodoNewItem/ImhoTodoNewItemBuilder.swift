//
//  ImhoTodoNewItemBuilder.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs

protocol ImhoTodoNewItemDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ImhoTodoNewItemComponent: Component<ImhoTodoNewItemDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ImhoTodoNewItemBuildable: Buildable {
    func build(withListener listener: ImhoTodoNewItemListener) -> ImhoTodoNewItemRouting
}

final class ImhoTodoNewItemBuilder: Builder<ImhoTodoNewItemDependency>, ImhoTodoNewItemBuildable {

    override init(dependency: ImhoTodoNewItemDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ImhoTodoNewItemListener) -> ImhoTodoNewItemRouting {
        let component = ImhoTodoNewItemComponent(dependency: dependency)
        let viewController = ImhoTodoNewItemViewController()
        let interactor = ImhoTodoNewItemInteractor(presenter: viewController)
        interactor.listener = listener
        return ImhoTodoNewItemRouter(interactor: interactor, viewController: viewController)
    }
}
