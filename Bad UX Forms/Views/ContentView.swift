//
//  ContentView.swift
//  Bad UX Forms
//
//  Created by Ian on 29/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeaderView()
                
                InputBlock {
                    PhoneNumberPickerView()
                }
                
                InputBlock {
                    PhoneNumberStepperView()
                }
                
                InputBlock {
                    Text("Random Input TODO")
                }
                
                FooterView()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
