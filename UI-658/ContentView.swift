//
//  ContentView.swift
//  UI-658
//
//  Created by nyannyan0328 on 2022/09/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            
         
            Home()
                .preferredColorScheme(.dark)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
