//
//  TodoView.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 09.04.2023.
//

import Foundation
import UIKit

class TodoView: UIView{
    
// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        titleLabelConfiguration()
        dateLabelConfiguration()
        scrollViewConfiguration()
        descriptionLabelConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Configuration
    func configure(with todo: Todo){
        titleLabel.text = todo.title
        descriptionLabel.text = todo.todoDescription
        //dateLabel.text = "Created at \(todo.date)"
        dateLabel.text = "\(todo.deadline)"
    }
    
// MARK: - Private Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let scrollview: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.showsVerticalScrollIndicator = false
        return scrollview
    }()
}

extension TodoView{
    
// MARK: - View Configurations
    private func titleLabelConfiguration(){
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(10)
        }
    }
    
    private func dateLabelConfiguration(){
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
        }
    }
    
    private func descriptionLabelConfiguration(){
        scrollview.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollview.snp.width)
        }
    }
    
    private func scrollViewConfiguration(){
        addSubview(scrollview)
        scrollview.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.bottom.equalTo(dateLabel.snp.top)
        }
    }
}
