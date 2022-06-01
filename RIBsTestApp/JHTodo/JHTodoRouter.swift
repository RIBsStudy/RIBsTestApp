//
//  JHTodoRouter.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/05/31.
//

import ModernRIBs

protocol JHTodoInteractable: Interactable,
                                JHTodoListListener,
                                AddTodoItemListener {
    
    var router: JHTodoRouting? { get set }
    var listener: JHTodoListener? { get set }
}

protocol JHTodoViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func addListVC(_ view: ViewControllable)
}

final class JHTodoRouter: ViewableRouter<JHTodoInteractable, JHTodoViewControllable>, JHTodoRouting {
    
    private let listBuildable: JHTodoListBuildable
    private var listRouting: Routing?
    
    private let addItemBuildable: AddTodoItemBuildable
    private var addItemRouting: Routing?

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: JHTodoInteractable,
         viewController: JHTodoViewControllable,
         listBuildable: JHTodoListBuildable,
         addItemBuildable: AddTodoItemBuildable) {
        
        self.listBuildable = listBuildable
        self.addItemBuildable = addItemBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachList() {
        
        if listRouting != nil {
            return
        }
        
        let listRouting = listBuildable.build(withListener: interactor)
        let listView = listRouting.viewControllable
        viewController.addListVC(listView)
        
        self.listRouting = listRouting
        attachChild(listRouting)
    }
}

// MARK: - add todo item
extension JHTodoRouter {
    
    func attachAddTodoItem() {
        
        if addItemRouting != nil {
            return
        }
        
        let itemRouting = addItemBuildable.build(withListener: interactor)
        let navi = NavigationControllerable(root: itemRouting.viewControllable)
        navi.navigationController.modalPresentationStyle = .fullScreen
        
        viewControllable.present(navi,
                                 animated: true,
                                 completion: nil)
        
        addItemRouting = itemRouting
        attachChild(itemRouting)
    }
    
    func detachAddTodoItem() {
        
    }
}
