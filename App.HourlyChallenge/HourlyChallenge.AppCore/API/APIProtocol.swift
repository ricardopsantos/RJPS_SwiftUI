//
//  Created by Ricardo Santos on 07/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

public protocol APIProtocol {
    func day(weekDay: Int) -> AnyPublisher<String, E.HourlyErrorEntity>
    func mainTask(weekDay: Int) -> AnyPublisher<String, E.HourlyErrorEntity>
    func imageName(weekDay: Int) -> AnyPublisher<String, E.HourlyErrorEntity>
    func color(weekDay: Int) -> AnyPublisher<Color, E.HourlyErrorEntity>
    func task(weekDay: Int, hour: String) -> AnyPublisher<String, E.HourlyErrorEntity>
}
