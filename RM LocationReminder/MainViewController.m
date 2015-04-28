//
//  MainViewController.m
//  RM LocationReminder
//
//  Created by Randy McLain on 4/27/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

#import "MainViewController.h"
#import <MapKit/MapKit.h>

@interface MainViewController ()
@property (strong, nonatomic) IBOutlet UIView *myMainView;
@property (weak, nonatomic) IBOutlet MKMapView *myMainMapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *myButton1;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *myButton2;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *myButton3;

#define METERS_PER_MILE 1609.344


@end

@implementation MainViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
}

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
  // Dispose of any resources that can be recreated.
}





@end
