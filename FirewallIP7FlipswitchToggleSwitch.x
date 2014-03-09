//
//  FirewallIP7FlipswitchToggleSwitch.x
//  FirewallIP7 Flipswitch Toggle
//
//  Created by rob311 on 08.03.2014.
//  Copyright (c) 2014 rob311. All rights reserved.
//

#import "FirewallIP7FlipswitchToggleSwitch.h"


@implementation FirewallIP7FlipswitchToggleSwitch


- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier {
    return @"Firewall iP7";
}

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *pathForFile = [NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"com.Yllier.Firewall.disabled"];
    return ![fileManager fileExistsAtPath:pathForFile]?FSSwitchStateOn:FSSwitchStateOff;

}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {

    if (newState == FSSwitchStateOn){
    system("rm /var/mobile/Library/Preferences/com.Yllier.Firewall.disabled");
    }
    else if (newState == FSSwitchStateOff){
    	    system("touch /var/mobile/Library/Preferences/com.Yllier.Firewall.disabled");
    }
    else {
    return;
    }   
}

@end