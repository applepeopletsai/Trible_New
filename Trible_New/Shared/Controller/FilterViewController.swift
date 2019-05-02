//
//  FilterViewController.swift
//  Trible_New
//
//  Created by Daniel on 2018/11/20.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class FilterViewController: BaseViewController {

    @IBOutlet fileprivate weak var priceRangeLabel: UILabel!
    @IBOutlet private weak var slider: RangeSeekSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        slider.delegate = self
    }
    
    // MARK: Event Handler
    @IBAction private func confirmButtonPress(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension FilterViewController: RangeSeekSliderDelegate {
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        let min = Int(minValue).transferToDecimalString()
        let max = (maxValue == 10000) ? 10000.transferToDecimalString() + "+" : Int(maxValue).transferToDecimalString()
        self.priceRangeLabel.text = "$\(min) ~ $\(max)"
    }
    
    func didStartTouches(in slider: RangeSeekSlider) {
        print("did start touches")
    }
    
    func didEndTouches(in slider: RangeSeekSlider) {
        print("did end touches")
    }
}
