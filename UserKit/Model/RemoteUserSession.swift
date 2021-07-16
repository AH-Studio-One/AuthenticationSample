//
//  RemoteUserSession.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-15.
//

import Foundation

public struct RemoteUserSession: Codable {
    let token: AuthToken

    public init(token: AuthToken) {
        self.token = token
    }
}
extension RemoteUserSession: Equatable {
    public static func ==(lhs: RemoteUserSession, rhs: RemoteUserSession) -> Bool {
        return lhs.token == rhs.token
    }
}
extension RemoteUserSession {
  static var fake: RemoteUserSession {
    RemoteUserSession(token: "fake-auth-token")
  }
}
