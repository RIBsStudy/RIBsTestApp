//
//  JHTodoBuilder.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/05/31.
//

import ModernRIBs

protocol JHTodoDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class JHTodoComponent: Component<JHTodoDependency>,
                                JHTodoListDependency,
                                AddTodoItemDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol JHTodoBuildable: Buildable {
    func build(withListener listener: JHTodoListener) -> JHTodoRouting
}

final class JHTodoBuilder: Builder<JHTodoDependency>, JHTodoBuildable {
    
    override init(dependency: JHTodoDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: JHTodoListener) -> JHTodoRouting {
        let component = JHTodoComponent(dependency: dependency)
        let viewController = JHTodoViewController()
        let interactor = JHTodoInteractor(presenter: viewController)
        interactor.listener = listener
        
        // child vc
        let listBuildable = JHTodoListBuilder(dependency: component)
        let addItemBuildable = AddTodoItemBuilder(dependency: component)
        
        return JHTodoRouter(interactor: interactor,
                            viewController: viewController,
                            listBuildable: listBuildable,
                            addItemBuildable: addItemBuildable)
    }
}
