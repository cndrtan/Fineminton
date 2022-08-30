//
//  TutorialModel.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 30/08/22.
//

import Foundation

public class TutorialModel {
    
    private static var instance: TutorialModel = TutorialModel()
    
    public static func getInstance() -> TutorialModel {
        return TutorialModel.instance
    }
    
    public func getStepList() -> Array<TutorialStep> {
        
        let step1 = TutorialStep(sequenceNumber: 0, title: "Tahap-1", videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", description: "Lorem ipsum dolor sit amet. A quick brown fox jumped over a lazy dog.")
        let step2 = TutorialStep(sequenceNumber: 1, title: "Tahap-2", videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", description: "Lorem ipsum dolor sit amet. A quick brown fox jumped over a lazy dog.")
        let step3 = TutorialStep(sequenceNumber: 2, title: "Tahap-3", videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", description: "Lorem ipsum dolor sit amet. A quick brown fox jumped over a lazy dog.")
        let step4 = TutorialStep(sequenceNumber: 3, title: "Tahap-4", videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", description: "Lorem ipsum dolor sit amet. A quick brown fox jumped over a lazy dog.")
        
        var steps: Array<TutorialStep> = Array()
        steps.append(step1)
        steps.append(step2)
        steps.append(step3)
        steps.append(step4)
        
        return steps
    }
}
