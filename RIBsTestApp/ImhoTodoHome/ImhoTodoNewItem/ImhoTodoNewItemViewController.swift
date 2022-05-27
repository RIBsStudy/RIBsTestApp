//
//  ImhoTodoNewItemViewController.swift
//  RIBsTestApp
//
//  Created by Imho Jang on 2022/05/23.
//

import ModernRIBs
import UIKit

protocol ImhoTodoNewItemPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func doneButtonTapped(title: String, description: String, date: Date)
}

final class ImhoTodoNewItemViewController: UIViewController, ImhoTodoNewItemPresentable, ImhoTodoNewItemViewControllable {
    enum Constant {
        static let descriptionPlaceholderText = "Description"
    }
    
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var doneButtonWrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Title"
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.systemGray3.withAlphaComponent(0.3).cgColor
        field.layer.cornerRadius = 5.0
        field.layer.cornerCurve = .continuous
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        field.leftView = paddingView
        field.leftViewMode = .always
        return field
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .dateAndTime
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
        return datePicker
    }()
    
    private lazy var descriptionView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 17)
        view.text = Constant.descriptionPlaceholderText
        view.textColor = .systemGray3
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.systemGray3.withAlphaComponent(0.3).cgColor
        view.layer.cornerRadius = 5.0
        view.layer.cornerCurve = .continuous
        view.delegate = self
        return view
    }()
    
    weak var listener: ImhoTodoNewItemPresentableListener?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        doneButtonWrapperView.addSubview(doneButton)
        
        contentStackView.addArrangedSubview(doneButtonWrapperView)
        contentStackView.addArrangedSubview(titleField)
        contentStackView.addArrangedSubview(descriptionView)
        contentStackView.addArrangedSubview(datePicker)
        
        view.addSubview(contentStackView)
        
        let window = UIApplication.shared.windows.first
        let top = window?.safeAreaInsets.top ?? 0
        
        NSLayoutConstraint.activate([
            doneButtonWrapperView.heightAnchor.constraint(equalTo: doneButton.heightAnchor),
            
            doneButton.centerYAnchor.constraint(equalTo: doneButtonWrapperView.centerYAnchor),
            doneButton.trailingAnchor.constraint(equalTo: doneButtonWrapperView.trailingAnchor),
            
            titleField.heightAnchor.constraint(equalToConstant: 40),
            descriptionView.heightAnchor.constraint(equalToConstant: 100),
            
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: top + 20)
        ])
    }
    
    @objc
    private func doneButtonTapped(_ sender: UIButton) {
        listener?.doneButtonTapped(
            title: titleField.text ?? "",
            description: descriptionView.text,
            date: datePicker.date
        )
    }
    
    @objc
    private func handleDatePicker(_ sender: UIDatePicker) {
        print(sender.date)
    }
}

extension ImhoTodoNewItemViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == Constant.descriptionPlaceholderText {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = Constant.descriptionPlaceholderText
            textView.textColor = .systemGray3
        }
    }
}
