//
//  EditSheet.swift
//  RemindersUI
//
//  Created by 刘芮彤 on 2025/11/3.
//

import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var selectedColor: Color
    @Binding var title: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
                // TODO: Add list.bullet.circle.fill icon and TextField
            HStack{
                Image(systemName: "list.bullet.circle.fill")
                TextField("Title", text: $title)
            }
            .font(.largeTitle)
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
            
            Button(){
                dismiss()
            } label: {
                Text("Done")
                    .font(.title)
            }
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
    @Previewable @State var selectedColor: Color = .red
    @Previewable @State var title: String = "List Info"
    
    EditSheet(selectedColor: $selectedColor, title: $title)
        .preferredColorScheme(.light)
}
