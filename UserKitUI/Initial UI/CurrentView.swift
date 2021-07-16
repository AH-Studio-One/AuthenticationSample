//
//  CurrentView.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-16.
//

import Foundation
import SwiftUI

/// This view is presented once the app is finished launching and is running.
struct CurrentView : View {
    let userState: UserState
    @ObservedObject var myApp: MyApp
  
    var body: some View {
        VStack(content: content)
    }
    
    func content() -> AnyView {
        switch userState {
        case .unauthenticated:
            return AnyView(WelcomeView(myApp: myApp))
        case .authenticated(let userSession):
            return AnyView(LandingView(userSession: userSession))
        }
    }
}

#if DEBUG
struct RunningView_Previews : PreviewProvider {
  static var previews: some View {
    CurrentView(userState: .unauthenticated(.idle), myApp: MyApp())
  }
}
#endif
