//
//  ContentView.swift
//  Nifty-Dice-Roller-App
//
//  Created by Iiro Alhonen on 11.06.21.
//

import SwiftUI

struct ContentView: View {
    @State private var rolledAmount: Int = 0
    
    var body: some View {
        VStack {
            RollResultView(rolledAmount: $rolledAmount)
            DiceGridView(rolledAmount: $rolledAmount)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
