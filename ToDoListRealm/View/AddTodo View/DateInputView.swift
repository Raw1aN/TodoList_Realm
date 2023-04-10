//
//  DateInputView.swift
//  ToDoListRealm
//
//  Created by Алексей Щукин on 10.04.2023.
//

import Foundation
import UIKit

class DateInputView: UIView{
    
// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Private Properties
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.locale = .current
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = UIColor(named: "ToDoColor")
        return datePicker
    }()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM HH:mm yyyy"
        return formatter
    }()
    
    private let calendarImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "calendar")!)
        return image
    }()
}

extension DateInputView{
    
// MARK: - Initialize
    private func initialize(){
        addSubview(calendarImage)
        calendarImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
        }
        addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
        }
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
}

// MARK: - Get Data
extension DateInputView{
    
    func getDate() -> String{
        dateFormatter.string(from: datePicker.date)
    }
}
