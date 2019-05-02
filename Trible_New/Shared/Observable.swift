//
//  Observable.swift
//  Trible_New
//
//  Created by Daniel on 2019/4/18.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

class Observable<T> {
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    private var valueChanged: ((T) -> Void)?
    
    /// Add closure as an observer and trigger the closure imeediately if fireNow = true
    func addObserver(fireNow: Bool = true, _ onChange: ((T) -> Void)?) {
        valueChanged = onChange
        if fireNow {
            onChange?(value)
        }
    }
    
    func removeObserver() {
        valueChanged = nil
    }
    
}

/**
 Observable for array that one might be able to receive the changed index for the array
 
 - Description:
 By assigning the valueChanged and dataReloaded to get the value update of the array. This object could be used as an collection, like subscription get/set and filter/map, etc. In addition, append, insert, and remove are also supported
 - Data:
 To reload the whole array, use reloadData(_ values: [T])
 */
class ArrayObservable<T>: Collection, RangeReplaceableCollection {
    typealias Element = T
    typealias Index = Int
    
    /// The manipulation type to the arrry
    enum Action {
        case insert
        case remove
        case reload
    }
    
    private var values: [T]
    
    /// Observing single value changes
    var valueChanged: ((Int, Action) -> Void)?
    
    /// Observing the whole array update
    var dataReloaded: (() -> Void)?
    
    required init() {
        values = []
    }
    
    // MARK: Collection Conformation
    var startIndex: Int {
        return values.startIndex
    }
    
    var endIndex: Int {
        return values.endIndex
    }
    
    func index(after i: Int) -> Int {
        return values.index(after: i)
    }
    
    subscript(position: Int) -> T {
        get {
            return values[position]
        }
        set(newValue) {
            values[position] = newValue
            valueChanged?(position, .reload)
        }
    }
    
    // MARK: Data Manipulation
    
    func append(_ newElement: T) {
        values.append(newElement)
        valueChanged?(values.count-1, .insert)
    }
    
    func remove(at position: Int) -> T {
        let value = values.remove(at: position)
        valueChanged?(position, .remove)
        return value
    }
    
    func insert(_ newElement: T, at i: Int) {
        values.insert(newElement, at: i)
        valueChanged?(i, .insert)
    }
    
    /// Update the whole array
    func reloadData(_ values: [T]) {
        self.values = values
        dataReloaded?()
    }
    
}
