//
//  PhoneNumberPickerView.swift
//  Bad UX Forms
//
//  Created by Ian on 29/5/24.
//

import SwiftUI
import SwiftUI

struct PhoneNumberPickerView: View {
    @State private var countryCode = 0
    @State private var areaCode: [Int] = Array(repeating: 0, count: 3)
    @State private var firstSegment: [Int] = Array(repeating: 0, count: 3)
    @State private var secondSegment: [Int] = Array(repeating: 0, count: 4)
    
    private struct LeadingViewID: Hashable { 
        static var value = LeadingViewID()
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        Text("+")
                            .id(LeadingViewID.value)
                        
                        DigitsWheelPicker(selection: $countryCode)
                        
                        Text("(")
                        
                        PickerColumns(buildFor: $areaCode)
                        
                        Text(")")
                        
                        PickerColumns(buildFor: $firstSegment)
                        
                        Text("-")
                        
                        PickerColumns(buildFor: $secondSegment)
                    }
                }
                
                HStack {
                    ResetButton {
                        reset(proxy: proxy)
                    }
                    
                    ConfirmButton(number: number())
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func reset(proxy: ScrollViewProxy) {
        countryCode = 0
        areaCode = Array(repeating: 0, count: 3)
        firstSegment = Array(repeating: 0, count: 3)
        secondSegment = Array(repeating: 0, count: 4)
        
        withAnimation {
            proxy.scrollTo(LeadingViewID.value)
        }
    }
    
    private func number() -> String {
        let phoneNumber = "+\(countryCode) (\(areaCode.map(String.init).joined())) \(firstSegment.map(String.init).joined())-\(secondSegment.map(String.init).joined())"
        return phoneNumber
    }
    
}

// MARK: - PickerColumns

private struct PickerColumns: View {
    @Binding var array: [Int]
    
    init(buildFor array: Binding<[Int]>) {
        self._array = array
    }
    
    var body: some View {
        ForEach(0..<array.count, id: \.self) { index in
            DigitsWheelPicker(selection: $array[index])
        }
    }
}

// MARK: - DigitsWheelPicker

private struct DigitsWheelPicker: View {
    @Binding var selection: Int
    
    var body: some View {
        Picker("", selection: $selection) {
            ForEach(0..<10) { number in
                Text("\(number)").tag(number)
            }
        }
        .pickerStyle(.wheel)
        .frame(width: 50)
        .animation(.linear, value: selection)
        .frame(maxHeight: 100)
    }
}

#Preview {
    PhoneNumberPickerView()
}
