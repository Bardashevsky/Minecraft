//
//  Binder.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//


import Foundation

class Binder<T> {
    typealias Listener = (T) -> ()
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
    init(_ value: T) {
        self.value = value
    }
}
