#include <iostream>
#import <seqan/basic.h>
#import <seqan/find.h>
#import <seqan/modifier.h>

using namespace seqan;


template <typename TAlgorithm>
void printAllOccs(String<char>& haystack, 
                  String<char>& needle)
{
    Finder<String<char> > finder(haystack);
    Pattern<String<char>, TAlgorithm> pattern(needle);
    while (find(finder, pattern)) 
    {
        ::std::cout << position(finder) << ", ";
    }
    ::std::cout << ::std::endl;
}


void testFunction(const char* tmpl,const char *primer)
{
    std::cout<<"Occurrences"<<std::endl;
    String<char> haystack(tmpl);//="send more money";
    String<char> needle(primer);//="mo";
    printAllOccs<ShiftOr>(haystack,needle);
}

bool amplify(const char* tmpl,const char* primer1,const char* primer2,char* amplicon)
{
    DnaString templateString(tmpl);
    // duplicate once to avoid end overlap effects
    append(templateString,templateString);
    DnaString primerString1(primer1),primerString2(primer2);
    Finder<DnaString > finder(templateString);
    Pattern<DnaString,ShiftOr> pattern1(primerString1),pattern2(primerString2);

    DnaString forwardPrimer,reversePrimer;

    if(find(finder,pattern1)){
        forwardPrimer=primerString1;
        reversePrimer=primerString2;}
    else if(find(finder,pattern2)){
        forwardPrimer=primerString2;
        reversePrimer=primerString1;
    }
    else
        return false; // failure

    //reversePrimer.reverseComplement();
    //reverseComplement(reversePrimer); // in place?
    ModifiedString<ModifiedString<DnaString, ModComplementDna>,ModReverse> reversePrimerReverseComplementString;
    Pattern<DnaString,ShiftOr> reversePrimerReverseComplementPattern(reversePrimerReverseComplementString);

    int startIndex=position(finder);
    if(find(finder,reversePrimerReverseComplementPattern)){
        int finalIndex=position(finder)+length(reversePrimer)-1;
        strncpy(amplicon,toCString(infix(templateString,startIndex,finalIndex)),finalIndex-startIndex+1);
    }
    else
        return false;
    return true;
}
