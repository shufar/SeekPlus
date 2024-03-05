//
//  JobDetailsView.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct JobDetailsView<ViewModel>: View where ViewModel: JobDetailsViewModel {
    @ObservedObject private var jobDetailsViewModel: ViewModel
    private let jobId: String

    init(_ jobId: String, _ jobDetailsViewModel: any JobDetailsViewModelContract) {
        self.jobId = jobId
        self.jobDetailsViewModel = jobDetailsViewModel as! ViewModel // swiftlint:disable:this force_cast
    }

    var body: some View {
        contentView
            .padding()
            .toolbarBackground(AppColor.backgroundBrand.color, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { navigationHeaderView }
            }
            .activityIndicator(jobDetailsViewModel.activityIndicator.value)
            .task {
                jobDetailsViewModel.loadData(jobId)
            }
            .onChange(of: jobDetailsViewModel.isJobAppliedSuccessfully) { _, newValue in
                if newValue == true {
                    jobDetailsViewModel.loadData(jobId)
                }
            }
    }
}

private extension JobDetailsView {
    var contentView: some View {
        VStack(alignment: .center, spacing: Margin.zero.value) {
            ScrollView {
                VStack(alignment: .leading, spacing: Margin.zero.value) {
                    headerView

                    Spacer().frame(height: Margin.xLarge.value)
                    Divider().foregroundColor(AppColor.backgroundSecondary.color)
                    Spacer().frame(height: Margin.xLarge.value)

                    infoView

                    Spacer().frame(height: Margin.xLarge.value)
                    Divider().foregroundColor(AppColor.backgroundSecondary.color)
                    Spacer().frame(height: Margin.xLarge.value)

                    detailsView

                    Spacer().frame(minHeight: Margin.half.value)

                }.padding(Margin.half.value)
            }

            Spacer().frame(height: Margin.default.value)

            VStack(alignment: .center, spacing: Margin.zero.value) {
                applyView
            }.frame(maxWidth: .infinity)
                .padding(.top, Margin.half.rawValue)
        }
    }

    var headerView: some View {
        HStack(alignment: .top,
               spacing: Margin.half.value) {

            // Title and subtitle
            VStack(alignment: .leading,
                   spacing: Margin.zero.value) {
                Text(jobDetailsViewModel.jobDetails.jobTitle)
                    .textStyle(TextAttributes(style: .largeTitle,
                                              weight: .bold))

                Spacer().frame(height: Margin.half.value)

                Text(jobDetailsViewModel.jobDetails.companyTitle)
                    .textStyle(TextAttributes(style: .title,
                                              color: AppColor.textSecondary.color))

            }

            Spacer()

            if jobDetailsViewModel.jobDetails.applied {
                Image(systemName: "checkmark.circle")
                    .configurableImageStyle(
                        ImageAttributes(foregroundColor:
                                            AppColor.positive.color,
                                        size: CGSize(width: ImageSize.xLarge.value,
                                                     height: ImageSize.xLarge.value),
                                        animate: true))
                    .padding([.top, .trailing], Margin.default.value)
            }
        }
    }

    var infoView: some View {
        VStack(alignment: .leading,
               spacing: Margin.zero.value) {
            HStack(alignment: .center,
                   spacing: Margin.xLarge.value) {
                Image(systemName: "mappin")
                    .configurableImageStyle(
                        ImageAttributes(foregroundColor: AppColor.buttonSecondry.color,
                                        size: CGSize(width: ImageSize.large.value,
                                                     height: ImageSize.large.value)))
                Text(jobDetailsViewModel.jobDetails.location)
                    .textStyle(TextAttributes(style: .title3,
                                              color: AppColor.textSecondary.color))
            }

            Spacer().frame(height: Margin.large.value)

            HStack(alignment: .center,
                   spacing: Margin.xLarge.value) {
                Image(systemName: "clock")
                    .configurableImageStyle(
                        ImageAttributes(foregroundColor: AppColor.buttonSecondry.color,
                                        size: CGSize(width: ImageSize.large.value,
                                                     height: ImageSize.large.value)))
                Text(jobDetailsViewModel.jobDetails.type)
                    .textStyle(TextAttributes(style: .title3,
                                              color: AppColor.textSecondary.color))
            }

            Spacer().frame(height: Margin.large.value)

            HStack(alignment: .center,
                   spacing: Margin.xLarge.value) {
                Image(systemName: "dollarsign")
                    .configurableImageStyle(
                        ImageAttributes(foregroundColor: AppColor.buttonSecondry.color,
                                        size: CGSize(width: ImageSize.large.value,
                                                     height: ImageSize.large.value)))
                Text(jobDetailsViewModel.jobDetails.payRange)
                    .textStyle(TextAttributes(style: .title3,
                                              color: AppColor.textSecondary.color))
            }
        }
    }

    var detailsView: some View {
        VStack(alignment: .leading,
               spacing: Margin.zero.value) {
            Text("About Us")
                .textStyle(TextAttributes(style: .title2,
                                          weight: .bold))

            Spacer().frame(height: Margin.xLarge.value)

            Text(jobDetailsViewModel.jobDetails.description)
                .textStyle(TextAttributes(style: .title3,
                                          color: AppColor.textPrimary.color,
                                          lineLimit: nil))
        }
    }

    var applyView: some View {
        VStack(alignment: .leading,
               spacing: Margin.zero.value) {
            Button(action: { self.jobDetailsViewModel.applyForJob(self.jobId) },
                   label: {
                if jobDetailsViewModel.jobDetails.applied {
                    HStack(alignment: .center, spacing: Margin.large.rawValue) {
                        Image(systemName: "checkmark.circle")
                            .configurableImageStyle(
                                ImageAttributes(foregroundColor: AppColor.positive.color,
                                                size: CGSize(width: ImageSize.xLarge.value,
                                                             height: ImageSize.xLarge.value)))
                        Text("Applied")
                    }
                } else {
                    Text("Apply")
                        .frame(maxWidth: .infinity)
                }
            })
            .buttonStyle(
                jobDetailsViewModel.jobDetails.applied
                ? ConfigurableButtonStyle(ButtonAttributes.tertiaryButton)
                : ConfigurableButtonStyle(ButtonAttributes.defaultButton)
            )
            .disabled(jobDetailsViewModel.jobDetails.applied)
        }
    }

    var navigationHeaderView: some View {
        VStack {
            Text(jobDetailsViewModel.jobDetails.jobTitle)
                .textStyle(TextAttributes(style: .headline,
                                          color: AppColor.white.color))
            Text(jobDetailsViewModel.jobDetails.companyTitle)
                .textStyle(TextAttributes(style: .subheadline,
                                          color: AppColor.white.color))
            Spacer().frame(height: 8)
        }
    }
}

// struct JobDetail_Preview: View {
//    let content = JobDetailsContent(jobTitle: "JobTitle",
//                                    companyTitle: "CompanyTitle",
//                                    location: "Petaling Jaya, Selangor",
//                                    type: "Hybrid",
//                                    payRange: "MYR 10K - MYR 15K",
//                                    description: "Fancy multiline description about a very nice profile which contains overview about the job posting.\n\nFancy multiline description about a very nice profile which contains overview about the job posting.\n\nFancy multiline description about a very nice profile which contains overview about the job posting.\n\nFancy multiline description about a very nice profile which contains overview about the job posting.",
//                                    applied: false)
//
//    var body: some View {
//        JobDetailsView(content)
//                    .padding()
//    }
// }
//
// #Preview {
//    JobDetail_Preview()
// }
