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
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      setupViews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupViews()
    }
    
    func setupViews() {
        
    }
}
