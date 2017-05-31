//
//  ContactList.m
//  ContactList
//
//  Created by Harry Li on 2017-05-30.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *contacts = [[NSMutableArray alloc]init];
        _contacts = contacts;
    }
    return self;
}

-(void)addContact:(Contact *)newContact{
    [self.contacts addObject:newContact];
}

-(BOOL)checkIfContactEmailExists:(NSString *)email{
    for (int i = 0; i < self.contacts.count; ++i) {
        Contact *contact = self.contacts[i];
        if([contact.email isEqualToString:email]){
            NSLog(@"Email already exist.\n");
            return YES;
        }
    }
    return NO;
}

-(void)printContactList{
    for(int i = 0; i < self.contacts.count; ++i){
        Contact *contact = self.contacts[i];
        NSLog(@"%i: <%@>(%@)Phone Numbers:%@", i, contact.name, contact.email,contact.number);
    }
}

-(void)printContactDetailAtIndex: (NSString *)index{
    if(index.integerValue < self.contacts.count){
        Contact *contact = self.contacts[index.intValue];
        NSLog(@"Full Name- %@\nEmail- %@\nPhone Numbers:%@\n", contact.name, contact.email, contact.number);
    }else{
        NSLog(@"ID not found.");
    }
}

-(void)findContact: (NSString *)search{
    
    int count = 0;
    
    for (int i = 0; i < self.contacts.count; ++i) {
        Contact *contact = self.contacts[i];
        
        if([contact.name containsString:search] || [contact.email containsString:search]){
            count++;
            NSLog(@"Result Found:\nName- %@\nEmail- %@\nPhone Numbers:%@\n", contact.name, contact.email, contact.number);
        }
    }
    if (count == 0) {
        NSLog(@"Not Found.");
    }
    
}

@end
