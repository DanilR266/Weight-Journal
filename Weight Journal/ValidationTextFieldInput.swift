//
//  ValidationTextFieldInput.swift
//  Weight Journal
//
//  Created by Данила on 05.11.2024.
//

import Foundation


class ValidationTextFieldInput {
    
    static let shared = ValidationTextFieldInput()
    
    func checkValidString(textField: NSString?, range: NSRange,
                          string: String, textFieldText: String?) -> Bool {
        if string.isEmpty {
            return true
        }
        
        let allowedCharacters = "0123456789."
        let characterSet = CharacterSet(charactersIn: allowedCharacters)
        if string.rangeOfCharacter(from: characterSet.inverted) == nil {
            if string == "." && (textFieldText?.isEmpty ?? true) {
                return false
            }
            if string == "." && range.location > 0 {
                if let previousCharacter = (textField)?.character(at: range.location - 1),
                   previousCharacter == Character(".").asciiValue ?? 0 {
                    return false
                }
            }
            if string == "." && (textFieldText?.contains(".") ?? false) {
                return false
            }
            
            return true
        }
        
        return false
    }
    
}
