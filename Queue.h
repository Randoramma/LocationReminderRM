//
//  Queue.h
//  RM LocationReminder
//
//  Created by Randy McLain on 4/27/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSMutableArray
  - (id) dequeue;
  - (void) enqueue: (id)obj;
  - (void) clear;
@end
