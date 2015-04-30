//
//  AddRegionViewController.h
//  RM LocationReminder
//
//  Created by Randy McLain on 4/30/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AddRegionViewController : UIViewController

// property to be passed from mainVC.  
@property (nonatomic) CLLocationCoordinate2D coordinate;
// how we access the manager while in the background.  
@property (strong,nonatomic) CLLocationManager *locationManager;

@end
