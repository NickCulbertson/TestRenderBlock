//
//  ContentView.swift
//  TestRenderBlock
//
//  Created by Nick Culbertson on 10/4/22.
//

import SwiftUI
import AudioKit

struct ContentView: View {
    let engine = AudioEngine()
    var instrument = AppleSampler()
    func start(){
        engine.output = instrument
        try? instrument.loadInstrument(url: Bundle.main.url(forResource: "Sounds/GuitarTaps", withExtension: "exs")!)
        try? engine.start()
        
    }
    
    func instrumentLoop() {
        for i in 1..<100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 * Double(i)) {
                instrument.play(noteNumber: 36, velocity: 127, channel: 0)
                instrument.play(noteNumber: 37, velocity: 127, channel: 0)
                instrument.play(noteNumber: 38, velocity: 127, channel: 0)
                instrument.play(noteNumber: 39, velocity: 127, channel: 0)
                instrument.play(noteNumber: 40, velocity: 127, channel: 0)
                try? instrument.loadInstrument(at: Bundle.main.url(forResource: "Sounds/GuitarTaps", withExtension: "exs")!)
                instrument.play(noteNumber: 36, velocity: 127, channel: 0)
                instrument.play(noteNumber: 37, velocity: 127, channel: 0)
                instrument.play(noteNumber: 38, velocity: 127, channel: 0)
                instrument.play(noteNumber: 39, velocity: 127, channel: 0)
                instrument.play(noteNumber: 40, velocity: 127, channel: 0)
                    }
        }
    }
    var body: some View {
        Text("START").bold().foregroundColor(.blue).onTapGesture {
            instrumentLoop()
        }.onAppear(perform:{start()})
    }
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
