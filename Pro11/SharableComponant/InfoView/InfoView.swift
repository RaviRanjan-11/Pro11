//
//  InfoView.swift
//  Pro11
//
//  Created by Ravi Ranjan on 22/12/24.
//

import SwiftUI
import Lottie


struct InfoView: View {
    
    var title: String = "You have not joined any contest yet"
    var imageName: String = "cup"
    var subTitle : String = "Join contest to participate in upcoming Mathces"
    var actionButtonTitle: String = "Join Contest"
    @State private var isAnimating = false
    
    var callBack: () -> Void?
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding()
                .foregroundColor(.gray)
            
            Spacer()

            Image(imageName)
                .scaledToFit()
                .padding()
                .scaleEffect(isAnimating ? 1.0 : 0.8)
                .onAppear {
                    withAnimation(
                        Animation.easeInOut(duration: 0.9)
                            .repeatForever(autoreverses: true)
                    ) {
                        isAnimating.toggle()
                    }
                }
            Text(subTitle)
                .font(.headline)
                .padding()
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Button(action: {
                callBack()
            }) {
                Text(actionButtonTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
    }
}


#Preview {
    InfoView(callBack: {})
}

import Lottie


import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable {
    
    var animationFileName: String
    let loopMode: LottieLoopMode
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let lottieAnimationView = LottieAnimationView(name: animationFileName)
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.play()
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lottieAnimationView)
        NSLayoutConstraint.activate([
            lottieAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            lottieAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        return view
    }
}

struct NoMatchView: View {
    
    var title: String = "No Upcoming Matches"
    var body: some View {
        ZStack {
            LottieView(animationFileName: "NoMatch", loopMode: .loop)
                .frame(width: 300, height: 400)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.red)
                
        }
    }
}

#Preview {
    NoMatchView()
}
