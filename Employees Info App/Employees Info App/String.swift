//
//  String.swift
//  Employees Info App
//
//  Created by Mac on 10/07/23.
//

import Foundation

extension String {
   
    func validateEmailId() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
    }
}
