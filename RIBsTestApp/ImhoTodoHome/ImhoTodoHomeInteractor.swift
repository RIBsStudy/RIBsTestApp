//
//  ImhoTodoHomeInteractor.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs
import Foundation
import Combine

protocol ImhoTodoHomeRouting: ViewableRouting {
    func attachTodoNewItem()
    func detachTodoNewItem()
}

protocol ImhoTodoHomePresentable: Presentable {
    var listener: ImhoTodoHomePresentableListener? { get set }
    func update(with items: [ImhoTodoItemPresentationModel])
    func reload()
}

protocol ImhoTodoHomeListener: AnyObject {
}

protocol ImhoTodoHomeInteractorDependency {
    var imhoTodoListRepository: ImhoTodoListRepository { get }
}

final class ImhoTodoHomeInteractor: PresentableInteractor<ImhoTodoHomePresentable>,
                                    ImhoTodoHomeInteractable,
                                    ImhoTodoHomePresentableListener {

    weak var router: ImhoTodoHomeRouting?
    weak var listener: ImhoTodoHomeListener?
    private var cancellables: Set<AnyCancellable>
    
    private let dependency: ImhoTodoHomeInteractorDependency
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY.MM.dd"
        return dateFormatter
    }()

    init(presenter: ImhoTodoHomePresentable, dependency: ImhoTodoHomeInteractorDependency) {
        self.dependency = dependency
        self.cancellables = .init()
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        dependency.imhoTodoListRepository.list.sink { [weak self] listData in
            let viewModels = listData.map {
                ImhoTodoItemPresentationModel.init(dataModel: $0, formatter: self!.dateFormatter)
            }
            self?.presenter.update(with: viewModels)
        }.store(in: &cancellables)
        
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    func showNewItem() {
        router?.attachTodoNewItem()
    }
    
    func doneWithNewItem(title: String, description: String, date: Date) {
        guard !title.isEmpty else {
            router?.detachTodoNewItem()
            return
        }
        
        let data = ImhoTodoItemDataModel(
            id: UUID().uuidString,
            title: title,
            description: description,
            date: date,
            status: .todo
        )
        dependency.imhoTodoListRepository.add(data)
        router?.detachTodoNewItem()
    }
    
    func changeStatus(at index: Int) {
        dependency.imhoTodoListRepository.changeStatus(at: index)
    }
    
    func delete(at index: Int) {
        dependency.imhoTodoListRepository.delete(at: index)
    }
}
