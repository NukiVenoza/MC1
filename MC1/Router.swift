//
//  Router.swift
//  MC1
//
//  Created by Angela Christabel on 02/05/23.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func reset() {
        self.path = NavigationPath()
    }
}
