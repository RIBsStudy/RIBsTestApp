//
//  AddTodoItemBuilder.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/06/01.
//

import ModernRIBs

protocol AddTodoItemDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class AddTodoItemComponent: Component<AddTodoItemDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol AddTodoItemBuildable: Buildable {
    func build(withListener listener: AddTodoItemListener) -> AddTodoItemRouting
}

final class AddTodoItemBuilder: Builder<AddTodoItemDependency>, AddTodoItemBuildable {

    override init(dependency: AddTodoItemDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: AddTodoItemListener) -> AddTodoItemRouting {
        let component = AddTodoItemComponent(dependency: dependency)
        let viewController = AddTodoItemViewController()
        let interactor = AddTodoItemInteractor(presenter: viewController)
        interactor.listener = listener
        return AddTodoItemRouter(interactor: interactor, viewController: viewController)
    }
}
