//
//  ImhoTodoHomeViewController.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs
import UIKit

protocol ImhoTodoHomePresentableListener: AnyObject {
    func showNewItem()
    func changeStatus(at index: Int)
    func delete(at index: Int)
}

final class ImhoTodoHomeViewController: UIViewController,
                                        ImhoTodoHomePresentable,
                                        ImhoTodoHomeViewControllable {
    
    private var items: [ImhoTodoItemPresentationModel] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ImhoTodoListCell.classForCoder(), forCellReuseIdentifier: ImhoTodoListCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
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
        view.backgroundColor = .systemGray6
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
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func update(with items: [ImhoTodoItemPresentationModel]) {
        self.items = items
        tableView.reloadData()
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    @objc
    private func addTodoItem() {
        listener?.showNewItem()
    }
}

extension ImhoTodoHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImhoTodoListCell.reuseIdentifier, for: indexPath) as? ImhoTodoListCell else {
            return UITableViewCell()
        }
        
        cell.configure(
            with: items[indexPath.row],
            listener: listener,
            index: indexPath.row
        )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            listener?.delete(at: indexPath.row)
        }
    }
    
}
