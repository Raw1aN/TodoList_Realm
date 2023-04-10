//
//  MainModelView.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 05.04.2023.
//

import Foundation

class MainModelView{
    
// MARK: - Private Properties
    let dataService = DataService()
    var toDos: [Todo] = []
    
// MARK: - Init
    init(){
        toDos = dataService.getTodos()
    }
    
// MARK: - ViewModel Functions
    func updateTodos(){
        toDos = dataService.getTodos()
    }
}
