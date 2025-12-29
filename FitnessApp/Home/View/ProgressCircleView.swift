//
//  ProgressCircleView.swift
//  FitnessApp
//
//  Created by Emirhan Gökçe on 25.12.2025.
//

import SwiftUI

struct ProgressCircleView: View {
    
    //
    @Binding var progress : Int //katedilen yol. Bağlantı için @Binding kullandık
    var goal: Int //Katedilmesi gereken toplam yol
    var color: Color
    private let width: CGFloat = 20
    
    
    var body: some View {
        //MARK: CircleBar CodeSnippet
        ZStack{
            Circle()
                .stroke(color.opacity(0.3), lineWidth: width) //içini boşaltıyor.
            
            Circle()
                .trim(from: 0, to: CGFloat(progress) / CGFloat(goal)) //%X kadarını alıcaz
                .stroke(color, style: StrokeStyle(lineWidth: width, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
        }
        .padding()
    }
}

#Preview {
    ProgressCircleView(progress: .constant(100), goal: 200, color: .red)
}
