//
//  LandingView.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-16.
//

import SwiftUI

/// This view is presented if a user is signed in and ready to start a new ride.
struct LandingView : View {
  let userSession: UserSession
  
  var body: some View {
    ZStack(alignment: .top) {
      MapView()
      HStack(alignment: .bottom) {
        Spacer()
        Image(systemName: "person")
          .font(.title)
          .padding(.all)
      }
      StartButton(action: goToDropoffLocationSelectionScreen)
        .padding(.top, 60)
    }
  }
  
  func goToDropoffLocationSelectionScreen() {
    // TODO: Navigate to dropoff location selection.
  }
}

struct StartButton: View {
  let action: () -> Void
  
  var body: some View {
    Button(action: action) {
      Text("Start")
        .foregroundColor(.black)
        .padding(EdgeInsets(top: 15, leading: 80, bottom: 15, trailing: 80))
        .background(Color.white)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
  }
}

struct MapView: View {
  var body: some View {
    Color("BackgroundColor")
  }
}

#if DEBUG
struct NewRideView_Previews : PreviewProvider {
  static var previews: some View {
    LandingView(userSession: UserSession.fake)
  }
}
#endif
