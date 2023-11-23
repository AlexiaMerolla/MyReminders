//
//  DetailsView.swift
//  MyReminders
//
//  Created by Alexia Merolla on 22/11/23.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment (\.dismiss) var dismiss
    
    @State private var showTagsView = false
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State var Title: String = ""
    @State var Notes: String = ""
    @State var URL: String = ""
    @State var Cont: Int = 0

    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Title", text: $Title)
                    TextField("Notes", text: $Notes)
                    TextField("URL", text: $URL)
                    
                    
                }
                Section{
                    VStack {
                        HStack {
                            Image(systemName: "calendar")
                            Text("Date")
                            Spacer()
                            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                                
                                
                            }
                        }
                        DatePicker(
                            "Select Date",
                            selection: $selectedDate,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.compact) // Style can be compact, wheel, etc.
                        // Additional UI elements...
                    }
                   
                    VStack{
                        HStack {
                            Image(systemName: "clock")
                            Text("Time")
                            Spacer()
                            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                            }
                        }
                                DatePicker(
                                    "Select Time",
                                    selection: $selectedTime,
                                    displayedComponents: [.hourAndMinute]
                                )
                                .datePickerStyle(.wheel)
                            }
                        }
                                    
               
                Section{
                   
                        HStack {
                        Image(systemName: "number")
                        Text("Tags")
                        Spacer()
                        Image(systemName: "chevron.right")
                            
                    }
                }
                
                Section{
                    HStack {
                        Image(systemName: "location.fill")
                        Text("Location")
                        Spacer()
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                            
                        }
                        
                    }
                }
               
                Section{
                    HStack {
                        Image(systemName: "message.fill")
                        Text("When Messaging")
                        Spacer()
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                            
                        }
                        
                    }
                }
              
                Section{
                    HStack {
                        Image(systemName: "flag.fill")
                        Text("Flag")
                        Spacer()
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                            
                        }
                        
                    }
                }
               
                Section{
                    HStack {
                        Image(systemName: "")
                        
                        
                        Picker(selection: $Cont, label: Text("Priority")) {
                            Text("None").tag(0)
                            Text("Low").tag(1)
                            Text("Medium").tag(2)
                            Text("High").tag(3)
                        }
                        
                    }
                    HStack {
                        Image(systemName: "")
                        Text("List")
                        Spacer()
                        Image(systemName: "chevron.right")
                        
                    }
                }
               
                Section{
                    HStack {
                        Image(systemName: "")
                        Text("Subtasks")
                        Spacer()
                        Image(systemName: "chevron.right")
                        
                    }
                }
                
                Section{
                    Button{
                        
                    }label: {
                        Text("Add Image")
                    }
                }
            }.navigationTitle("Details")
                .toolbar{
                    ToolbarItem{
                        Button{
                            dismiss()
                        }label: {
                            Text ("Done")
                        }
                    }
                }
        }
    }
}

#Preview {
    DetailsView()
}
