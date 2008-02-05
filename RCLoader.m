//
//  RCLoader.m
//  RubyCocoaPlugin
//
//  Created by Fujimoto Hisa on 08/01/22.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "RCLoader.h"
#import <RubyCocoa/RubyCocoa.h>

@implementation RCLoader

+ (void)load {
  static bool installed = 0;

  NSLog(@"BundleLoader#load ...");
  if (! installed) {
    if (RBBundleInit("load_ruby.rb", [self class], self)) {
      NSLog(@"RCLoader#load => failed.");
    }
    else {
      installed = true;
      NSLog(@"RCLoader#load => loaded.");
    }
  }
}

@end // RCLoader
