//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Prarthana Das on 30/07/23.
//

import SwiftUI


struct FlagImage : View {
    var countryName : String
    
    var body: some View {
        Image(countryName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    
   @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctanswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionCount = 1
    @State private var questionsDone = false
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3), .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctanswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) {number in
                        Button {
                                flagTapped(number)
                        }label: {
//                            Image(countries[number])
//                                .renderingMode(.original)
//                                .clipShape(Capsule())
//                                .shadow(radius: 5)
                            FlagImage(countryName: countries[number])
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert(scoreTitle, isPresented: $questionsDone){
            Button("Restart", action: restartGame)
        }message: {
            Text("Your final score is \(score)")
        }

        
    }
    
    func flagTapped(_ number: Int) {
            if number == correctanswer {
                scoreTitle = "Correct"
                score = score + 1
            } else {
                scoreTitle = "Wrong! That’s the flag of \(countries[number])"
                score = score - 1
            }
        if(questionCount == 8){
            questionsDone = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        questionCount = questionCount + 1
        countries.shuffle()
        correctanswer = Int.random(in: 0...2)
        print(questionCount)
    }
    
    func restartGame() {
        score = 0
        questionCount = 0
        askQuestion()
    }
    
//    var body: some View {
//        Button("Show Alert") {
//            showingAlert = true
//        }
//        .alert("Important message", isPresented: $showingAlert){
//            Button("Cancel", role: .cancel) {
//                print("Alert dismissed - cancel clicked")
//            }
//            Button("Delete", role: .destructive) {
//                print("Alert dismissed - delete clicked")
//            }
//        } message: {
//            Text("Please read this!")
//        }
//    }
        
//        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        //RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
        
        //     LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
      //  LinearGradient(stops: [Gradient.Stop(color: .white, location: 0.45), Gradient.Stop(color: .black, location: 0.55)], startPoint: .top, endPoint: .bottom)
//        ZStack{
//            VStack(spacing:0){
//                Color.red
//                Color.blue
//            }
//            Text("Prarthana Das")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



