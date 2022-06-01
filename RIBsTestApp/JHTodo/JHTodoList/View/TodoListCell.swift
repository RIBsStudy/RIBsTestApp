//
//  TodoListCell.swift
//  RIBsTestApp
//
//  Created by JUHONG LEE on 2022/06/01.
//

import Foundation
import UIKit

final class CustomLabel: UILabel {
    
    init(font: UIFont, color: UIColor) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        self.textColor = color
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class TodoListCell: UITableViewCell {
    
    private let lbTitle: UILabel =  {
        let lb = CustomLabel(font: UIFont.systemFont(ofSize: 20), color: .black)
        return lb
    }()
    
    private let lbDesc: UILabel =  {
        let lb = CustomLabel(font: UIFont.systemFont(ofSize: 16), color: .gray)
        return lb
    }()
    
    private let lbDate: UILabel =  {
        let lb = CustomLabel(font: UIFont.systemFont(ofSize: 16), color: .gray)
        return lb
    }()
    
    private let btnStatus: UIButton =  {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(UIColor.black, for: .normal)
        return btn
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        lbTitle.text = ""
        lbDesc.text = ""
        lbDate.text = ""
        btnStatus.setTitle("", for: .normal)
    }
}

extension TodoListCell {
    func configure(with item: TodoItem) {
        
        if !self.subviews.contains(lbTitle) {
            addUI()
        }
        
        lbTitle.text = item.title
        lbDesc.text = item.desc
        lbDate.text = item.date
        btnStatus.setTitle(item.status.title, for: .normal)
    }
    
    private func addUI() {
        contentView.addSubview(lbTitle)
        contentView.addSubview(lbDesc)
        contentView.addSubview(lbDate)
        contentView.addSubview(btnStatus)
        
        btnStatus.addAction(UIAction { [weak self] _ in
            guard let self = self,
                  let title = self.btnStatus.titleLabel?.text else {
                return
            }
            
            let status: TodoItemStatus = TodoItemStatus.getStatus(title: title)
            self.btnStatus.setTitle(status == .todo ? TodoItemStatus.done.title : TodoItemStatus.todo.title , for: .normal)
        }, for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            lbTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            lbTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lbTitle.heightAnchor.constraint(equalToConstant: 20),
            
            lbDesc.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 10),
            lbDesc.leadingAnchor.constraint(equalTo: lbTitle.leadingAnchor),
            lbDesc.heightAnchor.constraint(equalToConstant: 20),
            
            lbDate.topAnchor.constraint(equalTo: lbDesc.bottomAnchor, constant: 10),
            lbDate.leadingAnchor.constraint(equalTo: lbTitle.leadingAnchor),
            lbDate.trailingAnchor.constraint(equalTo: lbDesc.trailingAnchor),
            lbDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            btnStatus.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            btnStatus.leadingAnchor.constraint(equalTo: lbDesc.trailingAnchor, constant: 10),
            btnStatus.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            btnStatus.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            btnStatus.widthAnchor.constraint(equalToConstant: 100),
            
            lbTitle.trailingAnchor.constraint(equalTo: lbDesc.trailingAnchor)
        ])
    }
}
