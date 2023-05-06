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
                    // Scroll to where user dragged
                    var tempScrollOffset = scrollOffset
                    
//                     Now calculate which item to snap to
//                    let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
//                    let screenWidth = UIScreen.main.bounds.width
//
//                    // Center position of current offset
//                    let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
//
//                    // Calculate which item we are closest to using the defined size
//                    let idx = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
//
//                    // See if user scrolled left or right and adjust index accordingly
//                    var value: Int = 0
//
//                    if idx.remainder(dividingBy: 1) > 0.5 {
//                        value += 1
//                    } else {
//                        value = Int(idx)
//                    }
//
//                    // Protect from scrolling out of bounds
//                    value = min(value, items - 1)
//                    value = max(value, 0)

//                    // Set final offset (snapping to item)
//                    let newOffset = CGFloat(value) * itemWidth + CGFloat(index - 1) * itemSpacing  - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing
                    
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
            // Animate snapping
//            .animation(Animation
//                .interactiveSpring(response: 0.5, dampingFraction: 0.855, blendDuration: 0), value: scrollOffset)
//                .spring(response: 0.5, dampingFraction: 2, blendDuration: 1), value: scrollOffset)
//                .linear(duration: 2), value: scrollOffset)
    }
}
