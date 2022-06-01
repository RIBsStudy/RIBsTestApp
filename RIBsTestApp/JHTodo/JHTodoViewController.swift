//
//  JHTodoViewController.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/05/31.
//

import ModernRIBs
import SwiftUI

protocol JHTodoPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    
    func moveToAddTodoVC()
}

final class JHTodoViewController: UIViewController, JHTodoPresentable, JHTodoViewControllable {
    
    weak var listener: JHTodoPresentableListener?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        title = "Todo"
        view.backgroundColor = .white
        
        setNaviItem()
    }
}

extension JHTodoViewController {
    private func setNaviItem() {
        let btn = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                  style: .plain,
                                  target: self,
                                  action: #selector(addTodo))
        self.navigationItem.rightBarButtonItem = btn
    }
    
    @objc private func addTodo() {
        listener?.moveToAddTodoVC()
    }
}

extension JHTodoViewController {
    
    func addListVC(_ view: ViewControllable) {
        let vc = view.uiviewController
        addChild(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}
