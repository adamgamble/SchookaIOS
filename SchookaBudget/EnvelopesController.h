//
//  EnvelopesController.h
//  Schooka
//
//  Created by Adam Gamble on 7/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchookaWebserviceController.h"

@interface EnvelopesController : UITableViewController {
    SchookaWebserviceController *webService;
    NSMutableArray *envelopes;
}

@end
