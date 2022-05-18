//
//  TJToDoListViewController.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/18.
//

import ModernRIBs
import UIKit

protocol TJToDoListPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TJToDoListViewController: UIViewController, TJToDoListPresentable, TJToDoListViewControllable {

    weak var listener: TJToDoListPresentableListener?
    
    init() {
      super.init(nibName: nil, bundle: nil)
      
      setupViews()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      
      setupViews()
    }
    
    private func setupViews() {
      title = "홈"
      tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
      view.backgroundColor = .red
//      view.addSubview(widgetStackView)
//
//      NSLayoutConstraint.activate([
//        widgetStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
//        widgetStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        widgetStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//      ])
    }
}
