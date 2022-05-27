//
//  ImhoTodoListCell.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import Foundation
import UIKit

final class ImhoTodoListCell: UITableViewCell {
    static let reuseIdentifier = String(describing: ImhoTodoListCell.classForCoder())
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var leftStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var date: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private lazy var statusStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 2
        return stack
    }()
    
    private lazy var status: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.layer.cornerRadius = 5
        label.layer.cornerCurve = .continuous
        label.clipsToBounds = true
        return label
    }()
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      setupViews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupViews()
    }
    
    func setupViews() {
        layer.cornerRadius = 7
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.borderWidth = 3.0
        clipsToBounds = true
        
        contentStackView.addArrangedSubview(leftStackView)
        contentStackView.addArrangedSubview(statusStackView)
        
        leftStackView.addArrangedSubview(title)
        leftStackView.addArrangedSubview(date)
        
        statusStackView.addArrangedSubview(status)
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with data: ImhoTodoItemPresentationModel) {
        title.text = data.title
        date.text = data.date
        configureStatusLabel(with: data.status)
    }
    
    func configureStatusLabel(with status: ImhoTodoItemStatus) {
        self.status.text = " \(status.text) "
        switch status {
        case .todo:
            self.status.backgroundColor = .orange
        case .done:
            self.status.backgroundColor = .systemGreen
        }
    }
}
