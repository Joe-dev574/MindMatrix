//
//  LogoView.swift
//  MindMatrix
//
//  Created by Joseph DeWeese on 12/4/24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            HStack {
                Spacer()
                ZStack{
                    
                    Image(systemName: "scope")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .foregroundColor(.blue).opacity(0.3)
                    HStack {
                        Text("Sniper")
                            .font(.callout)
                            .fontDesign(.serif)
                            .fontWeight(.bold)
                        
                            .foregroundColor(.blue)
                            .offset(x: 13, y: 7)
                        Text("Scope")
                            .font(.callout)
                            .fontDesign(.serif)
                            .fontWeight(.heavy)
                            .foregroundStyle(.primary)
                            .offset(x: 5, y: 7)
                        Text("1.0")
                            .font(.caption)
                            .fontDesign(.serif)
                            .fontWeight(.regular)
                            .padding(.leading, 10)
                            .foregroundColor(.blue)
                            .offset(x: -15, y: -2)
                    }.offset(x: 5)
                    
                }
                Spacer()
            }
            }
        }
    }

#Preview {
    LogoView()
}
