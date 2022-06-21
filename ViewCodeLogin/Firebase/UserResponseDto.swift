//
//  UserResponseDto.swift
//  LoginViewCode
//
//  Created by Marcelo Silva on 20/06/22.
//

import Foundation
import FirebaseAuth

protocol YZError: Swift.Error { }

struct UserResponseDto: YZError {
    var user: User
}
