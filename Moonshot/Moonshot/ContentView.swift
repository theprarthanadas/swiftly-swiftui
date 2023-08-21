//
//  ContentView.swift
//  Moonshot
//
//  Created by Prarthana Das on 21/08/23.
//

import SwiftUI
/**How ScrollView lets us work with scrolling data**/


struct CustomText: View {
    let text: String
    
    var body: some View{
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}
struct ContentView: View {
    var body: some View {
        //Horizontal scrolling
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10){
                ForEach(0..<100){
                    CustomText("Item\($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
        
        //Vertical scrolling
//        ScrollView {
//            LazyVStack(spacing: 10){
//                ForEach(0..<100){
//                    CustomText("Item\($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
    }
}


/**Resizing images to fit the screen using GeometryReader
struct ContentView: View {
    var body: some View {
        GeometryReader{geo in
            Image("22939")
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}
**/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}