//
//  UserSessionStore.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-16.
//

import Foundation
import Combine

// MARK: - API

/// Data store for storing the authenticated user's session.
protocol UserSessionStore {
  func getStoredAuthenticatedUserSession() -> Future<UserSession?, GetStoredAuthenticatedUserSessionError>
  func store(_ authenticatedUserSession: UserSession) -> Future<UserSession, StoreAuthenticatedUserSessionError>
}

protocol UserSessionStoreError: Error, ErrorMessageConvertible {}

enum GetStoredAuthenticatedUserSessionError: UserSessionStoreError {
  case unknown
}

enum StoreAuthenticatedUserSessionError: UserSessionStoreError {
  case unknown
}
