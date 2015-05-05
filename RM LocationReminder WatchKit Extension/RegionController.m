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
@property (strong, nonatomic) NSArray *regions;

@end

@implementation RegionController

-(void)awakeWithContext:(id)context {
  
  CLLocationManager *manager = [[CLLocationManager alloc] init];
  
  self.regions = manager.monitoredRegions.allObjects;
  [self.regionTable setNumberOfRows:self.regions.count withRowType:@"regionRowType"];
  
  for (CLCircularRegion *theRegion in self.regions) {
    
    NSInteger theIndex = [self.regions indexOfObject:theRegion];
    RegionRowController *regionController= [self.regionTable rowControllerAtIndex:theIndex];
    regionController.regionLabel.text = theRegion.identifier;
  }
  
  [WKInterfaceController openParentApplication:nil reply:^(NSDictionary *replyInfo, NSError *error) {
    
  }];
  
} // awakeWithContext

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
  
    [self pushControllerWithName:@"MapViewController" context:(self.regions[rowIndex])];

}

//-(id) contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
//  
//  
//  NSLog(@"%@", segueIdentifier);
//  // look for segue
//  if ([segueIdentifier  isEqualToString:@"selectedRow" ]) {
//    
//    return self.regions[rowIndex];
//  } else {
//    return nil;
//  }
//}

- (void) willActivate {
  [super willActivate];

}

-(void) didDeactivate {
  
  
}

@end
