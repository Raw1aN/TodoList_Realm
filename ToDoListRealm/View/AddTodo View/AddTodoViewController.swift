//
//  AddTodoViewController.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 04.04.2023.
//

import UIKit

class AddTodoViewController: UIViewController {

// MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonConfiguration()
        tittleLabelConfiguration()
        tittleInputViewConfiguration()
        descriptionLabelConfiguration()
        dateViewConfiguration()
        descriptionInputViewConfiguration()
        viewConfiguration()
    }
    
// MARK: - Private Properties
    private let viewModel = AddTodoViewModel()
    
    private let titleInputView: TitleInputView = {
        let view = TitleInputView()
        return view
    }()
    
    private let descriptionInputView: DescriptionInputView = {
        let view = DescriptionInputView()
        return view
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "ToDoColor")
        button.layer.cornerRadius = 12
        button.setTitle("ADD TODO", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let tittleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.text = "Title"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.text = "Description"
        return label
    }()
    
    private let dateInputView: DateInputView = {
        let view = DateInputView()
        return view
    }()
}

// MARK: - View Configurations
extension AddTodoViewController{
    
    func viewConfiguration(){
        view.backgroundColor = .white
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "chevron-left")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "chevron-left")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func tittleLabelConfiguration(){
        view.addSubview(tittleLabel)
        tittleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(0)
            make.trailing.leading.equalToSuperview().inset(25)
        }
    }
    
    func descriptionLabelConfiguration(){
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleInputView.snp.bottom).offset(12)
            make.trailing.leading.equalToSuperview().inset(25)
        }
    }
    
    func tittleInputViewConfiguration(){
        view.addSubview(titleInputView)
        titleInputView.snp.makeConstraints { make in
            make.top.equalTo(tittleLabel.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
    }
    
    func descriptionInputViewConfiguration(){
        view.addSubview(descriptionInputView)
        descriptionInputView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview().inset(25)
            make.bottom.equalTo(dateInputView.snp.top).inset(-12)
        }
    }
    
    func addButtonConfiguration(){
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        addButton.addTarget(self, action: #selector(addTodoButtonTaped), for: .touchUpInside)
    }
    
    func dateViewConfiguration(){
        view.addSubview(dateInputView)
        dateInputView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
            make.bottom.equalTo(addButton.snp.top).inset(-10)
        }
    }
}

// MARK: - Button Triggers
extension AddTodoViewController{
    
    @objc func addTodoButtonTaped(){
        viewModel.addTodo(title: titleInputView.getTitle(), toDoDescription: descriptionInputView.getDescription(), deadline: dateInputView.getDate())
        navigationController?.popViewController(animated: true)
    }
}
