//
//  Home.swift
//  UI-658
//
//  Created by nyannyan0328 on 2022/09/01.
//

import SwiftUI
import SceneKit

struct Home: View {
    @State var scene : SCNScene? = .init(named: "Nike_Illusion.scn")
    @State var isVerticalLock : Bool = false
    
    @Namespace var animation
    
    @GestureState var offset : CGFloat = 0
    @State var currentSize : String = "9"
    var body: some View {
        VStack{
            
            HeaderView()
            
            CustomScneView(scence: $scene)
                .frame(height:350)
                .padding(.top,-15)
                .padding(.bottom,-15)
                .zIndex(-10)
            
            
            CustomSeaker()
            
            
            ShoePropartiView()
            
        }
        .padding()
    }
    @ViewBuilder
    func ShoePropartiView()->some View{
     
        VStack{
            VStack(alignment:.leading,spacing: 10){
                
                Text("nike".uppercased())
                    .font(.largeTitle.weight(.heavy))
                    .foregroundColor(.white)
                
                  Text("Mens Classic Shoes")
                    .font(.title3.weight(.light))
                
                Label {
                    
                      Text("4.8")
                    
                } icon: {
                    
                     Image(systemName: "star.fill")
                      
                }
                .foregroundColor(Color("Gold"))

                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            
            ScrollView(.horizontal,showsIndicators: false){
                
                HStack(spacing:10){
                    
                    let sizes = ["9","9.5","10","10.5","11","11.5","12","12.5"]
                    
                    ForEach(sizes,id:\.self){size in
                        
                          Text(size)
                            .font(.title2)
                            .foregroundColor(currentSize == size ? .black : .white)
                            .padding(.vertical,15)
                            .padding(.horizontal)
                            .background{
                             
                                ZStack{
                                    
                                    RoundedRectangle(cornerRadius: 10,style: .continuous)
                                        .fill(.white.opacity(0.3))
                                    
                                    
                                    if currentSize == size{
                                        
                                        RoundedRectangle(cornerRadius: 10,style: .continuous)
                                            .fill(.white)
                                            .matchedGeometryEffect(id: "TAB", in: animation)
                                        
                                    }
                                    
                                    
                                    
                                    
                                }
                                
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation{
                                    
                                    currentSize = size
                                }
                            }
                    }
                    
                    
                    
                }
                
                
            }
            .padding(.top,20)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            
            HStack{
                
                Button {
                    
                } label: {
                    
                    VStack{
                        
                        Image("Bag")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45,height: 45)
                       
                        
                        Text("199.5")
                            .font(.title)
                            
                    }
                    .foregroundColor(.black)
                    .padding(.vertical,40)
                    .padding(.horizontal,20)
                    .background{
                     
                        RoundedRectangle(cornerRadius: 10,style: .continuous)
                            .fill(.white)
                    }
                    
                    
                }
                
                VStack(alignment:.leading,spacing:20){
                    
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                        .font(.callout.weight(.semibold))
                    
                    Button {
                        
                    } label: {
                        
                        Text("More Details")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }

                    
                
                
                    
                }
                  .frame(maxWidth: .infinity,alignment: .leading)
                  .padding(.leading,20)
              
                
                
            
                        
                        
               
                
                
            }
            .padding(.top,30)
            
        }
          .frame(maxWidth: .infinity,alignment: .leading)
        
    }
    @ViewBuilder
    func CustomSeaker()->some View{
        
        GeometryReader{_ in
            
            Rectangle()
                .trim(from: 0,to: 0.474)
                .stroke(
                    
                    LinearGradient(colors: [
                        
                        
                        .clear,
                        .clear,
                        .white.opacity(0.2),
                        .white.opacity(0.6),
                        .white,
                        .white.opacity(0.2),
                        .white.opacity(0.6),
                        .clear,
                        .clear
                        
                    ], startPoint: .leading, endPoint: .trailing)
                    
                    ,style: StrokeStyle(lineWidth: 2,lineCap: .round,lineJoin: .round,miterLimit: 1,dash: [3],dashPhase: 1))
                .offset(x:offset)
            
                .overlay {
                    HStack(spacing:5){
                        
                        Image(systemName: "arrowtriangle.left.fill")
                        
                        Image(systemName: "arrowtriangle.right.fill")
                            
                        
                        
                    }
                    .foregroundColor(.black)
                    .padding(.vertical,13)
                    .padding(.horizontal,13)
                    .background{
                     
                        RoundedRectangle(cornerRadius: 10,style: .continuous)
                            .fill(.white)
                    }
                    .offset(y:-10)
                    .offset(x:offset)
                    .gesture(
                    
                        DragGesture().updating($offset, body: { value, out, _ in
                            
                            out = value.location.x - 20
                        })
                    
                    )
                    
                }
            
        }
        .frame(height:20)
        .onChange(of: offset, perform: { newValue in
        
            rotateObject(animated: offset == .zero)
            
        })
        .animation(.easeInOut(duration: 1), value: offset == .zero)
        
    }
    func rotateObject(animated : Bool = false){
        
        if animated{
            
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.6
            
        }
        
        let newValue = Float((offset * .pi) / 180)
        
        if isVerticalLock{
         
            
            scene?.rootNode.childNode(withName: "Root", recursively: true)?.eulerAngles.x = newValue
            
        }
        else{
            
            
            scene?.rootNode.childNode(withName: "Root", recursively: true)?.eulerAngles.y = newValue
            
        }
        
        if animated{
            
            SCNTransaction.commit()
        }
        
        
        
        
        
    }
    @ViewBuilder
    func HeaderView()->some View{
        
        HStack{
            
            Button {
                
            } label: {
                
                Image(systemName: "arrow.left")
                    .font(.system(size: 20,weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical,15)
                    .padding(.horizontal,15)
                    .background{
                        
                        RoundedRectangle(cornerRadius: 10,style: .continuous)
                            .fill(.white.opacity(0.3))
                    }
            }
            
            
            Spacer()
            
            Button {
                
                withAnimation{
                    
                    isVerticalLock.toggle()
                }
                
            } label: {
                
                Image(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill")
                    .font(.system(size: 20,weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical,15)
                    .padding(.horizontal,15)
                    .rotationEffect(.init(degrees: isVerticalLock ? 0 : 90))
                    .background{
                        
                        RoundedRectangle(cornerRadius: 10,style: .continuous)
                            .fill(.white.opacity(0.3))
                    }
            }
            
            
            
        }
        
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
