import ModernRIBs
import UIKit

protocol AddTaskPresentableListener: AnyObject {
    func didTapClose()
    func didTapConfirm(with id: String, title: String, date: String, desc: String)
}

final class AddTaskViewController: UIViewController, AddTaskPresentable, AddTaskViewControllable {
    
    weak var listener: AddTaskPresentableListener?
    
    private let taskTitleTextField: UITextField = {
        let textField = makeTextField()
        textField.placeholder = "일정"
        textField.accessibilityIdentifier = "addtask_title_textfield"
        return textField
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 14
        return stackView
    }()
    
    private let dateTextField: UITextField = {
        let textField = makeTextField()
        textField.placeholder = "날짜"
        textField.accessibilityIdentifier = "addtask_date_textfield"
        return textField
    }()
    
    private let descTextField: UITextField = {
        let textField = makeTextField()
        textField.placeholder = "세부내용"
        textField.accessibilityIdentifier = "addtask_description_textfield"
        return textField
    }()
    
    private let addTaskButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.roundCorners()
//        button.backgroundColor = .primaryRed
        button.setTitle("추가하기", for: .normal)
        button.addTarget(self, action: #selector(didTapAddTaskButton), for: .touchUpInside)
        button.accessibilityIdentifier = "addtask_button"
        return button
    }()
    
    private static func makeTextField() -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }
    
    init(closeButtonType: DismissButtonType) {
        super.init(nibName: nil, bundle: nil)
        
        setupViews()
        setupNavigationItem(with: closeButtonType, target: self, action: #selector(didTapCloseButton))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
        setupNavigationItem(with: .close, target: self, action: #selector(didTapCloseButton))
    }
    
    private func setupViews() {
        title = "일정 추가"
        
        view.backgroundColor = .lightGray
        view.addSubview(taskTitleTextField)
        view.addSubview(stackView)
        view.addSubview(addTaskButton)
        
        stackView.addArrangedSubview(dateTextField)
        stackView.addArrangedSubview(descTextField)
        
        NSLayoutConstraint.activate([
            taskTitleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            taskTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            taskTitleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            taskTitleTextField.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
            taskTitleTextField.heightAnchor.constraint(equalToConstant: 60),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: addTaskButton.topAnchor, constant: -20),
            
            dateTextField.heightAnchor.constraint(equalToConstant: 60),
            descTextField.heightAnchor.constraint(equalToConstant: 60),
            
            addTaskButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            addTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            addTaskButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc
    private func didTapAddTaskButton() {
        if let title = taskTitleTextField.text,
           let date = dateTextField.text,
           let desc = descTextField.text {
            listener?.didTapConfirm(with: "", title: title, date: date, desc: desc)
        }
    }
    
    @objc
    private func didTapCloseButton() {
        listener?.didTapClose()
    }
}
