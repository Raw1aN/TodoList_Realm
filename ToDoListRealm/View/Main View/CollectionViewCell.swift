//
//  TableViewCell.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 03.04.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
// MARK: - Configure
    func configure(with toDo: Todo){
        dateView.configure(with: toDo)
    }

// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Private Properties
    private let dateView: ToDoCellMainView = {
        let dateView = ToDoCellMainView()
        return dateView
    }()
}

extension CollectionViewCell{
    
// MARK: - Initialize
    private func initialize(){
        contentView.addSubview(dateView)
        dateView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
