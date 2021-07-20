//
//  MyAppDependencyContainer.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-15.
//

import Foundation
/// Root dependency container for MyApp which holds objects who live throught the lifetime of MyApp's process, i.e. singletons.
final class MyAppDependencyContainer {
  // MARK: Subsystems
  /// Data store that holds the authenticated user's session. This uses a fake implementation to simulate whether a user is signed when the app launches.
  let userSessionStore: UserSessionStore = FakeUserSessionStore(userAlreadySignedIn: false)
  
  // MARK: Factories
  /// Factory method for creating a new sign in use case to sign users into MyApp.
  func makeSignInUseCase(username: String, password: String) -> SignInUseCase {
    // Gather dependencies.
    let remoteAPI = makeUserAuthenticationRemoteAPI()
    let userSessionStore = self.userSessionStore
    // Make use case.
    return SignInUseCase(username: username,
                         password: password,
                         remoteAPI: remoteAPI,
                         userSessionStore: userSessionStore)
  }
  
  /// Makes a new user authentication remote API for authenticating users using the cloud.
  func makeUserAuthenticationRemoteAPI() -> UserAuthenticationRemoteAPI {
    return FakeUserAuthenticationRemoteAPI()
  }
}
