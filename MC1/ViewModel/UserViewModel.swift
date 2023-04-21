//
//  UserViewModel.swift
//  MC1
//
//  Created by Angela Christabel on 21/04/23.
//

import Foundation

class UserViewModel: ObservableObject {
    // harus tambahin code untuk baca user dari userDefaults
    @Published var user = User(name: "Guest")
}
