//
//  ToDoCellMainView.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 03.04.2023.
//

import Foundation
import SnapKit

class ToDoCellMainView: UIView{
    
// MARK: - Configure
    func configure(with toDo: Todo){
        tittleLabel.text = toDo.title
        contentLabel.text = toDo.todoDescription
        createDateLabel.text = toDo.deadline
    }

// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initialize()
        viewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Private Properties
    private let tittleLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.text = "Design Logo"
        return label
    }()
    
    private let contentLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.text = "Make Ui design for the mini project post figma link to the trello using Make Ui design for the mini project post figma link to the trello using"
        label.numberOfLines = 2
        return label
    }()
    
    private let createDateLabel = {
        let label = UILabel()
        label.text = "Created at 1 Sept 2021"
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let leftView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "ToDoColor2")
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        return view
    }()
}

extension ToDoCellMainView{
    
// MARK: Initialize
    private func initialize(){
        addSubview(leftView)
        leftView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(30)
        }
        self.layer.cornerRadius = 10
        let contentStack = UIStackView()
        contentStack.alignment = .leading
        contentStack.axis = .vertical
        contentStack.addArrangedSubview(tittleLabel)
        contentStack.addArrangedSubview(contentLabel)
        contentStack.setCustomSpacing(12, after: tittleLabel)
        addSubview(contentStack)
        addSubview(createDateLabel)
        contentStack.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(70)
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(leftView.snp.trailing).offset(20)
        }
        createDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(leftView.snp.trailing).offset(20)
            make.bottom.equalToSuperview().inset(5)
        }
    }
    
// MARK: - Configurations
    private func viewConfiguration(){
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor(named: "ToDoColor2")?.cgColor
        self.layer.borderWidth = 0.5
    }
}
