//
//  ImhoTodoItemPresentationModel.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/27.
//

import Foundation

struct ImhoTodoItemPresentationModel {
    var title: String
    var description: String
    var date: String
    var status: ImhoTodoItemStatus
}

extension ImhoTodoItemPresentationModel {
    init(dataModel: ImhoTodoItemDataModel, formatter: DateFormatter) {
        title = dataModel.title
        description = dataModel.description
        date = formatter.string(from: dataModel.date)
        status = dataModel.status
    }
}
