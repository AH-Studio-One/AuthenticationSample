//
//  UserProfile.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-15.
//

import Foundation

public struct UserProfile: Equatable, Codable {
    public let name: String
    public let email: String
    public let mobileNumber: String
}
