//
//  TitleInputView.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 04.04.2023.
//

import Foundation
import SnapKit

class TitleInputView: UIView{
    
// MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Private Properties
    private let tittleTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return textfield
    }()
}

extension TitleInputView{
    
// MARK: - Initialize
    private func initialize(){
        addSubview(tittleTextField)
        tittleTextField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        //self.layer.borderColor = UIColor(named: "ToDoColor")?.cgColor
        self.layer.borderColor = UIColor.black.cgColor
        tittleTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
    }
}

// MARK: - UITextField Extension
extension UITextField {
    
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

extension TitleInputView{
    
    @objc func tapDone(sender: Any){
        endEditing(true)
    }
}

extension TitleInputView{
    
    func getTitle() -> String{
        guard let result = tittleTextField.text else { return "" }
        return result
    }
}
