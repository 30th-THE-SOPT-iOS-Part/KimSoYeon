//
//  SignInViewModel.swift
//  Instagram
//
//  Created by 소연 on 2022/04/07.
//

import RxSwift
import RxCocoa

final class SignInViewModel {
    
    var disposeBag = DisposeBag()
    
    var input = Input()
    var output = Output()
    
    struct Input {
        let id = PublishSubject<String>()
        let password = PublishSubject<String>()
        let touchUpSignInButton = PublishSubject<Void>()
    }
    
    struct Output {
        let enableSignInButton = PublishRelay<Bool>()
        let pushToMain = PublishRelay<Void>()
    }
    
    init() {
        Observable.combineLatest(input.id, input.password)
            .map{ !$0.0.isEmpty && !$0.1.isEmpty }
            .bind(to: output.enableSignInButton)
            .disposed(by: disposeBag)
        
        input.touchUpSignInButton
            .withLatestFrom(Observable.combineLatest(input.id, input.password))
            .bind { [weak self] (id, password) in
                guard let self = self else { return }
                self.output.pushToMain.accept(())
            }.disposed(by: disposeBag)
    }
    
}
