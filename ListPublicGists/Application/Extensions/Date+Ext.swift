//
//  Date+Ext.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 18/10/20.
//

import Foundation

extension Date {
    
    /// Fomatador de datas
    /// - Parameter format: Forma desejada
    /// - Returns: String com a data formatada
    func getFormattedDate(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension String {
    func toDate(formatt: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatt
        return dateFormatter.date(from: self)
    }
}
