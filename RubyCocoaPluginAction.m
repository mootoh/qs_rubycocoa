//
//  RubyCocoaPluginAction.m
//  RubyCocoaPlugin
//
//  License: revised BSD
//  Created by mootoh on 2/2/08.
//

#import "RubyCocoaPluginAction.h"
#import <RubyCocoa/RubyCocoa.h>

@implementation RubyCocoaPluginAction

-(void) setInstance:(id)rb {
  rb_ = rb;
}

- (QSObject *)performActionOnObject:(QSObject *)dObject{
  // initialize RubyCocoa
  static bool loaded = false;
  if (!loaded) {
    if (RBBundleInit("qs_action.rb", [self class], self)) {
      NSLog(@"[RubyCocoaPluginAction.performActionOnObject] RBBundleInit failed");
      abort();
    }
    loaded = true;
  }

  // delegate actual action to Ruby class
  QSObject *ret = [QSObject objectWithString:[rb_ act:dObject]];
  return ret;
}

@end
