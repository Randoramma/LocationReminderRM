//
//  MapDetailController.m
//  RM LocationReminder
//
//  Created by Randy McLain on 5/3/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

#import "MapDetailController.h"
#import <WatchKit/WatchKit.h>

@interface MapDetailController ()

@property (weak, nonatomic) IBOutlet WKInterfaceMap *mapDetail;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *mapLabel;

@end

@implementation MapDetailController: WKInterfaceController

-(void)awakeWithContext:(id)context {
  CLRegion *theRegion = context;
  
  [self.mapLabel setText:theRegion.identifier];
  
  
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(theRegion.center, 500.0, 500.0);

  [self.mapDetail setRegion:region];
}

-(void)willActivate {

}

@end
