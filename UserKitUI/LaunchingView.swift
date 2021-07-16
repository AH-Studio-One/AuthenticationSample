//
//  LaunchingView.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-15.
//

import SwiftUI

struct LaunchingView : View {
  var body: some View {
    FullscreenView(backgroundColor: Color("BackgroundColor")) {
      Image("logo")
        .background(Color("BackgroundColor"))
        .padding()
      HStack {
        Text("Launching...")
          .font(.headline)
          .foregroundColor(.black)
          .padding()
      }
      .background(Color.clear)
    }
    .background(Color.clear)
  }
}

#if DEBUG
struct LaunchingView_Previews : PreviewProvider {
  static var previews: some View {
    Group {
        LaunchingView()
        LaunchingView()
    }
  }
}
#endif


