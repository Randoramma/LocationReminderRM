//
//  MainViewController.m
//  RM LocationReminder
//
//  Created by Randy McLain on 4/27/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

#import "MainViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "AppDelegate.h"
#import "AddRegionViewController.h"

@interface MainViewController () <CLLocationManagerDelegate, MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *myMainView;
@property (weak, nonatomic) IBOutlet MKMapView *myMainMapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *myButton1;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *myButton2;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *myButton3;

// our strong reference to the locationManager object.
@property (strong, nonatomic) CLLocationManager *locationManager;

#define METERS_PER_MILE 1609.344


@end

@implementation MainViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // instantiation of CLLocation manager.
  self.locationManager = [[CLLocationManager alloc]init];
  // become the delegate.
  self.locationManager.delegate = self;
  self.myMainMapView.delegate = self;
  
  // register the VC as the Notifications Center observer. We will recieve every notification with "RegionAdded:"
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(regionAdded:) name:@"RegionAdded" object:nil];
  
  // check authorization status if available.
  if ([CLLocationManager locationServicesEnabled]) {
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
      [self.locationManager requestAlwaysAuthorization];
      self.myMainMapView.showsUserLocation = true;
    }
  }
  
  //MARK:
  //MARK: - Button Actions
  UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
  
  [self.myMainMapView addGestureRecognizer:longPress];
} // viewDidLoad

- (void)viewWillAppear:(BOOL) animated {
  CLLocationCoordinate2D seattleLocation;
  seattleLocation.latitude = 47.60;
  seattleLocation.longitude = -122.33;
  
  MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(seattleLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);

  [_myMainMapView setRegion: viewRegion animated: YES];
  
}
- (IBAction)button1Pressed:(id)sender {
  CLLocationCoordinate2D appleLocation;
  appleLocation.latitude = 37.3317;
  appleLocation.longitude = -122.03033;
  MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(appleLocation, 0.25*METERS_PER_MILE, 0.25*METERS_PER_MILE);
  
  [_myMainMapView setRegion: viewRegion animated: YES];
}

- (IBAction)button2Pressed:(id)sender {
  CLLocationCoordinate2D lhcLocation;
  lhcLocation.latitude = 46.23;
  lhcLocation.longitude = 6.05;
  MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(lhcLocation, 3*METERS_PER_MILE, 3*METERS_PER_MILE);
  
  [_myMainMapView setRegion: viewRegion animated: YES];
  
}

- (IBAction)button3Pressed:(id)sender {
  CLLocationCoordinate2D piLocation;
  piLocation.latitude = 25.12;
  piLocation.longitude = 55.13;
  MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(piLocation, 4*METERS_PER_MILE, 4*METERS_PER_MILE);
  
  [_myMainMapView setRegion: viewRegion animated: YES];

}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}


//MARK:
//MARK: Location Manager
// adssigned to wait for user to allow access to location finder before revealing status on map.
-(void)locationManager: (CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
  if (status == kCLAuthorizationStatusAuthorizedAlways) {
    self.myMainMapView.showsUserLocation = true;
   // [self.locationManager startMonitoringSignificantLocationChanges];
    
  } else {
    
    NSString *title = @"no Access Granted";
    NSString *message = @"You have denied this app from accessing your location.  To use this app, please grant access and reload the app.";
    
    UIAlertController *noAccessAlert= [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:noAccessAlert animated:YES completion:^{
      nil;
    }];
  } // didChangeAuthorizationStatus

  UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
  [self.myMainMapView addGestureRecognizer:longPress];
} // init



- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
  NSLog(@"entered region");
}

//MARK:
//MARK: UI Gesture Recoginzer


-(void)handleLongPress:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  CLLocation *firstLocation = locations.firstObject;
  NSLog(@"%f, %f", firstLocation.coordinate.latitude, firstLocation.coordinate.longitude);
  
} // didUpdateLocations

-(void) handleLongPress: (UILongPressGestureRecognizer *)longPress {
  
  if (longPress.state == UIGestureRecognizerStateBegan) {
  CGPoint locationInMap = [longPress locationInView:self.myMainMapView];
  [self.myMainMapView convertPoint:locationInMap toCoordinateFromView:self.myMainMapView];
  
  CLLocationCoordinate2D coordinate = [self.myMainMapView convertPoint:locationInMap toCoordinateFromView:self.myMainMapView];
//  NSLog(@"%f, %f", coordinate.latitude, coordinate.longitude);
//
  NSString *lat = [NSString stringWithFormat:@"%1.2f", coordinate.latitude];
  NSString *lng = [NSString stringWithFormat:@"%1.2f", coordinate.longitude];

    NSMutableString *theTitle = [NSMutableString string];
  [theTitle appendString:@"This coord is: lat= "];
  [theTitle appendString:lat];
  [theTitle appendString:@" long= "];
  [theTitle appendString:lng];
   // NSLog(@"%@", theTitle);
  
  MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
  annotation.coordinate = coordinate;
  annotation.title = theTitle;
  
  [self.myMainMapView addAnnotation:annotation];
  }
} // handleLongPress

//MARK:
//MARK: MapView
-(MKAnnotationView *)mapView: (MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  
  if ([annotation isKindOfClass:[MKUserLocation class]]) {
    return nil;

  } // viewForAnnotation
  
  MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"AnnotationView"];
  
  if (!pinView) {
    pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationView"];
    pinView.pinColor = MKPinAnnotationColorGreen;
    pinView.animatesDrop = true;
    pinView.canShowCallout = true;
    pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    pinView.draggable = true;
    
  } else {
    pinView.annotation = annotation;
  }
  return pinView;
} // viewForAnnotation

-(void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState {
  
} // didChangeDragState

-(void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
  NSLog(@"pressed");
  // provide the coordinate for the VC.
  CLLocationCoordinate2D coordinate = [view.annotation coordinate];
  // add the controller to the stack.
  AddRegionViewController *addRegionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AddRegionVC"];
  // must add the coordinate to the region.
  addRegionVC.coordinate = coordinate;
  // must store the VC into the locationManager.
  addRegionVC.locationManager = self.locationManager;
  
  [self presentViewController:addRegionVC animated:YES completion:^{
    nil;
  }];
  
} // calloutAccessoryControlTapped

//MARK:
//MARK: Notification Center
// the region to be added.
-(void) regionAdded: (NSNotification *)notification {
  
} // regionAdded

// best practice: when you add a notification to the observer you need to remove yourself as observer.
- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
} // dealloc

@end
