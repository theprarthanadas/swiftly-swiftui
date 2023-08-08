//
//  ContentView.swift
//  WeSplit
//Users/prarthanadas/Documents/Miscellaneous/Hacking-With-SwiftUI/WeSplit/WeSplit/ContentView.swift/
//  Created by Prarthana Das on 28/07/23.
//

import SwiftUI

struct ContentView: View {
    
   @State private var checkAmount = 0.0
   @State private var numberOfPeople = 2
   @State private var tipPercentage = 20
    
    let tipPercentages = [10,15,20,25,0]
    
    @FocusState private var amountIsFocused: Bool
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelected = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelected
        let grandTotal = tipValue + checkAmount
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal : Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelected = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelected
        let grandTotal = tipValue + checkAmount
        
        return grandTotal
    }
    
    var currencyCode: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    //TextField("Amount:", text: $checkAmount)
                    TextField("Amount to split", value: $checkAmount, format: currencyCode)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section{
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent)
                                
                        }
                    }
                    //.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                Section{
                    Text(totalPerPerson, format: currencyCode)
                } header: {
                    Text("Amount per person")
                }
                Section{
                    Text(grandTotal, format: currencyCode)
                        .foregroundColor(tipPercentage == 0 ? .red : .none)
                } header: {
                    Text("Grand Total")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

//struct ContentView: View {
//
//    let students = ["Harry", "Hermione", "Ron"]
//
//    @State private var selectedStudent = "Harry"
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Picker("Select your student", selection: $selectedStudent) {
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//            }
//        }
//    }
//}


//struct ContentView: View {
//
//    var body: some View {
//        Form {
//            ForEach(1..<101) {
//                Text("Row\($0)")
//            }
//        }
//    }
//
//}

//struct ContentView: View {
//    @State private var name = ""
//
//    var body: some View {
//        Form{
//            TextField("Enter your name", text: $name)
//            Text("Hello, \(name)")
//        }
//    }
//}

//struct ContentView: View {
//    @State private var tapCount = 0
//    var body: some View {
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
