//
//  AccountsController.h
//  Schooka
//
//  Created by Adam Gamble on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchookaWebserviceController.h"


@interface AccountsController : UITableViewController {
    SchookaWebserviceController *webService;
    NSMutableArray *accounts;
}

@end
