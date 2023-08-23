//
//  ContentView.swift
//  Moonshot
//
//  Created by Prarthana Das on 21/08/23.
//

import SwiftUI


struct ContentView: View {
    
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions) { mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack{
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100, height: 100)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.callout)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}



/**How to lay out views in a scrolling grid**


struct ContentView: View {
    var body: some View{
        //let layout = [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))]
        let adaptiveLayot = [GridItem(.adaptive(minimum: 80,maximum: 120))]
        //vertical grid
        ScrollView{
            LazyVGrid(columns: adaptiveLayot){
                ForEach(1..<1001) {
                    Text("Item \($0)")
                }
            }
        }
        //horizontal grid
        ScrollView(.horizontal){
            LazyHGrid(rows: adaptiveLayot){
                ForEach(1..<1001) {
                    Text("Item \($0)")
                }
            }
        }
        
    }
}
*/

/**Working with hierarchical Codable data**


struct User: Codable{
    var name: String
    var address: Address
}

struct Address: Codable{
    var street: String
    var city: String
}



struct ContentView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let dataExtracted = try? decoder.decode(User.self, from: data){
                print(dataExtracted.name)
            }
        }
    }
}

*/

/**Pushing new views onto the stack using NavigationLink**
struct ContentView: View {
    var body: some View{
        NavigationView{
            List(1..<101) { row in
                NavigationLink{
                    Text("Row \(row) in detail")
                } label: {
                    Text("Row \(row) ")
                        .padding()
                }
                .navigationTitle("SwiftUI")
            }
        }
    }
}
*/
    
    
/**How ScrollView lets us work with scrolling data


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

 **/

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
