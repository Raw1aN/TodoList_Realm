//
//  AddTodoViewModel.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 05.04.2023.
//

import Foundation
import RealmSwift

class AddTodoViewModel{
    
// MARK: - Private Properties
    private let dataService = DataService()
    
// MARK: - ViewModel Functions
    func addTodo(title: String, toDoDescription: String, deadline: String){
        let time = Date()
        let format = DateFormatter()
        format.timeStyle = .medium
        format.dateStyle = .medium
        let date = format.string(from: time)
        let id = NSUUID().uuidString.lowercased()
        dataService.writeTodo(title: title, toDoDescription: toDoDescription, date: date, id: id, deadline: deadline)
    }
}
