//
//  TJToDoListRouter.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/18.
//

import ModernRIBs

protocol TJToDoListInteractable: Interactable,
                                 AddTaskListener,
                                 TopupListener {
    var router: TJToDoListRouting? { get set }
    var listener: TJToDoListListener? { get set }
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy { get }
}

protocol TJToDoListViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class TJToDoListRouter: ViewableRouter<TJToDoListInteractable,
                                TJToDoListViewControllable>,
                              TJToDoListRouting {

    private let addTaskBuildable: AddTaskBuildable
    private var addTaskRouting: Routing?
    
    private let topupBuildable: TopupBuildable
    private var topupRouting: Routing?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(
        interactor: TJToDoListInteractable,
        viewController: TJToDoListViewControllable,
        addTaskBuildable: AddTaskBuildable,
        topupBuildable: TopupBuildable
    ) {
        self.addTaskBuildable = addTaskBuildable
        self.topupBuildable = topupBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachAddTask() {
        guard addTaskRouting == nil else {
            return
        }
        let router = addTaskBuildable.build(withListener: interactor, closeButtonType: .close)
        let navigation = NavigationControllerable(root: router.viewControllable)
        navigation.navigationController.presentationController?.delegate = interactor.presentationDelegateProxy
        viewControllable.present(navigation, animated: true, completion: nil)
        
        addTaskRouting = router
        attachChild(router)
    }

    func detachAddTask() {
        guard let router = addTaskRouting else {
            return
        }
        
        viewControllable.dismiss(completion: nil)
        detachChild(router)
        addTaskRouting = nil
    }
    
    func attachTopup() {
        guard topupRouting == nil else { return }
      
        let router = topupBuildable.build(withListener: interactor)
      
        topupRouting = router
        attachChild(router)
    }
    
    func detachTopup() {
        guard let router = topupRouting else { return }
      
        detachChild(router)
        topupRouting = nil
    }
}
