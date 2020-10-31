//
//  Created by Ricardo Santos on 07/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

public protocol APIProtocol {
    func fetchDay(weekDay: Int) -> AnyPublisher<String, E.HourlyErrorEntity>
    func fetchMainTask(weekDay: Int) -> AnyPublisher<String, E.HourlyErrorEntity>
    func fetchImageName(weekDay: Int) -> AnyPublisher<String, E.HourlyErrorEntity>
    func fetchColor(weekDay: Int) -> AnyPublisher<Color, E.HourlyErrorEntity>
    func fetchTask(weekDay: Int, hour: String) -> AnyPublisher<String, E.HourlyErrorEntity>
}
