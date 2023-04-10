//
//  Todo.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 05.04.2023.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var title = ""
    @objc dynamic var todoDescription = ""
    @objc dynamic var date = ""
    @objc dynamic var id = ""
    @objc dynamic var deadline = ""
}
