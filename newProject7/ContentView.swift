//
//  ContentView.swift
//  newProject7
//
//  Created by Адам Дотмерзаев on 17.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showAnimate = false

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Button {
                    withAnimation(.spring) {
                        showAnimate.toggle()
                    }
                } label: {
                    RoundedRectangle(cornerRadius: showAnimate ? 20 : 15)
                        .fill(Color.blue)
                        .frame(width: showAnimate ? 350 : 100,
                               height: showAnimate ? 450 : 60)
                }
                .allowsHitTesting(!showAnimate)
                .position(buttonPosition(proxy: proxy))

                Button {
                    withAnimation(.spring) {
                        showAnimate.toggle()
                    }
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "arrowshape.backward.fill")
                            .foregroundColor(.white)
                            .opacity(showAnimate ? 1 : 0)
                            .scaleEffect(showAnimate ? 1 : 0.01)
                            

                        Text(showAnimate ? "Back" : "Open")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(width: showAnimate ? 350 : nil, alignment: .leading)
                    }
                }
                .allowsHitTesting(showAnimate)
                .position(textButton(proxy: proxy))
            }
        }
    }

    private func buttonPosition(proxy: GeometryProxy) -> CGPoint {
        showAnimate
            ? CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2)
            : CGPoint(x: proxy.size.width - 66, y: proxy.size.height - 50)
    }

    private func textButton(proxy: GeometryProxy) -> CGPoint {
        showAnimate
            ? CGPoint(x: proxy.size.width / 2 + 32, y: proxy.size.height / 2 - 190)
            : CGPoint(x: proxy.size.width - 82, y: proxy.size.height - 50)
    }
}

#Preview {
    ContentView()
}
