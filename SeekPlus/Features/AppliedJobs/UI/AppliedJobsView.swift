//
//  AppliedJobsView.swift
//  SeekPlus
//
//  Created by Shubh on 22/02/2024.
//

import SwiftUI

struct AppliedJobsView: View {
    var body: some View {
        Text("List of applied jobs")
            .textStyle(TextAttributes(style: .title,
                                      weight: .bold,
                                      color: AppColor.textSecondary.color))
    }
}

#Preview {
    AppliedJobsView()
}
