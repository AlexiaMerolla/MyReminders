//
//  ContentView.swift
//  MyReminders
//
//  Created by Alexia Merolla on 15/11/23.
//

import SwiftUI

struct Reminder: Identifiable {
    let id = UUID()
    let text: String
    let description : String
    var isSelected = false
    
}

struct ContentView: View {
    @State var reminders: [Reminder] = []

    @State var showNewReminderFields = false // Track visibility of new reminder fields
    @State var newReminderTitle: String = "" // Track text for new reminder title
    @State var newReminderNote: String = "" // Track text for new reminder note
    @State var isNoteFieldEmpty = true //Track whether the note field is empty
    @State var showDetails: Bool = false
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(.orange))]
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
//                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(reminders.indices, id: \.self) { index in
                            HStack {
                                Image(systemName: reminders[index].isSelected ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(.orange)
                                    .onTapGesture {
                                        reminders[index].isSelected.toggle()
                                    }
                                VStack{
                                    Text(reminders[index].text)
                                        .font(.title2)
                                    Text(reminders[index].description)
                                        .font(.caption)
                                        .foregroundColor( .gray)
                                }
                                    .contextMenu {
                                        Button("Edit") {
                                            // Implement edit functionality here
                                        }
                                        Button("Delete") {
                                            reminders.remove(at: index)
                                        }
                                    }
                                Spacer()
                                Image(systemName: "info.circle")
                                    .onTapGesture {
                                        showDetails.toggle()
                                    }
                             
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button() {
                                    print("this element is being, deleted.")
                                    reminders.remove(at: index)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            
                        }
                       

                        
                        if showNewReminderFields {
                            TextField("Enter title", text: $newReminderTitle)
                            // .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            
                            TextField("Add note", text: $newReminderNote)
                            //  .textFieldStyle(RoundedBorderTextFieldStyle())
                                .font(.caption)
                                .foregroundColor( .gray)
                                .padding(.horizontal)
                        }
                            
                        
                        Spacer() // Pushes the "New Reminder" button to the bottom
                        
                        
                    .listStyle(.grouped)
                    .navigationTitle("Reminders")
                    .navigationBarItems(
                        trailing:
                            Button(action: {
                                if !newReminderTitle.isEmpty {
                                    let newReminder = Reminder(text: newReminderTitle, description:newReminderNote )
                                    reminders.insert(newReminder, at: 0) // Add new reminder at the beginning
                                    newReminderTitle = "" // Reset title field after adding reminder
                                    newReminderNote = "" // Reset note field after adding reminder
                                    showNewReminderFields = false // Hide the fields after adding a reminder
                                }
                            }) {
                                Text("Done")
                            }
                    )
                    .background(Color.clear)
                    
                }.scrollContentBackground(.hidden)
                                    .padding(.bottom) // Provide bottom padding to make space for the "New Reminder" button


                Button(action: {
                    showNewReminderFields.toggle() // Toggle visibility of the text fields
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color.orange)
                            .font(.title)
                        Text("New Reminder")
                            .foregroundColor(Color.orange)
                    }
                    .padding()
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $showDetails, content: {
            DetailsView()
        })
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
