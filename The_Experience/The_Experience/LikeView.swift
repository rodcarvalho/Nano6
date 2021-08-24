//
//  LikeView.swift
//  The_Experience
//
//  Created by Rodrigo Ryo Aoki on 23/08/21.
//

import SwiftUI

struct LikeView: View {
	@State private var isLiked: Bool = false
    var body: some View {
		ZStack{
			Color.black
			HearthButton(isLiked: $isLiked)
		}.ignoresSafeArea()
	}
}

struct HearthButton: View {
	@Binding var isLiked: Bool
	
	
	private let animationDuration: Double = 0.5
	@State private var animationScale: CGFloat = 1
	private var scaleMinMax: CGFloat {
		isLiked ? 0.7 : 1.3
	}
	
	private var imgName: String {
		isLiked ? "Coracao preenchido grande" : "Coracao"
	}
	
	@State private var fadeOut: Bool = false
	@State private var animate = false
	
	var body: some View {
		Button(action: {
				self.fadeOut.toggle()
				animationScale = scaleMinMax
				
				DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration/2) {
						withAnimation {
							self.isLiked.toggle()
							self.fadeOut.toggle()
							if isLiked {
								animate = true
							}
							
							
							DispatchQueue.main.asyncAfter(deadline: .now() + (isLiked ? 2.0 : 0.0)) {
								animationScale = 1
								animate = false
							}
					}
				}
			
		}, label: {
			ZStack {
				Image("Borda coracao")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 300)
					.scaleEffect(animate ? 1 : 0)
					.animation(.easeInOut(duration: animationDuration/2))
				
				Image(imgName)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 170)
					.opacity(fadeOut ? 0 : 1)
					.animation(.easeInOut(duration: animationDuration/2))
			}
		})
		.scaleEffect(animationScale)
		.animation(.easeIn(duration: animationDuration))
	}
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView()
    }
}
