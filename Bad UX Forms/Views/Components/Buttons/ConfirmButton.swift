//
//  ConfirmButton.swift
//  Bad UX Forms
//
//  Created by Ian on 29/5/24.
//

import SwiftUI

struct ConfirmButton: View {
    let number: String
    
    @State private var isPhoneConfirmedAlertPresented = false
    
    var body: some View {
        BaseButton(title: "Подтвердить") {
            isPhoneConfirmedAlertPresented = true
        }
        .alert("", isPresented: $isPhoneConfirmedAlertPresented) {
            Button("OK") { }
        } message: {
            Text("Номер, который вы ввели:\n\(number)")
        }
    }
    
}

#Preview {
    ConfirmButton(number: "+7 999 999 999")
}
