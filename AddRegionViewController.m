//
//  AddRegionViewController.m
//  RM LocationReminder
//
//  Created by Randy McLain on 4/30/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

#import "AddRegionViewController.h"

@interface AddRegionViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *addRegionTextField;


@end

@implementation AddRegionViewController
const int theRegionRadius= 200;

- (void)viewDidLoad {
  [super viewDidLoad];
  // text field delegate set.  This VC is where the data is sent.
  self.addRegionTextField.delegate = self;
  
}
// to release the keyboard (must become the delegate too!
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return true;
}

- (IBAction)addRegionButtonPressed:(id)sender {
  
  NSLog(@"button pressed!");
  // if the region is being monitored currently.
  if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
    
    // instantiate region (center - radius - identifier).
    CLCircularRegion *theRegion = [[CLCircularRegion alloc] initWithCenter:self.coordinate radius:theRegionRadius identifier:self.addRegionTextField.text];
    // begin monitoring the abstract region.
    [self.locationManager startMonitoringForRegion:theRegion];
    
    NSDictionary *userInfo = @{@"coordinates": theRegion};
    // will post the notification from notification Center.
    [[NSNotificationCenter defaultCenter] postNotificationName:@"regionAdded:" object:self userInfo:userInfo];
    NSLog(@"region added from home!");
    // release the VC.
    [self dismissViewControllerAnimated:true completion:nil];
  } // if
} // addRegionButtonPressed



- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
