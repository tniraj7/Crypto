import SwiftUI
import UIKit

struct LineChartController: UIViewRepresentable {
    
    func updateUIView(_ uiView: LineChart, context: UIViewRepresentableContext<LineChartController>) {
        
    }
    
    func makeUIView(context: Context) -> LineChart {
        let lineChart = LineChart()
        lineChart.addLine([3,4,2,1,6,5])
        return lineChart
        
    }
}
