//
//  ContentView.swift
//  BetterRest
//
//  Created by Prarthana Das on 03/08/23.
//

import CoreML
import SwiftUI


struct ContentView: View {
    @State private var wakeUp = defaultWakeUpTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    var body: some View {
        NavigationView {
            Form {
//                VStack(alignment: .leading, spacing: 0){
//                    Text("When do you want to wake up?")
//                        .font(.headline)
//                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                        .labelsHidden()
//                }
//                VStack(alignment: .leading, spacing: 0){
//                    Text("Desired amount of sleep")
//                        .font(.headline)
//                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//                }
//                VStack(alignment: .leading, spacing: 0){
//                    Text("Daily coffee intake")
//                        .font(.headline)
//                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount.formatted()) cups", value: $coffeeAmount, in: 1...20)
//                }
                Section("When do you want to wake up?"){
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section("Desired amount of sleep"){
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
//                Section("Daily coffee intake") {
//                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount.formatted()) cups", value: $coffeeAmount, in: 1...20)
//                }
                
                Picker("Daily coffee intake", selection: $coffeeAmount){
                    ForEach(1..<21, id: \.self) {
                        Text("\($0) cups")
                    }
                }
                
                Section(header: Text("Your ideal bed time is...")) {
                    Text(calculateBedtime())
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                }
            }
            .navigationTitle("BetterRest")
//            .toolbar {
//                    Button("Calculate", action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showingAlert) {
//                Button("Okay") {}
//            } message: {
//                Text(alertMessage)
//            }
        }
    }
//    func calculateBedtime() -> String {
//        do {
//           let config = MLModelConfiguration()
//            let model = try SleepCalculator(configuration: config)
//
//            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
//            let hour = (components.hour ?? 0) * 60 * 60
//            let minute = (components.minute ?? 0) * 60
//
//
//                let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
//                let sleepTime = wakeUp - prediction.actualSleep
//
//                let formatter = DateFormatter()
//                formatter.timeStyle = .short
//
//                return formatter.string(from: sleepTime)
//            } catch {
//                return "Sorry, there was a problem calculating your bedtime."
//            }
//      }
    
    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hours = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hours + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            //alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            return sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
          //  alertMessage = "Sorry, there was a problem calculating your bedtime."
            return "Sorry, there was a problem calculating your bedtime."
        }
        //showingAlert = true
    }
     
}

//struct ContentView: View {
//
//    @State private var sleepingHours = 8.0
//    @State private var wakeUp = Date.now
//
////    let components = Calendar.current.dateComponents([.hour, .minute, .second], from: Date.now)
////    let hour = components.hour ?? 0
////    let minute = components.minute ?? 0
//
////    var dateComponents = DateComponents()
////    dateComponents.hour = 8
////    dateComponents.minute = 0
////    let date = Calendar.current.date(from: dateComponents) ?? Date.now
//
//    var body: some View {
//        VStack{
//            Text(Date.now, format: .dateTime.hour().minute())
//            Text(Date.now, format: .dateTime.day().month().year())
//            Text(Date.now.formatted(date: .long, time: .shortened))
//            VStack{
//                Stepper("Sleeping hours : \(sleepingHours.formatted())", value: $sleepingHours, in: 4...12, step: 0.25)
//            }
//            VStack{
//                DatePicker("Please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .hourAndMinute)
//
//            }
//            .labelsHidden()
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
