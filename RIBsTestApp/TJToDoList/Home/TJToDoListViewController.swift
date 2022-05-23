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
    func didTapClose()
    func didSelectItem(at index: Int)
}

final class TJToDoListViewController: UIViewController, TJToDoListPresentable, TJToDoListViewControllable, UITableViewDataSource, UITableViewDelegate {

    weak var listener: TJToDoListPresentableListener?
    
    init() {
      super.init(nibName: nil, bundle: nil)
      
      setupViews()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      
      setupViews()
    }
    
    private var viewModels: [ToDoListViewModel] = []
    
    private lazy var tableView: UITableView = {
      let tableView = UITableView()
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.dataSource = self
      tableView.delegate = self
      tableView.register(cellType: ToDoCell.self)
      tableView.tableFooterView = UIView()
      tableView.rowHeight = 64
      tableView.separatorInset = .zero
      return tableView
    }()
    
    private let addButtonItem = UIBarButtonItem(
      barButtonSystemItem: .add,
      target: nil,
      action: nil
    )
    
    private func setupViews() {
        title = "홈"
        tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        view.backgroundColor = .red
        self.navigationItem.rightBarButtonItem = self.addButtonItem
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ToDoCell = tableView.dequeueReusableCell(for: indexPath)

        if let viewModel = viewModels[safe: indexPath.row] {
            cell.setTitle("\(viewModel.title)")
        } else {
            cell.setTitle("카드 추가")
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
      
        listener?.didSelectItem(at: indexPath.row)
    }
    
    @objc
    private func didTapClose() {
        listener?.didTapClose()
    }
}
