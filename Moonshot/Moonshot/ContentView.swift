//
//  ContentView.swift
//  Moonshot
//
//  Created by Prarthana Das on 21/08/23.
//

import SwiftUI


/**Resizing images to fit the screen using GeometryReader**/
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
