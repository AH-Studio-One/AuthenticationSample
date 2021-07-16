//
//  ErrorMessage.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-16.
//

import Foundation

struct ErrorMessage: Error {
  let id = UUID()
  var message: String
}

protocol ErrorMessageConvertible {
  var errorMessage: ErrorMessage { get }
}

extension ErrorMessageConvertible {
  var errorMessage: ErrorMessage {
    ErrorMessage(message: "Unknown error. Please try again.")
  }
}
