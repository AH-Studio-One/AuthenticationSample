//
//  SignInViewModel.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-15.
//

import SwiftUI

protocol SignInViewModelProtocol {
  
  var email: Binding<String> { get }
  var password: Binding<String> { get }
  
  func signIn()
}


final class SignInViewModel {
  
  private var _email = ""
  private var _password = ""
  
  private let startSignInUseCase: (String, String) -> Void
  
  init(startSignInUseCase: @escaping (String, String) -> Void) {
    self.startSignInUseCase = startSignInUseCase
  }
}

extension SignInViewModel: SignInViewModelProtocol {
  
  var email: Binding<String> {
    return .init(get: { self._email }, set: { self._email = $0 })
  }
  
  var password: Binding<String> {
    return .init(get: { self._password }, set: { self._password = $0 })
  }
  
  func signIn() {
    startSignInUseCase(_email, _password)
  }
}
