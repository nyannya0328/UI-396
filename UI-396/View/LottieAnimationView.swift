//
//  LottieAnimationView.swift
//  UI-396
//
//  Created by nyannyan0328 on 2021/12/18.
//

import SwiftUI
import Lottie

struct LottieAnimationView: UIViewRepresentable {
    let lottieFile : String
    @Binding var currentProgreess : CGFloat
    func makeUIView(context: Context) ->  UIView {
        
        let rootView = UIView()
        rootView.backgroundColor = .clear
        
        addAnimation(rootView: rootView)
        
        return rootView
        
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        uiView.subviews.forEach { view in
            
            
            if view.tag == 1009{
                
                view.removeFromSuperview()
            }
        }
        addAnimation(rootView: uiView)
        
    }
    
    
    func addAnimation(rootView : UIView){
        
        let animation = AnimationView(name: lottieFile, bundle: Bundle.main)
        
        animation.translatesAutoresizingMaskIntoConstraints = false
        
        animation.currentProgress = 0.49 + (currentProgreess / 2)
        
        animation.tag = 1009
        
        animation.backgroundColor = .clear
        
        let contains = [
        
            animation.widthAnchor.constraint(equalTo: rootView.widthAnchor),
            animation.heightAnchor.constraint(equalTo: rootView.widthAnchor),
        
        
        
        ]
        
        rootView.addSubview(animation)
        rootView.addConstraints(contains)
        
        
        
    }
}

