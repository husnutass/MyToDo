//
//  DataNotifierProtocol.swift
//  MyToDo
//
//  Created by Hüsnü Taş on 12.03.2022.
//

import Foundation

protocol DataNotifierProtocol {
    func subscribeData(key: String, notifier: @escaping ResponseBlock)
    func unsubscribeData(key: String)
    func publishData(response: ResponseType)
}
