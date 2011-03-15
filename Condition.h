#import <Foundation/NSObject.h>
#import <Foundation/NSValue.h>
#import <Object.h>


// replace this with a protocol?
@interface Condition: NSObject{
//    Class propertyClass;
//    NSComparisonResult 
}

// should relate to a property and a logical operator (how do we generalize logical operators?  one thing is to define comparators on property classes)
// maybe define a "range" class for logical expressions, and identical start and end are "equality", where we can also define inf bounds for one-sided intervals?

-(BOOL) passes:(BioObject*)object;
@end

@interface dnaSizeCondition: Condition{
    NSNumber *size;
    NSComparisonResult targetResult;
}

-(BOOL) passes:(BioObject*)object;
-(id) initWithSize:(NSNumber*)boundSize andComparison:(NSComparisonResult)result;
@end
