//
//  TopupInteractor.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/26.
//

import ModernRIBs

protocol TopupRouting: Routing {
    func cleanupViews()
}

final class TopupInteractor: Interactor, TopupInteractable {

    weak var router: TopupRouting?
    weak var listener: TopupListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
        // TODO: Pause any business logic.
    }
}
