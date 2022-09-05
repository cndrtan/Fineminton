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
        
        let step1 = TutorialStep(sequenceNumber: 0, title: "Tahap 1", mediaSource: "tahap_1_grip", description: "Genggamlah raket dengan benar (bisa menggunakan \"Handhsake\" atau \"Pistol\" grip).", mediaType: "image")
        let step2 = TutorialStep(sequenceNumber: 1, title: "Tahap 2", mediaSource: "tahap_2_stance", description: "Lakukanlah \"Waiting\" atau \"Receiving\" stance. \nTahan lengan Anda yang memegang raket dalam posisi pinggiran raket menghadap ke atas. \nAtur keseimbangan Anda pada kedua kaki secara merata.", mediaType: "image")
        let step3 = TutorialStep(sequenceNumber: 2, title: "Tahap 3", mediaSource: "tahap_3_clear_shot_detail_tangan", description: "Gerakkan pergelangan tangan Anda sampai menghadap ke atas. \nPukul-lah kok, ketika kok berada di arah pukul 11. \nAyunkan raket kedepan setinggi mungkin sampai mencapai kontak dengan kok.")
        let step4 = TutorialStep(sequenceNumber: 3, title: "Tahap 4", mediaSource: "tahap_4_clear_shot_tutorial_footwork", description: "Kaki kanan maju kedepan mengikuti raket.")
        let step5 = TutorialStep(sequenceNumber: 4, title: "Tahap 5", mediaSource: "tahap_5_clear_shot", description: "Tarik kembali lengan yang memegang raket ke area belakang, seperti gerakan menarik busur panah.")
        let step6 = TutorialStep(sequenceNumber: 5, title: "Tahap 6", mediaSource: "tahap_6_clear_shot_fast", description: "Lakukanlah sebanyak 20 kali dengan 5 set.", showActionButton: true)
        
        var steps: Array<TutorialStep> = Array()
        steps.append(step1)
        steps.append(step2)
        steps.append(step3)
        steps.append(step4)
        steps.append(step5)
        steps.append(step6)
        
        return steps
    }
}
