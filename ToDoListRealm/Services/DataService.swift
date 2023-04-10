//
//  DataService.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 05.04.2023.
//

import Foundation
import RealmSwift

class DataService{
    
    let realm = try! Realm()
    
// MARK: - ADD Todo
    func writeTodo(title: String, toDoDescription: String, date: String, id: String, deadline: String){
        let toDo = Todo()
        toDo.title = title
        toDo.todoDescription = toDoDescription
        toDo.date = date
        toDo.id = id
        toDo.deadline = deadline
        try! self.realm.write {
            self.realm.add(toDo)
        }
    }
    
// MARK: - GET Todos
    func getTodos() -> [Todo]{
        self.realm.objects(Todo.self).map({$0})
    }

// MARK: - DELETE Todo
    func deleteTodoById(with id: String){
        let objectsToDelete = realm.objects(Todo.self).filter("id = %@", id)
        try! self.realm.write {
            self.realm.delete(objectsToDelete)
        }
    }
}
