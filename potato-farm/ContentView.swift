//
//  ContentView.swift
//  potato-farm
//
//  Created by YJ Soon on 7/25/26.
//

import SwiftUI

struct ContentView: View {
    // The potato that was tapped. When this has a value, SwiftUI shows its sheet.
    @State private var selectedPotato: Potato?

    /// A LazyVGrid needs one GridItem per column. Six flexible columns,
    /// each the same width, with 12 points of space between them.
    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 12),
        count: Farm.columns
    )

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // The grid itself: 42 plots laid out 6 across.
                    // LazyVGrid fills left to right, then wraps to the next row.
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(1...Farm.plotCount, id: \.self) { plot in
                            let potato = potatoes.potato(inPlot: plot)

                            PlotView(plot: plot, potato: potato)
                                .onTapGesture {
                                    // Empty plots do not have a farmer to show.
                                    selectedPotato = potato
                                }
                        }
                    }

                    footer
                }
                .padding()
            }
            .navigationTitle("🥔 Potato Farm")
            .sheet(item: $selectedPotato) { potato in
                // Pass the selected name into the sheet instead of looking it up there.
                FarmerNameSheet(name: potato.name)
            }
        }
    }

    private var footer: some View {
        VStack(spacing: 8) {
            Text("\(potatoes.count) of \(Farm.plotCount) plots planted")
                .font(.footnote)
                .foregroundStyle(.secondary)

            if !potatoes.clashingPlots.isEmpty {
                Label(
                    "Two people have claimed plot \(list(potatoes.clashingPlots)) — pick another one.",
                    systemImage: "exclamationmark.triangle.fill"
                )
                .font(.footnote)
                .foregroundStyle(.orange)
                .multilineTextAlignment(.center)
            }

            if !potatoes.invalidPlots.isEmpty {
                Label(
                    "Plot \(list(potatoes.invalidPlots)) is outside 1–\(Farm.plotCount), so it won't show up.",
                    systemImage: "questionmark.circle.fill"
                )
                .font(.footnote)
                .foregroundStyle(.orange)
                .multilineTextAlignment(.center)
            }
        }
    }

    private func list(_ plots: [Int]) -> String {
        plots.map(String.init).joined(separator: ", ")
    }
}

/// A small sheet that receives the farmer's name from ContentView.
struct FarmerNameSheet: View {
    let name: String

    var body: some View {
        VStack(spacing: 16) {
            Text("This potato belongs to")
                .font(.headline)

            Text(name)
                .font(.largeTitle.bold())
        }
        .padding()
        .presentationDetents([.height(180)])
    }
}

#Preview {
    ContentView()
}
