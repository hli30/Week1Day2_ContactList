//
//  ContactList.h
//  ContactList
//
//  Created by Harry Li on 2017-05-30.
//  Copyright © 2017 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property NSMutableArray *contacts;

-(void)addContact:(Contact *)newContact;
-(BOOL)checkIfContactEmailExists:(NSString *)email;
-(void)printContactList;
-(void)printContactDetailAtIndex: (NSString *)index;
-(void)findContact: (NSString *)search;

@end
