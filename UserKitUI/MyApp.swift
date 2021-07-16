//
//  CurrentState.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-15.
//

import SwiftUI
import Combine

final class MyApp: ObservableObject {
  /// This is the app's entire state. The SwiftUI view hierarchy is a function of this state.
  @Published private(set) var appState = AppState.launching(.starting)
  
  // MARK: Dependencies
  let myAppDependencyContainer = MyAppDependencyContainer()
  
  // MARK: Computed properties
  /// Helper computed property used by SwiftUI views.
  var isLaunching: Bool {
    return appState == .launching(.starting)
  }
  
  /// Helper computed property used by SwiftUI views.
  var userIsAuthenticated: Bool {
    switch appState {
    case .running(.authenticated):
      return true
    default:
      return false
    }
  }
  
  /// Helper computed property for accessing user.
  /// TODO: Undo this hack once authenticated dependency container is in place.
  var authenticatedUser: UserProfile? {
    switch appState {
    case .running(.authenticated(let userSession)):
        return userSession.profile
    default:
      return nil
    }
  }
  
  init() {
    launchMyApp()
  }
  
  func launchMyApp() {
    startLoadUserSessionUseCase()
  }
  
  /// Determines if user is signed in when app launches.
  func startLoadUserSessionUseCase() {
    let userSessionStore = myAppDependencyContainer.userSessionStore
    let anyCancellable = userSessionStore.getStoredAuthenticatedUserSession().sink(receiveCompletion: { completion in }) { userSession in
        if let userSession = userSession {
            self.appState = .running(.authenticated(userSession))
        } else {
            self.appState = .running(.unauthenticated(.idle))
        }
    }
    appState = .launching(.loadingUserSession(anyCancellable))
  }
  
  /// Attempts to sign in a usere with credentials.
  /// - Parameter username: User provided userename.
  /// - Parameter password: User provided password.
  func startSignInUseCase(username: String, password: String) {
    let useCase = myAppDependencyContainer.makeSignInUseCase(username: username, password: password)
    let anyCancellable = useCase.start().sink(receiveCompletion: { completion in}) { userSession in
        self.appState = .running(.authenticated(userSession))
    }
    appState = .running(.unauthenticated(.signingIn(anyCancellable)))
  }
}

enum AppState: Equatable {
    case launching(LaunchState)
    case running(UserState)
}

enum LaunchState: Equatable {
    case starting
    case loadingUserSession(AnyCancellable)
}

/// Represents whether user is signed in or not. In a complete implemnetation, the `authenticated` case would hold a `UserSession` as an associated value.
enum UserState: Equatable {
    case unauthenticated(UnauthenticatedState)
    case authenticated(UserSession)
}

enum UnauthenticatedState: Equatable {
    case idle
    case signingIn(AnyCancellable)
    case signingUp(AnyCancellable)
}
