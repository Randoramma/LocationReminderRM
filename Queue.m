//
//  Queue.m
//  RM LocationReminder
//
//  Created by Randy McLain on 4/27/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
// adapted from http://stackoverflow.com/questions/817469/how-do-i-make-and-use-a-queue-in-objective-c

#import "Queue.h"

@implementation Queue: NSMutableArray

- (id) dequeue {
  // if ([self count] == 0) return nil; // to avoid raising exception
  id headObject = [self objectAtIndex:0];
  if (headObject != nil) {
    [self removeObjectAtIndex:0];
  }
  return headObject;
}

- (void) enqueue:(id)anObject {
  [self addObject:anObject];
}

- (void) clear {
  [self removeAllObjects];
  
}
@end
