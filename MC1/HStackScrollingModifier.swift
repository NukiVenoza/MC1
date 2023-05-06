//
//  HStackScrollingModifier.swift
//  MC1
//
//  Created by Angela Christabel on 28/04/23.
//

import Foundation

import SwiftUI

struct HStackScrollingModifier: ViewModifier {
    
    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat
    
    var items: Int
    var itemWidth: CGFloat
    var itemSpacing: CGFloat
    
    @Binding var index: Int
    @Binding var scrollDirection: String
    @Binding var isDragging: Bool
    
    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat, index: Binding<Int>, direction: Binding<String>, isDragging: Binding<Bool>) {
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
        self._index = index
        self._scrollDirection = direction
        self._isDragging = isDragging
        
        // Calculate Total Content Width
        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width
        
        // Set Initial Offset to first Item
        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0) - itemWidth - itemSpacing
        
        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged({ event in
                    self.isDragging = true
                    dragOffset = event.translation.width/2
                })
                .onEnded({ event in
                    
                    var tempScrollOffset = scrollOffset
                    
                    if dragOffset >= 0 {
                        scrollDirection = "left"
                        if index == 0 {
                            index = 2
                        } else {
                            index -= 1
                        }
                        tempScrollOffset += ((itemWidth/2.0) + (itemSpacing/2.0))
                    } else {
                        scrollDirection = "right"
                        if index == 2 {
                            index = 0
                        } else {
                            index += 1
                        }
                        tempScrollOffset -= ((itemWidth/2.0) + (itemSpacing/2.0))
                    }
                    
                    
                    withAnimation(.spring(response: 0.55, dampingFraction: 0.855, blendDuration: 0)) {
                        scrollOffset = tempScrollOffset
                    }
                    
                    self.isDragging = false
                    dragOffset = 0
                })
        
            )

    }
}
