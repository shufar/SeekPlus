//
//  HomeView.swift
//  SeekPlus
//
//  Created by Shubham
//

import Swinject
import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeViewModel: HomeViewModel
    @State private var searchText = ""
    @State private var isEditingInSearchBar: Bool = false

    private let assembler: Assembler = Assembler([JobDetailsAssembly()],
                                                 container: AppDelegate.baseContainer)

    private var searchResults: [JobApiModel] {
        if searchText.isEmpty {
            return homeViewModel.jobs
        } else {
            return homeViewModel.jobs.filter { $0.positionTitle.contains(searchText) }
        }
    }

    init(homeViewModel: HomeViewModelContract) {
        self.homeViewModel = homeViewModel as! HomeViewModel // swiftlint:disable:this force_cast
    }

    var body: some View {
        NavigationStack {
            headerWithSearchBarView
            jobCardsView
        }
        .background(AppColor.backgroundSecondary.color)
        .activityIndicator(homeViewModel.activityIndicator.value)
        .task {
            self.homeViewModel.loadData()
        }
    }
}

private extension HomeView {
    var headerWithSearchBarView: some View {
        VStack(alignment: .leading, spacing: Margin.large.value) {
            Text("Hello Seeker")
                .textStyle(TextAttributes(weight: .bold, color: AppColor.white.color))

            HStack(alignment: .center, spacing: Margin.half.value) {
                Image(systemName: "magnifyingglass")
                    .configurableImageStyle(
                        ImageAttributes(foregroundColor: AppColor.white.color,
                                        size: CGSize(width: ImageSize.large.value,
                                                     height: ImageSize.large.value),
                                        animate: true))
                    .padding(Margin.half.value)

                TextField("Start your job search",
                          text: $searchText,
                          onEditingChanged: { isEditingInSearchBar = $0 })
                .textContentType(.none)
                .textFieldStyle(DefaultTextFieldStyle(isEditing: isEditingInSearchBar, .searchBar))
                .submitLabel(.search)
                .background(AppColor.white.color)
                .frame(maxWidth: .infinity)
            }
            .frame(height: 48)
            .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(AppColor.backgroundBrand.color)
    }

    var jobCardsView: some View {
        VStack(alignment: .leading, spacing: Margin.zero.value) {
            List {
                ForEach(searchResults) { job in
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
                        .onAppear(perform: {
                            self.homeViewModel.loadMoreData(currentItem: job)
                        })
                }
            }
            .listStyle(.plain)
        }
    }
}

// #Preview {
//    let homeViewModel = HomeViewModel(jobs: <#T##Jobs#>)
//    HomeView(homeViewModel: <#HomeViewModelContract#>)
// }
