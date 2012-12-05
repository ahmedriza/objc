#include <Foundation/Foundation.h>
#include "Employee.h"
#include "Asset.h"

int main(void)
{
    /* NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init]; */
    @autoreleasepool {
        NSLog(@"Hello World!.");
        int x = 20;
        int y = 30;
        int sum = x + y;
        NSLog(@"sum = %d", sum);
        
        NSMutableArray* employees = [[NSMutableArray alloc] init];
        int count = 10;
        for (int i = 0; i < count; i++) {
            Employee* person = [[Employee alloc] init];
            [person setHeightInMetres:1.8 - i/10.0];
            [person setWeightInKilos:90 + i];
            [person setEmployeeID:i];
            
            [employees addObject:person];
        }
        
        NSMutableArray* allAssets = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < count; i++) {
            Asset* asset = [[Asset alloc] init];
            NSString* currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            [asset setLabel:currentLabel];
            [asset setResaleValue:i * 17];
            
            NSUInteger randomIndex = rand() % [employees count];
            Employee* randomEmployee = [employees objectAtIndex:randomIndex];
            // Employee* randomEmployee = [employees objectAtIndex:i];
            [randomEmployee addAssetsObject:asset];
            [allAssets addObject:asset];
        }

        NSSortDescriptor* voa = [[NSSortDescriptor alloc]initWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor* eid = [[NSSortDescriptor alloc]initWithKey:@"employeeID" ascending:YES];
        [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, eid, nil]];
        NSLog(@"Employees: %@", employees);
        
        NSLog(@"Giving up ownership of one employee");
        NSLog(@"%@", [[employees objectAtIndex:5] assets]);
        [employees removeObjectAtIndex:5];

        NSPredicate* predicate = [NSPredicate predicateWithFormat: @"holder.valueOfAssets > 70"];
        NSArray* toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        NSLog(@"toBeReclaimed: %@", toBeReclaimed);
        toBeReclaimed = nil;

        NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
        [dict setObject:@"Ahmed Riza" forKey:@"name"];
        NSLog(@"%@", dict);
        
        NSLog(@"Giving up ownership of arrays");
        allAssets = nil;
        employees = nil;
    }
    
    /* [asset release]; */
    
    /* [pool drain]; */
    return 0;
}

