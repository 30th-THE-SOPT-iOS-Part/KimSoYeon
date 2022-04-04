//
//  Reactive+.swift
//  Instagram
//
//  Created by 소연 on 2022/04/04.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import ReactorKit

public typealias ReactorKitView = ReactorKit.View

extension ObservableType {
    internal func doOnNext(_ onNext: @escaping (Element) throws -> Void) -> Observable<Element> {
        return `do`(onNext: onNext)
    }
    
    internal func doOnError(_ onError: @escaping (Error) throws -> Void) -> Observable<Element> {
        return `do`(onError: onError)
    }
}

// MARK: RxGesture

extension Reactive where Base: RxGesture.RxGestureView {
    internal func tapGestureRecognized() -> Observable<UITapGestureRecognizer> {
        return tapGesture(configuration: { _ , delegate in delegate.simultaneousRecognitionPolicy = .never }).when(.recognized)
    }
    
    internal func tapGestureRecognizedVoid() -> Observable<Void> {
        return tapGestureRecognized().map { _ in Void() }
    }
}

extension ObservableType {
    public func observeOnMain() -> Observable<Element> {
        observe(on: MainScheduler.instance)
    }
    public func observeOnBackground() -> Observable<Element> {
        observe(on: ConcurrentDispatchQueueScheduler(qos: .background))
    }
    
    public func throttleOnMain(_ dueTime: RxTimeInterval, latest: Bool = true) -> Observable<Element> {
        throttle(dueTime, latest: latest, scheduler: MainScheduler.instance)
    }
    
    public func throttleOnBackground(_ dueTime: RxTimeInterval, latest: Bool = true) -> Observable<Element> {
        throttle(dueTime, latest: latest, scheduler: ConcurrentDispatchQueueScheduler(qos: .background))
    }
}

