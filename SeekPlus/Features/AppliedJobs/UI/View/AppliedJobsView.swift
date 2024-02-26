//
//  AppliedJobsView.swift
//  SeekPlus
//
//  Created by Shubham
//

import Swinject
import SwiftUI

struct AppliedJobsView<ViewModel>: View where ViewModel: AppliedJobsViewModel {
    @ObservedObject private var appliedJobsViewModel: ViewModel
    @State private var showPlaceholderView: Bool = false

    private let assembler: Assembler = Assembler([JobDetailsAssembly()],
                                                 container: AppDelegate.baseContainer)

    init(appliedJobsViewModel: any AppliedJobsViewModelContract) {
        self.appliedJobsViewModel = appliedJobsViewModel as! ViewModel // swiftlint:disable:this force_cast
    }

    var body: some View {
        NavigationStack {
            navigationHeaderView
            if showPlaceholderView {
                placeholderView
            } else {
                appliedJobCardsView
            }
        }
    }
}

private extension AppliedJobsView {
    var navigationHeaderView: some View {
        VStack {
            Text("Applied jobs")
                .textStyle(TextAttributes(weight: .bold,
                                          color: AppColor.white.color))
            Spacer().frame(height: Margin.default.value)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(AppColor.backgroundBrand.color)
    }

    var placeholderView: some View {
        VStack(alignment: .center, spacing: .zero) {
            Spacer()
            Image(systemName: "bookmark")
                .configurableImageStyle(.large)
            Spacer().frame(height: Margin.large.value)
            Text("No activity. Please search and apply for jobs.")
                .textStyle(TextAttributes(style: .title2))
            Spacer()
        }
        .padding()
    }

    var appliedJobCardsView: some View {
        VStack(alignment: .leading, spacing: Margin.zero.value) {
            List {
                ForEach(appliedJobsViewModel.appliedJobs) { job in
                    let jobCardContent = JobCardContent(from: job)

                    JobCardView(content: jobCardContent)
                        .background(

                            NavigationLink("", destination: JobDetailsView(job.id,
                                                                           assembler.resolver
                                .resolve((any JobDetailsViewModelContract).self)!))
                        )
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: Margin.default.value,
                                             leading: Margin.large.value,
                                             bottom: Margin.half.value,
                                             trailing: Margin.large.value))
                        .listRowBackground(AppColor.backgroundSecondary.color)
                }
            }
            .listStyle(.plain)
        }.task {
            self.appliedJobsViewModel.loadData()
        }.onChange(of: appliedJobsViewModel.appliedJobs) { oldValue, newValue in
            if oldValue.isEmpty, newValue.isEmpty {
                showPlaceholderView = true
            } else {
                showPlaceholderView = false
            }
        }
    }
}

// #Preview {
//    AppliedJobsView()
// }
