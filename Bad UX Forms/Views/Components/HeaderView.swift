//
//  HeaderView.swift
//  Bad UX Forms
//
//  Created by Ian on 29/5/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("BAD UX Формы")
                .font(.largeTitle)
                .bold()
            
            Text("🔥 Коллекция живых форм ввода номера с адовым UX. На сколько форм хватит твоих нервишек?")
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal)
    }
}

#Preview {
    HeaderView()
}
