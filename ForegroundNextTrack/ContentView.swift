//
//  ContentView.swift
//  ForegroundNextTrack
//
//  Created by Irina Deeva on 10/12/24.
//

import SwiftUI

struct NextTrackButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(width: 100)
      .padding()
      .scaleEffect(configuration.isPressed ? 0.86 : 1.0)
      .animation(
        .easeInOut(duration: 0.22),
        value: configuration.isPressed
      )
      .background(Color.blue.opacity(configuration.isPressed ? 0.3 : 0))
      .clipShape(
        Circle()
      )

  }
}

struct ContentView: View {
  @State var isNextTrack: Bool = false

  var body: some View {
    Button {
      withAnimation(.interpolatingSpring(stiffness: 100, damping: 15)) {
        isNextTrack.toggle()
      } completion: {
        isNextTrack.toggle()
      }
    } label: {
      GeometryReader { proxy in
        let size = proxy.size.width / 2

        HStack(spacing: -1) {
          buttonImage
            .frame(width: isNextTrack ? size : 0)
            .opacity(isNextTrack ? 1 : 0)

          buttonImage
            .frame(width: size)

          buttonImage
            .frame(width: isNextTrack ? 1 : size)
            .opacity(isNextTrack ? 0 : 1)
        }
        .frame(maxHeight: .infinity, alignment: .center)
      }
    }
    .buttonStyle(NextTrackButtonStyle())
  }

  var buttonImage: some View {
    Image(systemName: "play.fill")
      .resizable()
      .scaledToFit()
  }
}

#Preview {
  ContentView()
}
