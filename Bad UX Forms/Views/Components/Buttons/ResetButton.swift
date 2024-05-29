//
//  ResetButton.swift
//  Bad UX Forms
//
//  Created by Ian on 29/5/24.
//

import SwiftUI

struct ResetButton: View {
    let action: () -> Void
    
    var body: some View {
        BaseButton(title: "Сбросить", action: action)
    }
}

#Preview {
    ResetButton { }
}
