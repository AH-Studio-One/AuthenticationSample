//
//  SignInUseCase.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-16.
//

import Foundation
import Combine

/// Use case for signing in users. Attempts to remotely authenticate user and stores the user's session.
class SignInUseCase {
  let username: String
  let password: String
  
  let remoteAPI: UserAuthenticationRemoteAPI
  let userSessionStore: UserSessionStore
  
  init(username: String,
       password: String,
       remoteAPI: UserAuthenticationRemoteAPI,
       userSessionStore: UserSessionStore) {
    self.username = username
    self.password = password
    self.remoteAPI = remoteAPI
    self.userSessionStore = userSessionStore
  }
  
  func start() -> AnyPublisher<UserSession, ErrorMessage> {
    let future = signIn()
                  .flatMap(store(authenticatedUserSession:))
                  .eraseToAnyPublisher()
    return future
  }
  
  func signIn() -> AnyPublisher<UserSession, ErrorMessage> {
    let future =
      remoteAPI.signIn(username: username, password: password)
        .mapError { signInError in
          signInError.errorMessage
        }
        .eraseToAnyPublisher()
    return future
  }
  
  func store(authenticatedUserSession: UserSession) -> AnyPublisher<UserSession, ErrorMessage> {
    let future =
      userSessionStore.store(authenticatedUserSession)
        .mapError { storeAuthenticatedUserSessionError in
          storeAuthenticatedUserSessionError.errorMessage
        }
      .eraseToAnyPublisher()
    return future
  }
}
