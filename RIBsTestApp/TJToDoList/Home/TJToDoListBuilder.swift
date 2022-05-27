//
//  TJToDoListBuilder.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/18.
//

import ModernRIBs

protocol TJToDoListDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    var topupBuildable: TopupBuildable { get }
    var addTaskBuildable: AddTaskBuildable { get }
}

final class TJToDoListComponent: Component<TJToDoListDependency> {
    var topupBuildable: TopupBuildable { dependency.topupBuildable }
    var addTaskBuildable: AddTaskBuildable { dependency.addTaskBuildable }

}

// MARK: - Builder

protocol TJToDoListBuildable: Buildable {
    func build(withListener listener: TJToDoListListener) -> TJToDoListRouting
}

final class TJToDoListBuilder: Builder<TJToDoListDependency>, TJToDoListBuildable {

    override init(dependency: TJToDoListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TJToDoListListener) -> TJToDoListRouting {
        let component = TJToDoListComponent(
            dependency: dependency
        )
        let viewController = TJToDoListViewController()
        let interactor = TJToDoListInteractor(presenter: viewController)
        interactor.listener = listener
        
        return TJToDoListRouter(interactor: interactor,
                                viewController: viewController,
                                addTaskBuildable: component.addTaskBuildable,
                                topupBuildable: component.topupBuildable)
    }
}
