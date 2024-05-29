//
//  InputBlock.swift
//  Bad UX Forms
//
//  Created by Ian on 29/5/24.
//

import SwiftUI

struct InputBlock<Input: View>: View {
    
    @ViewBuilder private let input: Input
    
    init(@ViewBuilder input: @escaping () -> Input) {
        self.input = input()
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Divider()
            
            input
                .padding()
            
            Divider()
        }
        .padding(.vertical, 20)
    }
}

#Preview {
    InputBlock {
        PhoneNumberPickerView()
    }
}
