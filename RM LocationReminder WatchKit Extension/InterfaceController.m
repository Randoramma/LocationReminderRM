//
//  InterfaceController.m
//  RM LocationReminder WatchKit Extension
//
//  Created by Randy McLain on 4/30/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

#import "InterfaceController.h"
#import "RegionRowController.h"
#import <CoreLocation/CoreLocation.h>


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceButton *regionButton;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



