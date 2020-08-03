//
//  Text+Extensions.swift
//  Extensions
//
//  Created by Ricardo Santos on 03/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI

public extension Text {
    @inlinable func textColor(_ color: Color?) -> some View {
        self.foregroundColor(color)
    }
}

public extension TextField {
    @inlinable func textColor(_ color: Color?) -> some View {
        self.foregroundColor(color)
    }
}
