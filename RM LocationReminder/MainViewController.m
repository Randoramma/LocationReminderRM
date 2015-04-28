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

@end

@implementation MainViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
