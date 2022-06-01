//
//  ImhoTodoHomeBuilder.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs

protocol ImhoTodoHomeDependency: Dependency {
    var imhoTodoListRepository: ImhoTodoListRepository { get }
}

final class ImhoTodoHomeComponent: Component<ImhoTodoHomeDependency>,
                                   ImhoTodoNewItemDependency,
                                   ImhoTodoHomeInteractorDependency {
    var imhoTodoListRepository: ImhoTodoListRepository { dependency.imhoTodoListRepository }
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
        let interactor = ImhoTodoHomeInteractor(
            presenter: viewController,
            dependency: component
        )
        interactor.listener = listener
        let todoNewItem = ImhoTodoNewItemBuilder(dependency: component)
        
        return ImhoTodoHomeRouter(
            interactor: interactor,
            viewController: viewController,
            todoNewItem: todoNewItem
        )
    }
}
