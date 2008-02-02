//
//  RubyCocoaPluginAction.h
//  RubyCocoaPlugin
//
//  Created by mootoh on 2/2/08.
//  Copyright mootoh 2008. All rights reserved.
//

#import <QSCore/QSObject.h>
#import <QSCore/QSActionProvider.h>
#import "RubyCocoaPluginAction.h"

#define kRubyCocoaPluginAction @"RubyCocoaPluginAction"

@interface RubyCocoaPluginAction : QSActionProvider
{
  id rb_; // Ruby class instance that does actual action.
}

-(void) setInstance:(id)rb;
@end
