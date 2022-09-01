//
//  CustomScneView.swift
//  UI-658
//
//  Created by nyannyan0328 on 2022/09/01.
//

import SwiftUI
import SceneKit

struct CustomScneView: UIViewRepresentable {
    
    @Binding var scence : SCNScene?
    func makeUIView(context: Context) -> SCNView {
        
        let view = SCNView()
        view.allowsCameraControl = false
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.backgroundColor = .clear
        view.scene = scence
        
        return view
        
    }
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
}


