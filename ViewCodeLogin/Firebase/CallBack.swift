//
//  CallBack.swift
//  LoginViewCode
//
//  Created by Marcelo Silva on 20/06/22.
//

import Foundation

public typealias YZFirebaseUserCallback<T: Swift.Error> = ((Result<T, Swift.Error>) -> Void)
