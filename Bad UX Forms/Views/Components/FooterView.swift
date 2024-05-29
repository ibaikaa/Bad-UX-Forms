//
//  FooterView.swift
//  Bad UX Forms
//
//  Created by Ian on 29/5/24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("👨🏻‍💻 Made by [Ian Baikuchukov](https://www.linkedin.com/in/ian-baikuchukov/)")
            
            Text("©️ Inspired by: [Misha Saidov](https://cv.mishasaidov.com) and his [awesome project](https://fun.mishasaidov.com/badux/)")
        }
        .font(.callout)
        .foregroundStyle(.secondary)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    FooterView()
}
