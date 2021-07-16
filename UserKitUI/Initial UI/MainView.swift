//
//  MainView.swift
//  AuthenticationSample
//
//  Created by A H on 2021-07-16.
//

import SwiftUI
/// The app's root view.
struct MainView : View {
  /// This is the app's state store that is threaded down the view hierachy. It's a kind of Redux-like usage of SwiftUI. Anytime any state in `Koober` changes, this view and the entire view hierarchy is recomputed to reflect changes. This is supposed to be cheap because only the views that change are re-rendered.
  @ObservedObject var myApp: MyApp
  
  var body: some View {
    VStack(content: contentView)
  }
  
  func contentView() -> AnyView {
    switch myApp.appState {
    case .launching:
      return AnyView(LaunchingView())
    case .running(let userState):
      return AnyView(CurrentView(userState: userState, myApp: myApp))
    }
  }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
  static var previews: some View {
    MainView(myApp: MyApp())
  }
}
#endif
