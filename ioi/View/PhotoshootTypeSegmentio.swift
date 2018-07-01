//
//  PhotoshootTypeSegmentio.swift
//  ioi
//
//  Created by Shlok Kapoor on 01/07/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import Segmentio

class PhotoshootTypeSegmentio: Segmentio {
    
    var states: SegmentioStates {
        return SegmentioStates(
            defaultState: SegmentioState(
                backgroundColor: .white,
                titleFont: UIFont.robotoFont(ofSize: CGFloat(15), weight: UIFont.FontWeight.medium),
                titleTextColor: .black
            ),
            selectedState: SegmentioState(
                backgroundColor: UIColor(hexString: "#F3F3F3"),
                titleFont: UIFont.robotoFont(ofSize: CGFloat(15), weight: UIFont.FontWeight.bold),
                titleTextColor: .black
            ),
            highlightedState: SegmentioState(
                backgroundColor: UIColor(hexString: "#FAFAFA"),
                titleFont: UIFont.robotoFont(ofSize: CGFloat(15), weight: UIFont.FontWeight.medium),
                titleTextColor: .black
            )
        )
    }
    
    var options: SegmentioOptions {
        let indicator = SegmentioIndicatorOptions(
            type: .bottom,
            ratio: 1,
            height: 7,
            color: .orange
        )
        
        return SegmentioOptions(
            backgroundColor: .white,
            segmentPosition: SegmentioPosition.dynamic,
            scrollEnabled: false,
            indicatorOptions: indicator,
            horizontalSeparatorOptions: SegmentioHorizontalSeparatorOptions.init(),
            verticalSeparatorOptions: SegmentioVerticalSeparatorOptions.init(ratio: 1, color: UIColor.white),
            imageContentMode: .scaleAspectFit,
            labelTextAlignment: .center,
            segmentStates: states,
            animationDuration: 0.15
        )
    }
    
    var content: [SegmentioItem] {
    
        var content = [SegmentioItem]()
        
        let weddingItem = SegmentioItem(
            title: "Wedding",
            image: UIImage(named: "wedding")
        )
        let personalItem = SegmentioItem(
            title: "Personal",
            image: UIImage(named: "personal")
        )
        let droneItem = SegmentioItem(
            title: "Drone",
            image: UIImage(named: "drone")
        )
        content.append(weddingItem)
        content.append(personalItem)
        content.append(droneItem)
        
        return content
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setup(
            content: content,
            style: SegmentioStyle.onlyLabel,
            options: options
        )
        self.selectedSegmentioIndex = 0
    }
}

class PhotoshootTypeSegmentioPopup: PhotoshootTypeSegmentio {
    override func awakeFromNib() {
        self.setup(content: content, style: SegmentioStyle.imageOverLabel, options: options)
        self.selectedSegmentioIndex = 0
    }
}
