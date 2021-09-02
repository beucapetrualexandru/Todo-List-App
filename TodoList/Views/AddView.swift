//
//  AddView.swift
//  TodoList
//
//  Created by Beuca Alexandru on 19.08.2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var  showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack{
            TextField("Type something here", text: $textFieldText)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                Button(action: {
                    saveButtonpressed()
                  
                }, label: {
                    Text("save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
        }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖌")
        .alert(isPresented: $showAlert, content: {
            getAlert()
            
        })
    }
    
    func saveButtonpressed() {
        if TextIsAproppiate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
       
    }
    
    func TextIsAproppiate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Text must be at least 3 characters long 🤯"
            showAlert.toggle()
            return false
        }
        return true
        
    }
    
    func getAlert() -> Alert
    {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
    }
}
