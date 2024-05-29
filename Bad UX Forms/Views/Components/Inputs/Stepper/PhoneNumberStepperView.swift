//
//  PhoneNumberStepperView.swift
//  Bad UX Forms
//
//  Created by Ian on 29/5/24.
//

import SwiftUI

struct PhoneNumberStepperView: View {
    private let mask = "+* (***) *** ****"

    @State private var number = 0
    @State private var maskedNumber = ""
    
    private var nonMaskedNumberString: String {
        String(
            maskedNumber
                .filter { $0.isNumber }
                .dropLast(String(number).count)
        )
    }
    
    private var isMaxValueReached: Bool {
        nonMaskedNumberString.count == 0 &&
        String(number).allSatisfy({ $0 == "9" })
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                BaseButton(title: "-") {
                    number -= 1
                }
                .disabled(number == 0)
                
                Text(maskedNumber)
                    .monospacedDigit()
                    .padding()
                    .animation(.default, value: maskedNumber)
                
                BaseButton(title: "+") {
                    number += 1
                }
                .disabled(isMaxValueReached)
            }
            
            HStack {
                ResetButton { number = 0 }
                
                ConfirmButton(number: maskedNumber)
            }
        }
        .onChange(of: number, perform: updateMaskedNumber)
        .onAppear {
            updateMaskedNumber(with: number)
        }
        .padding(.horizontal)
    }
    
    private func updateMaskedNumber(with newValue: Int) {
        guard number != 0 else {
            maskedNumber = applyMask(to: String(repeating: "0", count: mask.count))
            return
        }
        
        let numbersOnlyFullString = nonMaskedNumberString + String(newValue)
        maskedNumber = applyMask(to: String(numbersOnlyFullString))
    }
    
    private func applyMask(to input: String) -> String {
        let placeholder = Character("*")
        var result = ""
        var inputIndex = input.startIndex
        
        for maskCharacter in mask {
            if maskCharacter == placeholder {
                if inputIndex < input.endIndex {
                    result.append(input[inputIndex])
                    inputIndex = input.index(after: inputIndex)
                } else {
                    result.append(" ")
                }
            } else {
                result.append(maskCharacter)
            }
        }
        
        return result
    }
}

#Preview {
    PhoneNumberStepperView()
}
