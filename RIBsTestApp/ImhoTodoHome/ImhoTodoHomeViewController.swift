//
//  ImhoTodoHomeViewController.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs
import UIKit

protocol ImhoTodoHomePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func showNewItem()
}

final class ImhoTodoHomeViewController: UIViewController,
                                        ImhoTodoHomePresentable,
                                        ImhoTodoHomeViewControllable {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ImhoTodoListCell.classForCoder(), forCellReuseIdentifier: ImhoTodoListCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGreen
        return tableView
    }()
    
    weak var listener: ImhoTodoHomePresentableListener?
    
    init() {
      super.init(nibName: nil, bundle: nil)
      setupViews()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      setupViews()
    }
    
    func setupViews() {
        title = "홈"
        tabBarItem = UITabBarItem(
            title: "임호",
            image: UIImage(systemName: "list.bullet.rectangle.portrait"),
            selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait.fill")
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(addTodoItem)
        )
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc
    private func addTodoItem() {
        print("addTodoItem Tapped")
        listener?.showNewItem()
    }
}

extension ImhoTodoHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
