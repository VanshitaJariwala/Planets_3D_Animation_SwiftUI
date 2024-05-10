//
//  ContentView.swift
//  Planets 3D
//
//  Created by Vanshita on 09/05/24.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

#Preview {
    ContentView()
}

struct Home : View {
    
    @State var models = [
        
        Model(id: 0, name: "Earth", modelName: "Earth.usdz", details: "Earth, the third planet from the Sun, with its oceans, continents, and atmosphere supporting a rich tapestry of life."),
        
        Model(id: 0, name: "Jupiter", modelName: "Jupiter.usdz", details: "Jupiter, the largest planet in our solar system, boasts swirling clouds and the iconic Great Red Spot."),
        
        Model(id: 0, name: "Mars", modelName: "Mars.usdz", details: "Mars, the fourth planet from the Sun, beckons with its rusty-red hue and mystique of potential life."),
        
        Model(id: 0, name: "Pluto", modelName: "Pluto.usdz", details: "Pluto, once the ninth planet, now a dwarf planet, showcases its icy, fascinating astronomers with its mysteries."),
        
        Model(id: 0, name: "Venus", modelName: "Venus.usdz", details: "Venus, the second planet from the Sun, radiates with its thick atmosphere and extreme surface temperatures.")
    ]
     
    @State var index = 0
    
    var body: some View {
       
        VStack {
            
            SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            
            ZStack {
                
                HStack {
                    
                    Button(action: {
                        withAnimation{
                            if index > 0 {
                                index -= 1
                            }
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 35, weight: .bold))
                            .opacity(index == 0 ? 0.3 : 1)
                    })
                    .disabled(index == 0 ? true : false)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            if index < models.count  {
                                index += 1
                            }
                        }
                    }, label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 35, weight: .bold))
                            .opacity(index == models.count - 1 ? 0.3 : 1)
                    })
                    .disabled(index == models.count - 1 ? true : false)
                    
                }
                
                Text(models[index].name)
                    .font(.system(size: 45, weight: .bold))
            }
            .foregroundColor(.black)
            .padding(.horizontal)
            .padding(.vertical,30)
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("About")
                    .font(.title2)
                    .fontWeight(.bold)
                    
                Text(models[index].details)
            })
            .padding(.horizontal)
            
            Spacer(minLength: 0)
            
        }
    }
}

// Data Model...

struct Model : Identifiable {
    
    var id : Int
    var name : String
    var modelName : String
    var details : String
}

