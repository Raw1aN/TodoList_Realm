//
//  DescriptionInputView.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 04.04.2023.
//

import Foundation
import SnapKit

class DescriptionInputView: UIView{
    
// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Private Properties
    
    private let descriptionTextField: UITextView = {
        let textfield = UITextView()
        textfield.textColor = .black
        textfield.backgroundColor = .white
        textfield.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        textfield.showsVerticalScrollIndicator = false
        return textfield
    }()
    
}

// MARK: - Initialize
extension DescriptionInputView{
    
    private func initialize(){
        addSubview(descriptionTextField)
        descriptionTextField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        descriptionTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
    }
    
}

// MARK: - UITextView extension
extension UITextView {
    
    func addDoneButton(title: String, target: Any, selector: Selector) {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
        toolBar.setItems([flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
}

extension DescriptionInputView {
    
    @objc func tapDone(sender: Any){
        endEditing(true)
    }
}

extension DescriptionInputView{
    
    func getDescription() -> String{
        guard let result = descriptionTextField.text else { return "" }
        return result
    }
}
