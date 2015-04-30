//
//  Stack.h
//  RM LocationReminder
//
//  Created by Randy McLain on 4/27/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//  borrowed format from codeproject.com (Cloud Hsu)

#import <Foundation/Foundation.h>

@interface Stack : NSObject {
  
  NSMutableArray *theStack;
  long count;
}

-(void)push: (id)theObject;
-(NSObject *)pop;
-(void)clear;

@property (nonatomic, readonly) long count;

@end
