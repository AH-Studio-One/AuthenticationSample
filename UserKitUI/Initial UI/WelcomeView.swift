//
//  WelcomeView.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-15.
//

import SwiftUI

/// This view welcomes the user and asks the user to either sign in or sign up.
struct WelcomeView : View {
  @ObservedObject var myApp: MyApp
  
  var body: some View {
    VStack {
      Spacer()
      WelcomeContentView(myApp: myApp)
      Spacer()
    }
    .background(Color("BackgroundColor"))
    .edgesIgnoringSafeArea(.bottom)
    .navigationBarTitle(Text("Welcome"))
  }
}

#if DEBUG
struct WelcomeView_Previews : PreviewProvider {
  static var previews: some View {
    WelcomeView(myApp: MyApp())
  }
}
#endif

/// App logo, sign in and sign up buttons.
private struct WelcomeContentView : View {
  @ObservedObject var myApp: MyApp
  
  var body: some View {
    VStack {
      Image("logo").background(Color("BackgroundColor"))
      SignInSignUpButtons(myApp: myApp)
    }
    .background(Color("BackgroundColor"))
    .padding()
  }
}

private struct SignInSignUpButtons : View {
  @ObservedObject var myApp: MyApp
  
  var body: some View {
    HStack {
      NavigationLink(destination: SignInView(viewModel: SignInViewModel(startSignInUseCase: myApp.startSignInUseCase))) {
        Text("Sign In")
      }
      .accentColor(.white)
      .padding()
      
      Spacer()
      
      NavigationLink(destination: SignUpView()) {
        Text("Sign Up")
      }
      .accentColor(.white)
      .padding()
    }
  }
}
