//
//  ImhoTodoHomeBuilder.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs

protocol ImhoTodoHomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ImhoTodoHomeComponent: Component<ImhoTodoHomeDependency>, ImhoTodoNewItemDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ImhoTodoHomeBuildable: Buildable {
    func build(withListener listener: ImhoTodoHomeListener) -> ImhoTodoHomeRouting
}

final class ImhoTodoHomeBuilder: Builder<ImhoTodoHomeDependency>, ImhoTodoHomeBuildable {

    override init(dependency: ImhoTodoHomeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ImhoTodoHomeListener) -> ImhoTodoHomeRouting {
        let component = ImhoTodoHomeComponent(dependency: dependency)
        let viewController = ImhoTodoHomeViewController()
        let interactor = ImhoTodoHomeInteractor(presenter: viewController)
        interactor.listener = listener
        let todoNewItem = ImhoTodoNewItemBuilder(dependency: component)
        
        return ImhoTodoHomeRouter(
            interactor: interactor,
            viewController: viewController,
            todoNewItem: todoNewItem
        )
    }
}
