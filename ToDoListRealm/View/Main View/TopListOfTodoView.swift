//
//  TopListOfTodoView.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 04.04.2023.
//

import Foundation
import SnapKit

class TopListOfTodoView: UIView{

// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Private Properties
    private let appImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Union")
        return image
    }()
    
    private let tittleLabel: UILabel = {
        let label = UILabel()
        label.text = "LIST OF TODO"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textColor = UIColor(named: "ToDoColor")!
        return label
    }()
}

extension TopListOfTodoView{

// MARK: - Initialize
    private func initialize(){
        addSubview(appImage)
        addSubview(tittleLabel)
        appImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(25)
            make.centerY.equalToSuperview()
        }
        tittleLabel.snp.makeConstraints { make in
            make.leading.equalTo(appImage.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
    }
}
