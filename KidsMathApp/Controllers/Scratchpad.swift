import UIKit
import PencilKit

func attachScratchpad(into container: UIView) -> PKCanvasView {
    let canvas = PKCanvasView(frame: container.bounds)
    canvas.translatesAutoresizingMaskIntoConstraints = false
    container.addSubview(canvas)
    NSLayoutConstraint.activate([
        canvas.leadingAnchor.constraint(equalTo: container.leadingAnchor),
        canvas.trailingAnchor.constraint(equalTo: container.trailingAnchor),
        canvas.topAnchor.constraint(equalTo: container.topAnchor),
        canvas.bottomAnchor.constraint(equalTo: container.bottomAnchor)
    ])
    canvas.drawingPolicy = .anyInput
    canvas.tool = PKInkingTool(.pen, width: 6)
    return canvas
}

