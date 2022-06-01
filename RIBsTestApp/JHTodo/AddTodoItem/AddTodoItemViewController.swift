//
//  AddTodoItemViewController.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/06/01.
//

import ModernRIBs
import UIKit

protocol AddTodoItemPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AddTodoItemViewController: UIViewController, AddTodoItemPresentable, AddTodoItemViewControllable {

    weak var listener: AddTodoItemPresentableListener?
    
    private let txtTitle: UITextField = {
        let txt = makeTextField()
        txt.placeholder = "제목"
        return txt
    }()
    
    private static func makeTextField() -> UITextField {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
        txt.keyboardType = .default
        return txt
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(txtTitle)
        
        NSLayoutConstraint.activate([
            txtTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            txtTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            txtTitle.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
