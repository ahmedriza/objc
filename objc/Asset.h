#import <Foundation/Foundation.h>
@class Employee;

@interface Asset : NSObject
{
        NSString* label;
        __weak Employee* holder;
        unsigned int resaleValue;
}
@property (strong) NSString* label;
@property (weak) Employee* holder;
@property unsigned int resaleValue;
@end
