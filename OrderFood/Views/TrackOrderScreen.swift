//
//  TrackOrderScreen.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 14/10/24.
//

import SwiftUI

enum TrackOrderView: String, CaseIterable {
    case orderTaken = "Order Taken"
    case orderPreparing = "Order Is Being Prepared"
    case orderDelivering = "Order Is Being Delivered"
    case orderReceived = "Order Received"
    
    var image: ImageResource {
        switch self {
        case .orderTaken:
            return .icOrderTaken
        case .orderPreparing:
            return  .icOrderPrepare
        case .orderDelivering:
            return  .icOrderDelivering
        case .orderReceived:
            return .icOrderDelivered
        }
    }
    
    var subImage: ImageResource {
        switch self {
        case .orderTaken, .orderPreparing:
            return .icOrderCompleted
        case .orderDelivering:
            return  .icOrderCall
        case .orderReceived:
            return .icOrderRecieved
        }
    }
    
    var backGroundColor: Color {
        switch self {
        case .orderTaken:
            return .FFFAEB
        case .orderPreparing:
            return  .F_1_EFF_6
        case .orderDelivering:
            return  .FEF_0_F_0
        case .orderReceived:
            return .F_0_FEF_8
        }
    }
    
    var subTitle: String {
        switch self {
        case .orderTaken, .orderPreparing, .orderReceived:
            return ""
        case .orderDelivering:
            return  "Your delivery agent is coming"
    
        }
    }
    
}

struct TrackOrderScreen: View {
    
    var statusArray: [TrackOrderView] = TrackOrderView.allCases
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<statusArray.count, id: \.self) { index in
                    let status = statusArray[index]
                    TrackOrderStatusView(status: status, isLast: index == (statusArray.count-1))
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    TrackOrderScreen()
}

struct TrackOrderStatusView: View {
    
    var status: TrackOrderView = .orderTaken
    var isLast: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 16) {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(status.backGroundColor)
                        .frame(width: 65, height: 65)
                    
                    Image(status.image)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(status.rawValue)
                        .font(.system(size: 16, weight: .medium))
                    
                    if !status.subTitle.isEmpty {
                        Text(status.subTitle)
                            .font(.system(size: 14))
                    }
                    
                }
                Spacer()
                Image(status.subImage)
                    .scaledToFit()
                
            }
            
            if !isLast {
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [4, 4]))
                    .frame(width: 1, height: 50)
                    .foregroundStyle(.FFA_451)
                    .padding(.leading, 32)
            }
            
        }
        
    }
}

#Preview {
    TrackOrderStatusView()
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
}
