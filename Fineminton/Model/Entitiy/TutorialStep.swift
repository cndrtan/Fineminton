//
//  Tutorial.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 30/08/22.
//

import Foundation

public struct TutorialStep: Identifiable {
    public var id:UUID = UUID()
    public var sequenceNumber: Int = -1
    public var title: String = ""
    public var mediaSource: String = ""
    public var description: String = ""
    public var mediaType: String = "video" // or "image"
    public var showActionButton: Bool = false
    
    public func titleWithSequence(stepsCount: Int) -> String {
        let total = stepsCount //allSteps.count
        let totalStr = String(total)
        let titleOutOf = self.title + " dari " + totalStr + ":"
        return titleOutOf
    }
}
