//
//  ImhoTodoNewItemViewController.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs
import UIKit

protocol ImhoTodoNewItemPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ImhoTodoNewItemViewController: UIViewController, ImhoTodoNewItemPresentable, ImhoTodoNewItemViewControllable {

    weak var listener: ImhoTodoNewItemPresentableListener?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .systemGreen
    }
}
