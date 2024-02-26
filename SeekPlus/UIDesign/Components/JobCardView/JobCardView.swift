//
//  JobCardView.swift
//  SeekPlus
//
//  Created by Shubham
//

import SwiftUI

struct JobCardView: View {
    @State var content: JobCardContent

    var body: some View {
        VStack(alignment: .leading, spacing: Margin.zero.value) {
            headerView
            Spacer().frame(height: Margin.xLarge.value)
            detailsView
        }
        .padding(Margin.default.value)
        .backgroundStyle()
    }
}

private extension JobCardView {
    var headerView: some View {
        HStack(alignment: .top,
                spacing: Margin.half.value) {

            // Title and subtitle
            VStack(alignment: .leading,
                   spacing: Margin.zero.value) {
                Text(content.jobTitle)
                    .textStyle(TextAttributes(style: .title2,
                                              weight: .bold))

                if !content.companyTitle.isEmpty {
                    Spacer().frame(height: Margin.half.value)

                    Text(content.companyTitle)
                        .textStyle(TextAttributes(style: .title3,
                                                  color: AppColor.textSecondary.color))
                }
            }

            Spacer()

            if content.applied {
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

    var detailsView: some View {
        VStack(alignment: .leading,
               spacing: Margin.zero.value) {
            Text(content.description)
                .textStyle(TextAttributes(style: .body))
        }
    }
}

struct JobCard_Preview: View {
    let content = JobCardContent(jobTitle: "JobTitle potentially spanning 2 lines",
                                 companyTitle: "CompanyTitle",
                                 description: "Fancy multiline description about a very nice profile which contains overview about the job posting", // swiftlint:disable:this line_length
                                 applied: true)

    var body: some View {
        JobCardView(content: content)
            .padding()
    }
}

#Preview {
    JobCard_Preview()
}
