//
//  NetworkHandler.m
//  TopBlip
//
//  Created by Asif Noor on 2/23/13.
//
//

#import "NetworkHandler.h"
#import "Reachability.h"

#define NetworkAlertMessage @"Esta App Requiere de una conexión a internet para poder funcionar, por favor revise que este conectado a internet."

@implementation NetworkHandler

+(BOOL) checkInternet
{
    
    Reachability *r = [Reachability reachabilityWithHostName:@"www.google.com"];
	NetworkStatus internetStatus = [r currentReachabilityStatus];
	BOOL internet;
	if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)) {
		internet = NO;
	} else {
		internet = YES;
	}
//	if(!internet)
//	{
//    
//		UIAlertView *networkAlertView = [[UIAlertView alloc] initWithTitle:@"Problema con la Red" message:NetworkAlertMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//        [networkAlertView show];
//        return NO;
//	}
    return internet;
	
}

@end
