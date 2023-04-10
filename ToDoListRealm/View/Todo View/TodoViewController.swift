//
//  TodoViewController.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 09.04.2023.
//

import UIKit

class TodoViewController: UIViewController {
    
// MARK: - Configure
    func configure(with todo: Todo){
        viewModel.todo = todo
    }
    
// MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        navigationBarConfiguration()
        toDoViewConfiguration()
    }
    
// MARK: - Private Properties
    private let viewModel = TodoViewModel()
    
    private let toDoView: TodoView = {
        let view = TodoView()
        return view
    }()
}

extension TodoViewController{
    
// MARK: - Bar Button Configurations
    private func navigationBarConfiguration(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "trash")!, style: .plain, target: self, action: #selector(trashButtonTaped))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension TodoViewController{
    
// MARK: - View Configurations
    private func viewConfiguration(){
        view.backgroundColor = .white
    }
    
    private func toDoViewConfiguration(){
        view.addSubview(toDoView)
        toDoView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        toDoView.configure(with: viewModel.todo)
    }
}

// MARK: - Button triggers
extension TodoViewController{
    
    @objc func trashButtonTaped(){
        viewModel.deleteTodo(with: viewModel.todo.id)
        navigationController?.popViewController(animated: true)
    }
}
