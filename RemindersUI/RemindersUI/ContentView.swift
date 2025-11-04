//
//  ContentView.swift
//  RemindersUI
//
//  Created by 刘芮彤 on 2025/10/19.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State private var page: RemindersPage = RemindersPage(
        title: "Todo List",
        items:[Reminder(title: "MUSC121 Writing assignment"), Reminder(title: "COMP301 A07"), Reminder(title: "GEOG121 reflection")],
        color: .yellow)
    @State private var newReminderTitle: String = ""
    
    var body: some View {
        VStack {
            // TODO: Add header view
            HStack{
                Text(page.title)
                    .font(.largeTitle)
                    .foregroundStyle(page.color)
                    .bold()
                Spacer()
                Button{
                    isEditing=true
                } label: {
                    Image(systemName: "info.circle")
                        .foregroundStyle(page.color)
                        .font(.title)
                }
            }
            .padding()
            List {
                // TODO: Loop through the page's reminders using ForEach
                ForEach($page.items) { $reminder in
                    // TODO: Display each reminder row
                    HStack{
                        Button{
                            reminder.isCompleted.toggle()
                        }label: {
                            if reminder.isCompleted {
                                Image(systemName: "circle.fill")
                            } else {
                                Image(systemName: "circle")
                            }
                        }
                        .foregroundStyle(page.color)
                        .font(.title)
                        Text(reminder.title)
                            .foregroundStyle(reminder.isCompleted ? .gray : .primary)
                    }
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            // TODO: Add footer view
            HStack{
                Spacer()
                TextField("New reminder...", text: $newReminderTitle)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(page.color, lineWidth:2)
                    )
                Button {
                    page.items.append(Reminder(title: newReminderTitle))
                } label: {
                    Image(systemName: "plus.circle.fill").foregroundStyle(page.color)
                        .font(.largeTitle)
                }
                Spacer()
            }
            Spacer()
        }
        
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
            EditSheet(selectedColor: $page.color, title: $page.title)
        }
    }
}

#Preview {
    ContentView()
}
