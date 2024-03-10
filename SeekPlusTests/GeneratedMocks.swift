// MARK: - Mocks generated from file: SeekPlus/Features/Home/Data/HomeServiceContract.swift at 2024-03-11 18:41:36 +0000

//
//  HomeServiceContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Cuckoo
@testable import SeekPlus

import Combine






 class MockHomeServiceContract: HomeServiceContract, Cuckoo.ProtocolMock {
    
     typealias MocksType = HomeServiceContract
    
     typealias Stubbing = __StubbingProxy_HomeServiceContract
     typealias Verification = __VerificationProxy_HomeServiceContract

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HomeServiceContract?

     func enableDefaultImplementation(_ stub: HomeServiceContract) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func getActiveJobList(_ limit: Int, _ page: Int) -> ActiveJobListPublisher {
        
    return cuckoo_manager.call(
    """
    getActiveJobList(_: Int, _: Int) -> ActiveJobListPublisher
    """,
            parameters: (limit, page),
            escapingParameters: (limit, page),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getActiveJobList(limit, page))
        
    }
    
    

     struct __StubbingProxy_HomeServiceContract: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func getActiveJobList<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ limit: M1, _ page: M2) -> Cuckoo.ProtocolStubFunction<(Int, Int), ActiveJobListPublisher> where M1.MatchedType == Int, M2.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int, Int)>] = [wrap(matchable: limit) { $0.0 }, wrap(matchable: page) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockHomeServiceContract.self, method:
    """
    getActiveJobList(_: Int, _: Int) -> ActiveJobListPublisher
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_HomeServiceContract: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func getActiveJobList<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ limit: M1, _ page: M2) -> Cuckoo.__DoNotUse<(Int, Int), ActiveJobListPublisher> where M1.MatchedType == Int, M2.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int, Int)>] = [wrap(matchable: limit) { $0.0 }, wrap(matchable: page) { $0.1 }]
            return cuckoo_manager.verify(
    """
    getActiveJobList(_: Int, _: Int) -> ActiveJobListPublisher
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class HomeServiceContractStub: HomeServiceContract {
    

    

    
    
    
    
     func getActiveJobList(_ limit: Int, _ page: Int) -> ActiveJobListPublisher  {
        return DefaultValueRegistry.defaultValue(for: (ActiveJobListPublisher).self)
    }
    
    
}





// MARK: - Mocks generated from file: SeekPlus/Features/Home/Domain/HomeInteractorContract.swift at 2024-03-11 18:41:36 +0000

//
//  HomeInteractorContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Cuckoo
@testable import SeekPlus

import Combine






 class MockHomeInteractorContract: HomeInteractorContract, Cuckoo.ProtocolMock {
    
     typealias MocksType = HomeInteractorContract
    
     typealias Stubbing = __StubbingProxy_HomeInteractorContract
     typealias Verification = __VerificationProxy_HomeInteractorContract

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HomeInteractorContract?

     func enableDefaultImplementation(_ stub: HomeInteractorContract) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func getActiveJobList(_ limit: Int, _ page: Int) -> ActiveJobListPublisher {
        
    return cuckoo_manager.call(
    """
    getActiveJobList(_: Int, _: Int) -> ActiveJobListPublisher
    """,
            parameters: (limit, page),
            escapingParameters: (limit, page),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getActiveJobList(limit, page))
        
    }
    
    

     struct __StubbingProxy_HomeInteractorContract: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func getActiveJobList<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ limit: M1, _ page: M2) -> Cuckoo.ProtocolStubFunction<(Int, Int), ActiveJobListPublisher> where M1.MatchedType == Int, M2.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int, Int)>] = [wrap(matchable: limit) { $0.0 }, wrap(matchable: page) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockHomeInteractorContract.self, method:
    """
    getActiveJobList(_: Int, _: Int) -> ActiveJobListPublisher
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_HomeInteractorContract: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func getActiveJobList<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ limit: M1, _ page: M2) -> Cuckoo.__DoNotUse<(Int, Int), ActiveJobListPublisher> where M1.MatchedType == Int, M2.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int, Int)>] = [wrap(matchable: limit) { $0.0 }, wrap(matchable: page) { $0.1 }]
            return cuckoo_manager.verify(
    """
    getActiveJobList(_: Int, _: Int) -> ActiveJobListPublisher
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class HomeInteractorContractStub: HomeInteractorContract {
    

    

    
    
    
    
     func getActiveJobList(_ limit: Int, _ page: Int) -> ActiveJobListPublisher  {
        return DefaultValueRegistry.defaultValue(for: (ActiveJobListPublisher).self)
    }
    
    
}





// MARK: - Mocks generated from file: SeekPlus/Features/Home/UI/ViewModel/HomeViewModelContract.swift at 2024-03-11 18:41:36 +0000

//
//  HomeViewModel.swift
//  SeekPlus
//
//  Created by Shubham
//

import Cuckoo
@testable import SeekPlus

import Foundation






 class MockHomeViewModelContract: HomeViewModelContract, Cuckoo.ProtocolMock {
    
     typealias MocksType = HomeViewModelContract
    
     typealias Stubbing = __StubbingProxy_HomeViewModelContract
     typealias Verification = __VerificationProxy_HomeViewModelContract

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HomeViewModelContract?

     func enableDefaultImplementation(_ stub: HomeViewModelContract) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     var jobs: [JobApiModel] {
        get {
            return cuckoo_manager.getter("jobs",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.jobs)
        }
        
    }
    
    
    
    
    
     var activityIndicator: ActivityIndicatorEvent {
        get {
            return cuckoo_manager.getter("activityIndicator",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall:  __defaultImplStub!.activityIndicator)
        }
        
    }
    
    

    

    
    
    
    
     func loadData()  {
        
    return cuckoo_manager.call(
    """
    loadData()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.loadData())
        
    }
    
    
    
    
    
     func loadMoreData(currentItem job: JobApiModel)  {
        
    return cuckoo_manager.call(
    """
    loadMoreData(currentItem: JobApiModel)
    """,
            parameters: (job),
            escapingParameters: (job),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.loadMoreData(currentItem: job))
        
    }
    
    

     struct __StubbingProxy_HomeViewModelContract: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var jobs: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockHomeViewModelContract, [JobApiModel]> {
            return .init(manager: cuckoo_manager, name: "jobs")
        }
        
        
        
        
        var activityIndicator: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockHomeViewModelContract, ActivityIndicatorEvent> {
            return .init(manager: cuckoo_manager, name: "activityIndicator")
        }
        
        
        
        
        
        func loadData() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockHomeViewModelContract.self, method:
    """
    loadData()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func loadMoreData<M1: Cuckoo.Matchable>(currentItem job: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(JobApiModel)> where M1.MatchedType == JobApiModel {
            let matchers: [Cuckoo.ParameterMatcher<(JobApiModel)>] = [wrap(matchable: job) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockHomeViewModelContract.self, method:
    """
    loadMoreData(currentItem: JobApiModel)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_HomeViewModelContract: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var jobs: Cuckoo.VerifyReadOnlyProperty<[JobApiModel]> {
            return .init(manager: cuckoo_manager, name: "jobs", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var activityIndicator: Cuckoo.VerifyReadOnlyProperty<ActivityIndicatorEvent> {
            return .init(manager: cuckoo_manager, name: "activityIndicator", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func loadData() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    loadData()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func loadMoreData<M1: Cuckoo.Matchable>(currentItem job: M1) -> Cuckoo.__DoNotUse<(JobApiModel), Void> where M1.MatchedType == JobApiModel {
            let matchers: [Cuckoo.ParameterMatcher<(JobApiModel)>] = [wrap(matchable: job) { $0 }]
            return cuckoo_manager.verify(
    """
    loadMoreData(currentItem: JobApiModel)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class HomeViewModelContractStub: HomeViewModelContract {
    
    
    
    
     var jobs: [JobApiModel] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([JobApiModel]).self)
        }
        
    }
    
    
    
    
    
     var activityIndicator: ActivityIndicatorEvent {
        get {
            return DefaultValueRegistry.defaultValue(for: (ActivityIndicatorEvent).self)
        }
        
    }
    
    

    

    
    
    
    
     func loadData()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func loadMoreData(currentItem job: JobApiModel)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: SeekPlus/Features/JobDetails/Data/ApplyJob/ApplyJobServiceContract.swift at 2024-03-11 18:41:36 +0000

//
//  ApplyJobServiceContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Cuckoo
@testable import SeekPlus

import Combine






 class MockApplyJobServiceContract: ApplyJobServiceContract, Cuckoo.ProtocolMock {
    
     typealias MocksType = ApplyJobServiceContract
    
     typealias Stubbing = __StubbingProxy_ApplyJobServiceContract
     typealias Verification = __VerificationProxy_ApplyJobServiceContract

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ApplyJobServiceContract?

     func enableDefaultImplementation(_ stub: ApplyJobServiceContract) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func applyForJob(_ id: String) -> ApplyJobPublisher {
        
    return cuckoo_manager.call(
    """
    applyForJob(_: String) -> ApplyJobPublisher
    """,
            parameters: (id),
            escapingParameters: (id),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.applyForJob(id))
        
    }
    
    

     struct __StubbingProxy_ApplyJobServiceContract: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func applyForJob<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.ProtocolStubFunction<(String), ApplyJobPublisher> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockApplyJobServiceContract.self, method:
    """
    applyForJob(_: String) -> ApplyJobPublisher
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ApplyJobServiceContract: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func applyForJob<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.__DoNotUse<(String), ApplyJobPublisher> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return cuckoo_manager.verify(
    """
    applyForJob(_: String) -> ApplyJobPublisher
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ApplyJobServiceContractStub: ApplyJobServiceContract {
    

    

    
    
    
    
     func applyForJob(_ id: String) -> ApplyJobPublisher  {
        return DefaultValueRegistry.defaultValue(for: (ApplyJobPublisher).self)
    }
    
    
}





// MARK: - Mocks generated from file: SeekPlus/Features/JobDetails/Data/JobDetails/JobDetailsServiceContract.swift at 2024-03-11 18:41:36 +0000

//
//  JobDetailsServiceContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Cuckoo
@testable import SeekPlus

import Combine






 class MockJobDetailsServiceContract: JobDetailsServiceContract, Cuckoo.ProtocolMock {
    
     typealias MocksType = JobDetailsServiceContract
    
     typealias Stubbing = __StubbingProxy_JobDetailsServiceContract
     typealias Verification = __VerificationProxy_JobDetailsServiceContract

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: JobDetailsServiceContract?

     func enableDefaultImplementation(_ stub: JobDetailsServiceContract) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func getJobDetails(_ id: String) -> JobDetailsPublisher {
        
    return cuckoo_manager.call(
    """
    getJobDetails(_: String) -> JobDetailsPublisher
    """,
            parameters: (id),
            escapingParameters: (id),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getJobDetails(id))
        
    }
    
    

     struct __StubbingProxy_JobDetailsServiceContract: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func getJobDetails<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.ProtocolStubFunction<(String), JobDetailsPublisher> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockJobDetailsServiceContract.self, method:
    """
    getJobDetails(_: String) -> JobDetailsPublisher
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_JobDetailsServiceContract: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func getJobDetails<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.__DoNotUse<(String), JobDetailsPublisher> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return cuckoo_manager.verify(
    """
    getJobDetails(_: String) -> JobDetailsPublisher
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class JobDetailsServiceContractStub: JobDetailsServiceContract {
    

    

    
    
    
    
     func getJobDetails(_ id: String) -> JobDetailsPublisher  {
        return DefaultValueRegistry.defaultValue(for: (JobDetailsPublisher).self)
    }
    
    
}





// MARK: - Mocks generated from file: SeekPlus/Features/JobDetails/Domain/ApplyJob/ApplyJobInteractorContract.swift at 2024-03-11 18:41:36 +0000

//
//  ApplyJobInteractorContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Cuckoo
@testable import SeekPlus

import Combine






 class MockApplyJobInteractorContract: ApplyJobInteractorContract, Cuckoo.ProtocolMock {
    
     typealias MocksType = ApplyJobInteractorContract
    
     typealias Stubbing = __StubbingProxy_ApplyJobInteractorContract
     typealias Verification = __VerificationProxy_ApplyJobInteractorContract

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ApplyJobInteractorContract?

     func enableDefaultImplementation(_ stub: ApplyJobInteractorContract) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func applyForJob(_ id: String) -> ApplyJobPublisher {
        
    return cuckoo_manager.call(
    """
    applyForJob(_: String) -> ApplyJobPublisher
    """,
            parameters: (id),
            escapingParameters: (id),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.applyForJob(id))
        
    }
    
    

     struct __StubbingProxy_ApplyJobInteractorContract: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func applyForJob<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.ProtocolStubFunction<(String), ApplyJobPublisher> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockApplyJobInteractorContract.self, method:
    """
    applyForJob(_: String) -> ApplyJobPublisher
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ApplyJobInteractorContract: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func applyForJob<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.__DoNotUse<(String), ApplyJobPublisher> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return cuckoo_manager.verify(
    """
    applyForJob(_: String) -> ApplyJobPublisher
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ApplyJobInteractorContractStub: ApplyJobInteractorContract {
    

    

    
    
    
    
     func applyForJob(_ id: String) -> ApplyJobPublisher  {
        return DefaultValueRegistry.defaultValue(for: (ApplyJobPublisher).self)
    }
    
    
}





// MARK: - Mocks generated from file: SeekPlus/Features/JobDetails/Domain/JobDetails/JobDetailsInteractorContract.swift at 2024-03-11 18:41:36 +0000

//
//  JobDetailsInteractorContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Cuckoo
@testable import SeekPlus

import Combine






 class MockJobDetailsInteractorContract: JobDetailsInteractorContract, Cuckoo.ProtocolMock {
    
     typealias MocksType = JobDetailsInteractorContract
    
     typealias Stubbing = __StubbingProxy_JobDetailsInteractorContract
     typealias Verification = __VerificationProxy_JobDetailsInteractorContract

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: JobDetailsInteractorContract?

     func enableDefaultImplementation(_ stub: JobDetailsInteractorContract) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func getJobDetails(_ id: String) -> JobDetailsPublisher {
        
    return cuckoo_manager.call(
    """
    getJobDetails(_: String) -> JobDetailsPublisher
    """,
            parameters: (id),
            escapingParameters: (id),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getJobDetails(id))
        
    }
    
    

     struct __StubbingProxy_JobDetailsInteractorContract: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func getJobDetails<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.ProtocolStubFunction<(String), JobDetailsPublisher> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockJobDetailsInteractorContract.self, method:
    """
    getJobDetails(_: String) -> JobDetailsPublisher
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_JobDetailsInteractorContract: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func getJobDetails<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.__DoNotUse<(String), JobDetailsPublisher> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return cuckoo_manager.verify(
    """
    getJobDetails(_: String) -> JobDetailsPublisher
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class JobDetailsInteractorContractStub: JobDetailsInteractorContract {
    

    

    
    
    
    
     func getJobDetails(_ id: String) -> JobDetailsPublisher  {
        return DefaultValueRegistry.defaultValue(for: (JobDetailsPublisher).self)
    }
    
    
}





// MARK: - Mocks generated from file: SeekPlus/Features/Login/Data/LoginServiceContract.swift at 2024-03-11 18:41:36 +0000

//
//  LoginServiceContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Cuckoo
@testable import SeekPlus

import Combine






 class MockLoginServiceContract: LoginServiceContract, Cuckoo.ProtocolMock {
    
     typealias MocksType = LoginServiceContract
    
     typealias Stubbing = __StubbingProxy_LoginServiceContract
     typealias Verification = __VerificationProxy_LoginServiceContract

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: LoginServiceContract?

     func enableDefaultImplementation(_ stub: LoginServiceContract) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func login(_ userName: String, _ password: String) -> LoginPublisher {
        
    return cuckoo_manager.call(
    """
    login(_: String, _: String) -> LoginPublisher
    """,
            parameters: (userName, password),
            escapingParameters: (userName, password),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.login(userName, password))
        
    }
    
    

     struct __StubbingProxy_LoginServiceContract: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ userName: M1, _ password: M2) -> Cuckoo.ProtocolStubFunction<(String, String), LoginPublisher> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: userName) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginServiceContract.self, method:
    """
    login(_: String, _: String) -> LoginPublisher
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_LoginServiceContract: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ userName: M1, _ password: M2) -> Cuckoo.__DoNotUse<(String, String), LoginPublisher> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: userName) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return cuckoo_manager.verify(
    """
    login(_: String, _: String) -> LoginPublisher
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class LoginServiceContractStub: LoginServiceContract {
    

    

    
    
    
    
     func login(_ userName: String, _ password: String) -> LoginPublisher  {
        return DefaultValueRegistry.defaultValue(for: (LoginPublisher).self)
    }
    
    
}





// MARK: - Mocks generated from file: SeekPlus/Features/Login/Domain/LoginInteractorContract.swift at 2024-03-11 18:41:36 +0000

//
//  LoginInteractor.swift
//  SeekPlus
//
//  Created by Shubham
//

import Cuckoo
@testable import SeekPlus

import Combine






 class MockLoginInteractorContract: LoginInteractorContract, Cuckoo.ProtocolMock {
    
     typealias MocksType = LoginInteractorContract
    
     typealias Stubbing = __StubbingProxy_LoginInteractorContract
     typealias Verification = __VerificationProxy_LoginInteractorContract

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: LoginInteractorContract?

     func enableDefaultImplementation(_ stub: LoginInteractorContract) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func login(_ userName: String, _ password: String) -> LoginPublisher {
        
    return cuckoo_manager.call(
    """
    login(_: String, _: String) -> LoginPublisher
    """,
            parameters: (userName, password),
            escapingParameters: (userName, password),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.login(userName, password))
        
    }
    
    

     struct __StubbingProxy_LoginInteractorContract: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ userName: M1, _ password: M2) -> Cuckoo.ProtocolStubFunction<(String, String), LoginPublisher> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: userName) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLoginInteractorContract.self, method:
    """
    login(_: String, _: String) -> LoginPublisher
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_LoginInteractorContract: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ userName: M1, _ password: M2) -> Cuckoo.__DoNotUse<(String, String), LoginPublisher> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: userName) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return cuckoo_manager.verify(
    """
    login(_: String, _: String) -> LoginPublisher
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class LoginInteractorContractStub: LoginInteractorContract {
    

    

    
    
    
    
     func login(_ userName: String, _ password: String) -> LoginPublisher  {
        return DefaultValueRegistry.defaultValue(for: (LoginPublisher).self)
    }
    
    
}





// MARK: - Mocks generated from file: SeekPlus/NetworkService/NetworkProviderContract.swift at 2024-03-11 18:41:36 +0000

//
//  NetworkProviderContract.swift
//  SeekPlus
//
//  Created by Shubham
//

import Cuckoo
@testable import SeekPlus

import Apollo
import ApolloAPI






 class MockNetworkProviderContract: NetworkProviderContract, Cuckoo.ProtocolMock {
    
     typealias MocksType = NetworkProviderContract
    
     typealias Stubbing = __StubbingProxy_NetworkProviderContract
     typealias Verification = __VerificationProxy_NetworkProviderContract

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkProviderContract?

     func enableDefaultImplementation(_ stub: NetworkProviderContract) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func fetch<Query: GraphQLQuery>(query: Query, resultHandler: GraphQLResultHandler<Query.Data>?) -> Apollo.Cancellable? {
        
    return cuckoo_manager.call(
    """
    fetch(query: Query, resultHandler: GraphQLResultHandler<Query.Data>?) -> Apollo.Cancellable?
    """,
            parameters: (query, resultHandler),
            escapingParameters: (query, resultHandler),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetch(query: query, resultHandler: resultHandler))
        
    }
    
    
    
    
    
     func perform<Mutation: GraphQLMutation>(mutation: Mutation, resultHandler: GraphQLResultHandler<Mutation.Data>?) -> Apollo.Cancellable? {
        
    return cuckoo_manager.call(
    """
    perform(mutation: Mutation, resultHandler: GraphQLResultHandler<Mutation.Data>?) -> Apollo.Cancellable?
    """,
            parameters: (mutation, resultHandler),
            escapingParameters: (mutation, resultHandler),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.perform(mutation: mutation, resultHandler: resultHandler))
        
    }
    
    

     struct __StubbingProxy_NetworkProviderContract: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func fetch<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, Query: GraphQLQuery>(query: M1, resultHandler: M2) -> Cuckoo.ProtocolStubFunction<(Query, GraphQLResultHandler<Query.Data>?), Apollo.Cancellable?> where M1.MatchedType == Query, M2.OptionalMatchedType == GraphQLResultHandler<Query.Data> {
            let matchers: [Cuckoo.ParameterMatcher<(Query, GraphQLResultHandler<Query.Data>?)>] = [wrap(matchable: query) { $0.0 }, wrap(matchable: resultHandler) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockNetworkProviderContract.self, method:
    """
    fetch(query: Query, resultHandler: GraphQLResultHandler<Query.Data>?) -> Apollo.Cancellable?
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func perform<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, Mutation: GraphQLMutation>(mutation: M1, resultHandler: M2) -> Cuckoo.ProtocolStubFunction<(Mutation, GraphQLResultHandler<Mutation.Data>?), Apollo.Cancellable?> where M1.MatchedType == Mutation, M2.OptionalMatchedType == GraphQLResultHandler<Mutation.Data> {
            let matchers: [Cuckoo.ParameterMatcher<(Mutation, GraphQLResultHandler<Mutation.Data>?)>] = [wrap(matchable: mutation) { $0.0 }, wrap(matchable: resultHandler) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockNetworkProviderContract.self, method:
    """
    perform(mutation: Mutation, resultHandler: GraphQLResultHandler<Mutation.Data>?) -> Apollo.Cancellable?
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_NetworkProviderContract: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func fetch<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, Query: GraphQLQuery>(query: M1, resultHandler: M2) -> Cuckoo.__DoNotUse<(Query, GraphQLResultHandler<Query.Data>?), Apollo.Cancellable?> where M1.MatchedType == Query, M2.OptionalMatchedType == GraphQLResultHandler<Query.Data> {
            let matchers: [Cuckoo.ParameterMatcher<(Query, GraphQLResultHandler<Query.Data>?)>] = [wrap(matchable: query) { $0.0 }, wrap(matchable: resultHandler) { $0.1 }]
            return cuckoo_manager.verify(
    """
    fetch(query: Query, resultHandler: GraphQLResultHandler<Query.Data>?) -> Apollo.Cancellable?
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func perform<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, Mutation: GraphQLMutation>(mutation: M1, resultHandler: M2) -> Cuckoo.__DoNotUse<(Mutation, GraphQLResultHandler<Mutation.Data>?), Apollo.Cancellable?> where M1.MatchedType == Mutation, M2.OptionalMatchedType == GraphQLResultHandler<Mutation.Data> {
            let matchers: [Cuckoo.ParameterMatcher<(Mutation, GraphQLResultHandler<Mutation.Data>?)>] = [wrap(matchable: mutation) { $0.0 }, wrap(matchable: resultHandler) { $0.1 }]
            return cuckoo_manager.verify(
    """
    perform(mutation: Mutation, resultHandler: GraphQLResultHandler<Mutation.Data>?) -> Apollo.Cancellable?
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class NetworkProviderContractStub: NetworkProviderContract {
    

    

    
    
    
    
     func fetch<Query: GraphQLQuery>(query: Query, resultHandler: GraphQLResultHandler<Query.Data>?) -> Apollo.Cancellable?  {
        return DefaultValueRegistry.defaultValue(for: (Apollo.Cancellable?).self)
    }
    
    
    
    
    
     func perform<Mutation: GraphQLMutation>(mutation: Mutation, resultHandler: GraphQLResultHandler<Mutation.Data>?) -> Apollo.Cancellable?  {
        return DefaultValueRegistry.defaultValue(for: (Apollo.Cancellable?).self)
    }
    
    
}




