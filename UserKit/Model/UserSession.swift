//
//  UserSession.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-15.
//

import Foundation
public typealias AuthToken = String

public struct UserSession: Codable {
    public let profile: UserProfile
    public let remoteSession: RemoteUserSession

    public init(profile: UserProfile, remoteSession: RemoteUserSession) {
        self.profile = profile
        self.remoteSession = remoteSession
    }
}
extension UserSession: Equatable {
    public static func ==(lhs: UserSession, rhs: UserSession) -> Bool {
        return lhs.profile == rhs.profile &&
                lhs.remoteSession == rhs.remoteSession
    }
}
extension UserSession {
  static var fake: UserSession {
    UserSession(profile: UserProfile.fake, remoteSession: RemoteUserSession.fake)
  }
}
