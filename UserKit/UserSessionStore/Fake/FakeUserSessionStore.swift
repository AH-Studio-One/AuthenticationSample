//
//  FakeUserSessionStore.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-16.
//

import Combine
import Foundation

/// Fake implementation that's used to simulate whether a user is signed in during launch.
final class FakeUserSessionStore: UserSessionStore {
  let userAlreadySignedIn: Bool
  
  init(userAlreadySignedIn: Bool) {
    self.userAlreadySignedIn = userAlreadySignedIn
  }
  
    
  func getStoredAuthenticatedUserSession() -> Future<UserSession?, GetStoredAuthenticatedUserSessionError> {
    let future = Future<UserSession?, GetStoredAuthenticatedUserSessionError> { promise in
      self.getStoredAuthenticatedUserSession(simulatedIOTime: 2, promise: promise)
    }
    return future
  }
  
  private func getStoredAuthenticatedUserSession(simulatedIOTime: UInt32,
                                                 promise: @escaping (Result<UserSession?, GetStoredAuthenticatedUserSessionError>) -> Void) {
    DispatchQueue.global().async {
      sleep(simulatedIOTime)
      DispatchQueue.main.async {
        self.fulfill(promise)
      }
    }
  }
  
  private func fulfill(_ promise: @escaping (Result<UserSession?, GetStoredAuthenticatedUserSessionError>) -> Void) {
    let result: Result<UserSession?, GetStoredAuthenticatedUserSessionError> =
      self.userAlreadySignedIn ? .success(UserSession.fake) : .success(nil)
    promise(result)
  }
  
    
  func store(_ authenticatedUserSession: UserSession) -> Future<UserSession, StoreAuthenticatedUserSessionError> {
    let future = Future<UserSession, StoreAuthenticatedUserSessionError> { promise in
      self.store(authenticatedUserSession, simulatedIOTime: 2, promise: promise)
    }
    return future
  }
  
  private func store(_ authenticatedUserSession: UserSession,
                     simulatedIOTime: UInt32,
                     promise: @escaping (Result<UserSession, StoreAuthenticatedUserSessionError>) -> Void) {
    DispatchQueue.global().async {
      sleep(simulatedIOTime)
      DispatchQueue.main.async {
        self.fulfillStoreAuthenticatedUser(promise, authenticatedUserSession: authenticatedUserSession)
      }
    }
  }
  
  private func fulfillStoreAuthenticatedUser(_ promise: @escaping (Result<UserSession, StoreAuthenticatedUserSessionError>) -> Void,
                                             authenticatedUserSession: UserSession) {
    promise(.success(authenticatedUserSession))
  }
}
