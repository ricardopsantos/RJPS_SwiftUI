//
//  File.swift
//  RJPS_SwiftUI
//
//  Created by Ricardo Santos on 12/06/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

extension View {
    @inlinable public func textColor(_ color: Color?) -> some View {
        self.foregroundColor(color)
    }
}