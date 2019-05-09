//
//  DetailViewController.swift
//  ToDoApp
//
//  Created by Sergey on 09/05/2019.
//  Copyright © 2019 PyrovSergey. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var task: Task!
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = task.title
        descriptionLabel.text = task.description
        locationLabel.text = task.location?.name
        dateLabel.text = formatDate(date: task.date)
        if let coordinate = task.location?.coordinate {
            let region = MKCoordinateRegion(center: coordinate,
                                            latitudinalMeters: 100,
                                            longitudinalMeters: 100)
            mapView.region = region
        }

    }
    
    private func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
