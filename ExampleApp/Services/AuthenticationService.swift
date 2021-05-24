//
//  AuthenticationService.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import Foundation
import Combine

protocol AuthenticationService {
    var user: User { get }
    var userPublisher: Published<User>.Publisher { get }
    
    func signIn()
}
