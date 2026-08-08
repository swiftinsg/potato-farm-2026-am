//
//  Potato.swift
//  potato-farm
//
//  The farm's "rules": what a potato is, and how big the field is.
//  You probably don't need to touch this file — add yourself in Farmers.swift.
//

import SwiftUI

/// One potato growing in the farm: a name, a colour, and the plot it sits in.
struct Potato: Identifiable {
    let id = UUID()

    /// Which plot this potato grows in, from 1 to 67.
    let plot: Int

    /// The name shown inside the circle. Keep it short so it fits!
    let name: String

    /// The colour of the circle.
    let color: Color
}

/// The size of the field. 67 plots, laid out 6 across.
enum Farm {
    static let columns = 6
    static let plotCount = 67
}

extension Array where Element == Potato {
    /// Plots claimed by more than one person — these need sorting out before merging.
    var clashingPlots: [Int] {
        Dictionary(grouping: self, by: \.plot)
            .filter { $0.value.count > 1 }
            .keys
            .sorted()
    }

    /// Plot numbers outside 1...67, which would never show up on screen.
    var invalidPlots: [Int] {
        map(\.plot)
            .filter { !(1...Farm.plotCount).contains($0) }
            .sorted()
    }

    /// The potato growing in a given plot, if anyone has claimed it.
    func potato(inPlot plot: Int) -> Potato? {
        first { $0.plot == plot }
    }
}
