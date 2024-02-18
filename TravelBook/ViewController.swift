import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        // Độ chính xác mong muốn
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // Xin phép người dùng vị trí của họ
        locationManager.requestWhenInUseAuthorization()
        // Bắt đầu cập nhật vị trí
        locationManager.startUpdatingLocation()
    }

    // Hàm lấy vị trí của người dùng
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Bảo vệ trước vị trí trống
        guard let location = locations.first else {
            return
        }
        
        // Tạo coordinate từ vị trí được cập nhật
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        // Tạo span cho map
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        // Tạo region cho map
        let region = MKCoordinateRegion(center: coordinate, span: span)
        // Set region cho map
        mapView.setRegion(region, animated: true)
    }
}
