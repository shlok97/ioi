//
//  Interests.swift
//  ioi
//
//  Created by Shlok Kapoor on 10/06/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit

class Interest {
    private var _interestTitle: String = ""
    private var _interestImageURL: String?
    private var _isSelected: Bool = false
    
    init(interestTitle: String, interestImageURL: String? = nil) {
        self._interestTitle = interestTitle
        self._interestImageURL = interestImageURL
    }
    //TOGGLE SELECTION WHEN TAPPED
    func tappedOn() {
        if _isSelected {
            _isSelected = false
        }
        else {
            _isSelected = true
        }
    }
    
    var isSelected: Bool {
        return _isSelected
    }
    var interestTitle: String {
        return _interestTitle
    }
    var interestImageURL: String? {
        return _interestImageURL
    }
    
}

class Interests {
    private var _interestCategories: [Interest] = []
    func setInterests() {
        _interestCategories = [
            Interest(interestTitle: "Personal", interestImageURL: "https://cdn-images-1.medium.com/max/1600/1*_6EdJgpcWyeWne36eFH7eA@2x.jpeg"),
            Interest(interestTitle: "Wedding", interestImageURL: "https://cdn-images-1.medium.com/max/1600/1*_6EdJgpcWyeWne36eFH7eA@2x.jpeg"),
            Interest(interestTitle: "Corporate", interestImageURL: "https://cdn-images-1.medium.com/max/1600/1*_6EdJgpcWyeWne36eFH7eA@2x.jpeg"),
            Interest(interestTitle: "Drone", interestImageURL: "https://cdn-images-1.medium.com/max/1600/1*_6EdJgpcWyeWne36eFH7eA@2x.jpeg"),
            Interest(interestTitle: "Product", interestImageURL: "https://cdn-images-1.medium.com/max/1600/1*_6EdJgpcWyeWne36eFH7eA@2x.jpeg")
        ]
    }
    var selectedInterests: [Interest] {
        var selectedInterests = [Interest]()
        for category in interestCategories {
            if category.isSelected {
                selectedInterests.append(category)
            }
        }
        return selectedInterests
    }
    var interestCategories: [Interest] {
        return _interestCategories
    }
}
