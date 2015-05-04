//
//  RegionController.m
//  RM LocationReminder
//
//  Created by Randy McLain on 5/3/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

#import "RegionController.h"
#import "RegionRowController.h"
@interface RegionController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *regionTable;
@property (weak, nonatomic) NSArray *regions;

@end

@implementation RegionController

-(void)awakeWithContext:(id)context {

  CLLocationManager *manager = [[CLLocationManager alloc] init];
  
  self.regions = manager.monitoredRegions.allObjects;
  [self.regionTable setNumberOfRows:self.regions.count withRowType:@"regionRowType"];
  
  for (CLRegion *theRegion in self.regions) {
    
    NSInteger theIndex = [self.regions indexOfObject:theRegion];
    RegionRowController *regionController= [self.regionTable rowControllerAtIndex:theIndex];
    regionController.regionLabel.text = theRegion.identifier;
  }
  
  [WKInterfaceController openParentApplication:nil reply:^(NSDictionary *replyInfo, NSError *error) {
    
  }];
  
} // awakeWithContext

- (void) willActivate {
  [super willActivate];
}

-(void) didDeactivate {
  
}

@end
