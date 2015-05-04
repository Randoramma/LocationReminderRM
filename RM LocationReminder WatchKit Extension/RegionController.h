//
//  RegionController.h
//  RM LocationReminder
//
//  Created by Randy McLain on 5/3/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import <CoreLocation/CoreLocation.h>

@interface RegionController : WKInterfaceController

// our strong reference to the locationManager object.
@property (strong, nonatomic) CLLocationManager *locationManager;

-(void) willActivate;

- (void) didDeactivate;

@end
