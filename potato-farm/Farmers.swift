//
//  Farmers.swift
//  potato-farm
//
//  👋 THIS IS THE ONLY FILE YOU NEED TO EDIT.
//

import SwiftUI

// ════════════════════════════════════════════════════════════════════
//
//   🥔  ADD YOURSELF TO THE FARM  🥔
//
//   1. Run the app and find an empty plot. Empty plots show their
//      number (1 to 42), counting left to right, top to bottom.
//   2. Add ONE line to the list below with that plot number, your
//      name, and a colour you like.
//   3. Run the app again — your potato should be there!
//
//   Copy this line and change the three bits:
//
//       Potato(plot: 12, name: "Your Name", color: .orange),
//
//   Colours you can use:
//       .red  .orange  .yellow  .green  .mint  .teal  .cyan
//       .blue  .indigo  .purple  .pink  .brown  .gray  .black
//
//   Or mix your own (values go from 0 to 1):
//       Color(red: 0.9, green: 0.4, blue: 0.2)
//
//   ⚠️  Keep the plot numbers in order, and don't take a plot
//       someone else has already claimed. The app will warn you
//       underneath the grid if two people pick the same plot.
//
// ════════════════════════════════════════════════════════════════════

let potatoes: [Potato] = [

    // ── Instructors ──────────────────────────────────────────────
    Potato(plot: 1, name: "YJ", color: .brown),
    Potato(plot: 2, name: "Jia Chen", color: .orange),
    Potato(plot: 3, name: "Faith", color: .green),
    Potato(plot: 4, name: "Tristan", color: .indigo),

    // ── Students: add your line below this one! ───────────────────
    Potato(plot: 12, name: "Paviesh", color: .black),

]
