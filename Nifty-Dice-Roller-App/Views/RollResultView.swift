//
//  RollResultView.swift
//  Nifty-Dice-Roller-App
//
//  Created by Iiro Alhonen on 14.06.21.
//

import SwiftUI

struct RollResultView: View {
    @Binding var rolledAmount: Int
    
    var body: some View {
        VStack {
            Spacer()
            Text("Rolled:")
                .font(.subheadline)
            Text("\(rolledAmount)")
                .font(.title)
            Spacer()
        }
    }
}
