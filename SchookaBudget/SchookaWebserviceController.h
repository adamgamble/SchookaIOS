//
//  SchookaWebserviceController.h
//  Schooka
//
//  Created by Adam Gamble on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SchookaWebserviceController : NSObject {
    NSURLConnection *connection;
    NSMutableData *jsonData;
}
-(BOOL)loginWithUsername:(NSString *)username password:(NSString *)password;
-(NSMutableArray *)loadAccounts;
-(NSMutableArray *)loadEnvelopesForAccount:(NSUInteger)account_id;

@end
