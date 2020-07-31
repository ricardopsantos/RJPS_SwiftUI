//
//  Image+Extensions.swift
//  RJPS_SwiftUI
//
//  Created by Ricardo Santos on 12/06/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

enum ImageNames: String, CaseIterable {
    case arrow
    case arrow2 = "arrow.2"
    case arrowCounterClockWise = "arrow.counterclockwise"
    case arrowClockWise = "arrow.clockwise"
    case app
    case bag
    case bell
    case cloud
    case clock
    case camera
    case chevron
    case circle
    case envelope
    case ellipsis
    case flame
    case house
    case heart
    case gear
    case location
    case magnifyingglass
    case message
    case minus 
    case minusSquare = "minus.square"
    case minusCircle = "minus.circle"
    case mic
    case phone
    case paperplane
    case person
    case personCrop = "person.crop"
    case personCropCircle = "person.crop.circle"
    case personCropSquare = "person.crop.square"
    case plus
    case pause
    case play
    case plusCircle = "plus.circle"
    case plusSquare = "plus.square"
    case star
    case sparkles
    case stop
    case square
    case squareAndArrow = "square.and.arrow"
    case wifi
    case xmark

    var name: String {
        self.rawValue
    }

    var image: Image {
        Image(systemName: "\(self.rawValue)")
    }

    var imageFill: Image {
        Image(systemName: "\(self.rawValue).fill")
    }

    var imageBadge: Image {
        Image(systemName: "\(self.rawValue).badge")
    }

    var imageSquarePath: Image {
        Image(systemName: "\(self.rawValue).squarepath")
    }

    var imageSquare: Image {
        Image(systemName: "\(self.rawValue).square")
    }

    var imageCircle: Image {
        Image(systemName: "\(self.rawValue).circle")
    }

    var imageRight: Image {
        Image(systemName: "\(self.rawValue).right")
    }

    var imageLeft: Image {
        Image(systemName: "\(self.rawValue).left")
    }

    var imageUp: Image {
        Image(systemName: "\(self.rawValue).up")
    }

    var imageDown: Image {
        Image(systemName: "\(self.rawValue).down")
    }
}
