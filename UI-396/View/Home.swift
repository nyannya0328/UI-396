//
//  Home.swift
//  UI-396
//
//  Created by nyannyan0328 on 2021/12/18.
//

import SwiftUI

struct Home: View {
    @State var offset : CGFloat = 0
    @GestureState var isDragging : Bool = false
    
    @State var currentProgress : CGFloat = 0.5
    var body: some View {
        VStack{
            
            
            Text(getTitle())
                .font(.title.weight(.heavy))
                .kerning(1.6)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                LottieAnimationView(lottieFile: "88964-snowman",currentProgreess: $currentProgress)
                    .frame(width: size.width, height: size.height)
                    .scaleEffect(0.8)
                
                  
                    
                
                
                
                
            }
            
            ZStack{
                
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(height: 1)
                
                
                Group{
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black)
                        .frame(width: 55, height: 55)
                    
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 10, height: 10)
                    
                    
                    
                }
                .frame(maxWidth:.infinity)
                .contentShape(Rectangle())
                .offset(x: offset)
                .gesture(
                
                    DragGesture(minimumDistance: 0.5).updating($isDragging, body: { _, out, _ in
                        out = true
                    })
                    
                        .onChanged({ value in
                            
                            var translation = value.location.x
                            
                            let widht = UIScreen.main.bounds.width - 30
                            
                            
                            
                            translation = (translation > 27 ? translation : 27)
                            
                            translation = (translation < (widht - 27) ? translation : (widht - 27))
                            
                            
                            translation = isDragging ? translation : 0
                            
                            
                            offset = translation - (widht / 2)
                            
                            let progress = (translation - 27) / (widht - 55)
                            
                            
                            currentProgress = progress
                            
                            
                            
                            
                        })
                
                
                )
                .padding()
                
                
                
            }
            
         
            
            Button {
                
            } label: {
                
                Text("Done")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .padding(.vertical,20)
                    .padding(.horizontal,30)
                    .frame(maxWidth:.infinity)
                    .background(Color.black,in:RoundedRectangle(cornerRadius: 15))
                
            }
            .padding()

        
                
            
            
            
            
            
            
        }
        .padding(15)
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color.yellow)
        .overlay(
        
        
            Button(action: {
                
            }, label: {
                Image(systemName: "xmark")
                    .font(.title.bold())
                    .foregroundColor(.black)
                    .padding()
            })
            
            ,alignment: .topTrailing
        
        )
    }
    
    func getTitle()->AttributedString{
        
        var str = AttributedString("How was Your\nFood?")
        
        if let range = str.range(of: "Food?"){
            
            
            str[range].foregroundColor = .white
            str[range].font = .system(size: 20, weight: .bold)
            
        }
        
        return str
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
