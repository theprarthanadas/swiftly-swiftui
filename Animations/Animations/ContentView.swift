//
//  ContentView.swift
//  Animations
//
//  Created by Prarthana Das on 09/08/23.
//

import SwiftUI

struct ContentView: View {
    
    //building custom transitions using ViewModifier
    /*
    //showing and hiding views with transitions
    @State private var isShowingRed = false
    
    
    var body: some View{
        VStack{
            Button("Tap me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
            
        }
    }
     */
    /* ANIMATING GESTURES
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing:0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(7)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 5), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged {dragAmount = $0.translation}
                .onEnded{_ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
    */
   
    /*
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation}
                    .onEnded {_ in
                        withAnimation(.spring()){// explicit on release
                            dragAmount = .zero
                        }
                       }
            )
         //   .animation(.spring(), value: dragAmount) //implicit
    }
    */
    /*
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            // do nothing
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundColor(.white)
        .animation(nil, value: enabled)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 40, damping: 5), value: enabled)
    }
    */
    /*
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
           withAnimation(.interpolatingSpring(stiffness: 50, damping: 3)){
                animationAmount += 360
           }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Rectangle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x:0, y:1, z:0))
    }
    */
    
    
    /*
    var body: some View {
        print(animationAmount)
        
        return VStack{
            Stepper("Scale amount", value: $animationAmount.animation(.easeInOut(duration: 1).repeatCount(3,autoreverses: true)), in: 1...10)
            Spacer()
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
    */
    /*
    
    var body: some View {
        Button("Tap Me") {
           // animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
       //.animation(.easeOut, value: animationAmount)
        //.animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
       // .animation(.easeIn(duration: 2), value: animationAmount)
//           .animation(.easeIn(duration: 2)
//            .delay(1),
//                   value: animationAmount)
//        .animation(.easeIn(duration: 3) .repeatCount(3, autoreverses: true), value: animationAmount)
        .overlay(Circle()
            .stroke(.red)
            .scaleEffect(animationAmount)
            .opacity(2 - animationAmount)
            .animation(.easeInOut(duration: 1) .repeatForever(autoreverses: false), value: animationAmount)
        )
        .onAppear{
            animationAmount = 2
        }
        
    }
    
    */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
