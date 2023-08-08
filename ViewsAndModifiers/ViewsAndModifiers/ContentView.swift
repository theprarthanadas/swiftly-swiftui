//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Prarthana Das on 03/08/23.
//

import SwiftUI
/**view modifier challenge**/

struct BLT : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func blted() -> some View {
        modifier(BLT())
    }
}

struct ContentView : View {
    var body: some View {
        Text("example")
            .blted()
    }
}


/**CUSTOM CONTAINERS**/
/*
struct GridStack<PD : View> : View {
    let rows : Int
    let columns : Int
   @ViewBuilder let content : (Int, Int) -> PD
    
    var body: some View {
        VStack{
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0...columns-1, id: \.self) { col in
                        content(row, col)
                    }
                }
                
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
//        GridStack(rows: 4, cols: 4) { row, col in
//            Text("R\(row) C\(col)")
//        }
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).square")
                Text("R\(row) C\(col)")
            }
        }
    }
}

*/
/* CUSTOM MODIFIERS


struct WaterMark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing){
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .background(.black)
                .padding(15)

        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}

struct ContentView: View{
    var body: some View{
        Color.brown
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .watermarked(with: "YOLO")
            .ignoresSafeArea()
    }
}

struct DasTitle: ViewModifier {
   
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

//extension View {
//    func titleStyle() -> some View {
//        modifier(DasTitle())
//    }
//}
//struct ContentView: View {
//    var body: some View {
//        VStack{
//            Text("Tell me why?")
//                //.modifier(DasTitle())
//                .titleStyle()
//        }
//    }
//}
 */

/*   VIEW COMPOSITION
struct CapsuleView: View {
    var content: String
    
    var body: some View {
        Text(content)
            .font(.title)
            .frame(width: 150, height: 100)
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    
    var body: some View {
        VStack{
            CapsuleView(content: "First")
            CapsuleView(content: "Second")
        }
    }
}

*/
    
//    var motto1: some View {
//        Text("Draco dormiens")
//    }
//    let motto2 = Text("nunquam titillandus")
//    @ViewBuilder var spells: some View {
//        Text("Lumos")
//        Text("Obliviate")
//    }
//    var body: some View {
//        VStack{
//            Spacer()
//            HStack{
//                motto1
//                motto2
//            }.padding()
//            VStack{
//                Text("Spells:")
//                    .padding()
//                spells
//            }
//            Spacer()
//        }
//    }
//    @State private var useRedText = false
/*struct ContentView: View{
    var body: some View{
        VStack{
            VStack {
                Text("Gryffindor")
                    .foregroundColor(.red)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .foregroundColor(.cyan)
        }
        VStack{
            VStack {
                Text("Gryffindor")
                    .blur(radius: 1)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .blur(radius: 9)

            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
        }
    }
}
    */
//    var body: some View{
//        if useRedText{
//            Button("Hello World!"){
//                useRedText.toggle()
//            }
//            .foregroundColor(.red)
//        } else {
//            Button("Hello World!"){
//                useRedText.toggle()
//            }
//            .foregroundColor(.blue)
//        }
//    }
//    var body: some View{
//        Button("Hello World"){
//            useRedText.toggle()
//        }
//        .foregroundColor(useRedText ? .red : .blue)
//    }
//    var body: some View {
//        VStack{
//            Text("Hello World")
//            Button("Hello, world!") {
//                print("button tapped")
//            }
//        }
//    }
    
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//            .background(.red)
//            .padding()
//            .background(.blue)
//            .padding()
//            .background(.green)
//            .padding()
//            .background(.yellow)
//        VStack {
//            Button("Hello, world!") {
//                print(type(of: self.body))
//            }
//            .frame(width: 200, height: 200)
//            .background(.red)
//            Text("Hello, world!")
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(.red)
//        }
 //       .padding()
  //  }
 //   } //end of content view


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
