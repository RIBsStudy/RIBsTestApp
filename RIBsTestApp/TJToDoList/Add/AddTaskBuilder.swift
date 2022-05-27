//
//  AddTaskBuilder.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/23.
//

import ModernRIBs

protocol AddTaskDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class AddTaskComponent: Component<AddTaskDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

//protocol AddTaskBuildable: Buildable {
//    func build(withListener listener: AddTaskListener) -> AddTaskRouting
//}

final class AddTaskBuilder: Builder<AddTaskDependency>, AddTaskBuildable {

    override init(dependency: AddTaskDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: AddTaskListener, closeButtonType: DismissButtonType) -> ViewableRouting {
        let component = AddTaskComponent(dependency: dependency)
        let viewController = AddTaskViewController(closeButtonType: closeButtonType)
        let interactor = AddTaskInteractor(presenter: viewController)
        interactor.listener = listener
        
        return AddTaskRouter(
            interactor: interactor,
            viewController: viewController
        )
    }
}
