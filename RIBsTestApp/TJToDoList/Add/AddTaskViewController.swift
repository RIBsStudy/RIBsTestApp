//
//  AddTaskViewController.swift
//  RIBsTestApp
//
//  Created by 정태준 on 2022/05/23.
//

import ModernRIBs
import UIKit

protocol AddTaskPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AddTaskViewController: UIViewController, AddTaskPresentable, AddTaskViewControllable {

    weak var listener: AddTaskPresentableListener?
}
