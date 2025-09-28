//
//  CustomDatePicker.swift
//  todoApp
//
//  Created by Kerem Saltık on 25.09.2025.
//

import UIKit



/// A reusable, pre-configured `UIDatePicker` for selecting dates consistently throughout the app.
///
/// This class simplifies the creation of a date picker by setting default properties like
/// `datePickerMode`, `locale`, and `timeZone`. It also provides a convenience initializer
/// to set an initial date upon creation.
class CustomDatePicker: UIDatePicker {
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(date: Date? = nil) {
        self.init(frame: .zero)
        setDate(date: date)
    }
    
    // MARK: - Configuration
    /// Sets the default properties for the date picker.
    private func configure(){
        datePickerMode = .date
        locale = Locale.current
        timeZone = TimeZone.current
    }
    
    /// Sets the picker's date to the provided date or defaults to the current date.
    /// - Parameter date: The date to set. If `nil`, the current date is used.
    private func setDate(date: Date? = nil){
        self.date = date ?? .now
    }

}
