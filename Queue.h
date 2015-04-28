//
//  Queue.h
//  RM LocationReminder
//
//  Created by Randy McLain on 4/27/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSData {
  
  NSMutableArray *theQueue;
  long count;
}
-(void)add: (NSObject *)theObject;
-(NSObject *) remove;
-(void)clear;

@property (nonatomic, readonly) long count;
@end
