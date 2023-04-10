//
//  TodoViewModel.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 09.04.2023.
//

import Foundation

class TodoViewModel{
    
// MARK: - Private Properties
    var todo = Todo()
    private let dataService = DataService()
    
// MARK: - ViewModel Functions
    func deleteTodo(with id: String){
        dataService.deleteTodoById(with: id)
    }
}
