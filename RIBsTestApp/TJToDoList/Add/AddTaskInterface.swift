import ModernRIBs

public protocol AddTaskBuildable: Buildable {
  func build(withListener listener: AddTaskListener, closeButtonType: DismissButtonType) -> ViewableRouting
}

public protocol AddTaskListener: AnyObject {
  func addTaskDidTapClose()
//  func addTaskDidAddCard(task: PaymentMethod)
}
