//
//  View+onRotate.swift
//  UalaCities
//
//  Created by Joni Bandoni on 26/07/2024.
//

import Foundation
import SwiftUI

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
