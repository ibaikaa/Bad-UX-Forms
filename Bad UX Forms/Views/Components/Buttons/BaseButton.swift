//
//  BaseButton.swift
//  Bad UX Forms
//
//  Created by Ian on 29/5/24.
//

import SwiftUI

struct BaseButton: View {
    
    let title: String 
    let action: () -> Void
    
    var body: some View {
        Button(title) {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            action()
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    BaseButton(title: "Подтвердить") { }
}
