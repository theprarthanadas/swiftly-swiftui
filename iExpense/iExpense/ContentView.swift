//
//  ContentView.swift
//  iExpense
//
//  Created by Prarthana Das on 17/08/23.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpenses = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items) {item in
                    HStack{
                        VStack(alignment: .leading){
                        Text(item.name)
                                .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundColor(item.amount > 10 ? (item.amount > 1000 ? .red : .green) : .blue)
                }
                }
                .onDelete(perform: removeItems(at:))
           }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                    showingAddExpenses = true
                } label: {
                    Image(systemName: "plus")
                }
                if(expenses.items.count > 0){
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddExpenses){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}


/**USING CODABLE TO ARCHIVE OBJECTS IN USERDEFAULTS AND RETRIEVING FROM THE SAME USING JSONENCODER AND JSONDECODER

struct User: Codable {
    var firstName : String
    var lastName : String
}

struct GetUser: View {
    
    var fName : String {
        let decoder = JSONDecoder()
        
        if let userData = try? decoder.decode(User.self, from: UserDefaults.standard.object(forKey: "userData") as! Data){
            return userData.firstName
        }else {
            return "could not save"
        }
    }
    
    var body: some View{
      Text(fName)
    }
}

struct ContentView: View {
    
    @State private var user = User(firstName: "Prarthana", lastName: "Das")
    @State private var presentData = false
    
    
    var body: some View {
        Button("Save User"){
            presentData.toggle()
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user){
                UserDefaults.standard.set(data, forKey: "userData")
            }

        }
        .sheet(isPresented: $presentData){
            GetUser()
        }
    }
}
 
 **/

/**Storing user settings with UserDefaults

struct ContentView: View {
   // @State private var tapCount = UserDefaults.standard.integer(forKey:"Tap")
    
    @AppStorage("Tap") private var tapCount = 0
    
    var body: some View {
        Button("Tap Count :\(tapCount)"){
            tapCount += 1
          //  UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}
**/
    
/**Deleting items using onDelete()

struct ContentView: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}
 **/
 
 
/**HIDING AND SHOWING VIEWS

struct SecondView: View {
    
    let name: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            Text("Hello, \(name)")
        Button("Dismiss"){
            dismiss()
        }
    }
}

struct ContentView: View {
    @State private var isShowing = false
    
    var body: some View {
        Button("Some Button"){
            isShowing.toggle()
        }
        .sheet(isPresented: $isShowing){
        
                SecondView(name: "Prarthana")
        }
    }
}
 **/



/**
 Published says that the values are going to change to views subscribing to them
 
 StateObject to objects when created meaning they'll be looking out for value change for class abiding by ObservableObject
 
 
 

class User: ObservableObject {
    @Published var firstName = "Taylor"
    @Published var lastName = "Swift"
}

struct ContentView: View {
    
    @StateObject private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
        }
        .padding()
    }
}
 **/



/**
 Class and @State do not work together
 

class User {
    var firstName = "Taylor"
    var lastName = "Swift"
}

struct ContentView: View {
    
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
        }
        .padding()
    }
}
 **/
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
