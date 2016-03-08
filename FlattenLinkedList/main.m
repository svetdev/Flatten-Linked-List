//
//  main.m
//  FlattenLinkedList
//
//  Created by Andrey Kasatkin on 3/7/16.
//  Copyright © 2016 Svetliy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLNode : NSObject;

@property id data;
@property LLNode *next;
@property NSString *name;

@end

@implementation LLNode

-(instancetype)initWithName:(NSString*)name{
    self = [super init];
    if(self)
    {
        self.name = name;
    }
    return self;
}

-(void)insertListAfterNode:(LLNode*)node{
    if (!node.data)
        return;
    else{
        LLNode *tempNext = node.next;
        node.next = node.data;
        node.data = nil;
        while (node.next)
            node = node.next;
        node.next = tempNext;
    }
}

-(void)processLinkedList:(LLNode*)root{
    LLNode *pointer = root;
    while (pointer.next) {
         [self insertListAfterNode:pointer];
        pointer = pointer.next;
    }
}


-(void)printLinkedList:(LLNode*)node {
    while (node) {
        NSLog(@" = %@", node.name);
        node = node.next;
    }
}

@end

int main(int argc, char * argv[]) {
    @autoreleasepool {
        LLNode *head1 = [[LLNode alloc] initWithName:@"head1"];
        LLNode *head2 = [[LLNode alloc] initWithName:@"head2"];
        LLNode *head3 = [[LLNode alloc] initWithName:@"head3"];
        
        LLNode *child1_head1 = [[LLNode alloc] initWithName:@"child1_head1"];
        LLNode *kid1_child1_head1 = [[LLNode alloc] initWithName:@"kid1_child1_head1"];
        LLNode *kid2_child1_head1 = [[LLNode alloc] initWithName:@"kid2_child1_head1"];
         LLNode *kid3_child1_head1 = [[LLNode alloc] initWithName:@"kid3_child1_head1"];
        LLNode *child2_head1 = [[LLNode alloc] initWithName:@"child2_head1"];
        
        LLNode *child1_head2 = [[LLNode alloc] initWithName:@"child1_head2"];
        LLNode *child2_head2 = [[LLNode alloc] initWithName:@"child2_head2"];
        
        head1.next = head2;
        head1.data = child1_head1;
        child1_head1.next = child1_head2;
        
        head2.next = head3;
        head2.data = child2_head1;
        
        child2_head1.next = child2_head2;
        
        //addition
        child1_head1.data = kid1_child1_head1;
        kid1_child1_head1.next = kid2_child1_head1;
        kid2_child1_head1.next = kid3_child1_head1;
        
        //more addition
        
        [head1 printLinkedList:head1];
        //[head1 flattenNode:head1];
        [head1 processLinkedList:head1];
        NSLog(@"result");
        [head1 printLinkedList:head1];
        
        
        return 0;
    }
}
