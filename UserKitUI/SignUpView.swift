//
//  SignUpView.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-15.
//

import SwiftUI

struct SignUpView : View {
  var body: some View {
    VStack {
      Spacer()
      HStack {
        Spacer()
        Text("Sign Up, under construction...")
        Spacer()
      }
      Spacer()
    }
    .padding()
    .background(Color("BackgroundColor"))
    .edgesIgnoringSafeArea(.bottom)
    .navigationBarTitle(Text("Sign Up"))
  }
}

#if DEBUG
struct SignUpView_Previews : PreviewProvider {
  static var previews: some View {
    NavigationView {
      SignUpView()
    }
  }
}
#endif
