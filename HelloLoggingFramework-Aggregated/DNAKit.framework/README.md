<img src="Assets/NamedLogo.png"/>
<p style="display: flex;
        width: 100%;
        flex: 1;
        align-items: center;
        spacing: 10px;
        justify-content: center;
        padding: 32px;
">
<img  src="https://img.shields.io/badge/Swift-5.0-orange.svg" alt="Swift 5.0"/>
<img  src="https://img.shields.io/badge/platform-iOS-brightgreen.svg" alt="Platform: iOS"/>
<img  src="https://img.shields.io/badge/Xcode-11%2B-brightgreen.svg" alt="XCode 11+"/>
<img  src="https://img.shields.io/badge/iOS-11%2B-brightgreen.svg" alt="iOS 11+"/>
<img  src="https://img.shields.io/badge/licence-MIT-lightgray.svg" alt="Licence MIT"/>
</p>




# Introduction

A UI component library written in swift, inspired by [Atomic Design by Brad Frost](http://atomicdesign.bradfrost.com/table-of-contents/). A repository of reusable, customizable and stateful UI components and interactions for building modular and flexible UI elements in swift.  


#### Benefits:
* Reusablitiy of code 
* Promotes modularity, hence reducing redundancy
* Increases consistency and enhancing the overall user experience
* Makes testing and debugging exponentially easier.
* Shared vocabulary across all modules 


# Installation

## Carthage

## Cocoapods

To install via cocoapods add `pod 'DNAKit', '~> 0.0.1' `similar to the following to your Podfile:

  ```
target 'MyApp' do
pod 'DNAKit', '~> 0.0.1'
end
```

Then run a pod install inside your terminal, or from CocoaPods.app.

Alternatively to give it a test run, run the command:

 `pod try DNAKit`


## Manual


# Usage
**How to use ?**

* This library can be used as is or as a template to build a pattern library around your own design system.
* If you are thinking of creating a component library for your project, or modularize your UI, this might be a good reference point.
* Categorization has been done based on the atomic design principles, with atoms being the lowest level design elements, and pages are the complete UI screens



## Foundation 

* The foundation of the library contains some components which would be used throughout the entire library by all the components.
* These define the basic rules which would be adopted by all the components and features.
* Foundation includes image assets shared across multiple feature, app's color theme, typography, shadows, custom fonts, string types etc.


1. ### Typography
   
    Typography sets a foundation of font families, weights, and other attributes associated with displaying multiple text types within the app.

    It helps in building hierarchy using size, color, additional details like line-height, and layering responsiveness. These models are then applied to components in a system’s library (like articles , headings etc.) as well as custom components for other other features.


    DNAKit uses <font name> as the custom font, and <other font name> as the fallback font, in case the custom fonts are not present 

    The typography has been segregated into 2 main categories based on content type , each of which has its own attributes for all text styles.


    Following are the typogrsphy attributes for different text styles.


    | Style Name        |  Font Size            | Font Weight      | Letter spacing  | Line Height 
    | ------------------ |:-------------------:| :-----------------:| :----------------:| :-----------:
    |  h1                     | 21                        | medium                | -0.12             | 1
    | h2                      | 18                        |  medium                | -0.24                | 1.4
    | h3                      | 16                        |  medium                | 0                      | 1.5
    | body large         | 16                        |  regular                  | 0                      | 1.5
    | body regular      | 15                        |  regular                  | 0                      |  1.5
    | body small         | 14                        |  regular                  | 0                      |  1.5
    | caption               | 12                        |  regular                 | 0                      | 1.2



2. ### Color Scheme

    Color scheme includes a palette of all the commonly used colors throughout the application. It defines the color theme specifying different colors for different patterns and behaviors.
    Please refer the example app for detailed usge information
    
    >  Support for dark mode is added for iOS 13+ versions
    > The colors defined  can be overridden to change any color value, or extend the color to add more custom colors (if you want to keep using the library colors
    
3.  ### DNAAttributedString
   
   * Custom Attributed string supporting utility based functionalities for reducing redundancy and easing development process.
   * Supports String Interpolation  for custom styles like typography, font, images, links , colors etc,
   * String interpolation makes it very easy to define  and modify custom attributes of a string dynamically
    
   * #### Initialization
      can be initialized by either providing a string literal or an interpolated String
         
       ```swift
          public init(stringLiteral: String)
          
       ```

       ```swift
        public init(stringInterpolation: StringInterpolation)
       ```  
    




## Atoms

Atoms are the basic building blocks of matter, the atoms of our interfaces serve as the foundational building blocks that comprise all our user interfaces.They cannot be broken down further 

1. ### Button

    Button are UIControls that can recieve user interactions, and perform any actions attached to it.

    DNAKit has 2 button classes :

    1. #### `DNABaseButton` 
    
        Base button is a custom `UIButton` class which defines all the common kinds of
        buttons, along with multiple possible states and interactions associated with it.
        All the button types to be used throughout the project, can be standardized along with it's behavior in different states, and transitions like 
        This greatly reduces the hassle of rewriting the same peice of code again and again and reduces the calling to and managing state changes and interactions to just a line!
        
        
        * #### Initialization
         The initialization can be done with/ without image
        
        
        * #### Properties 
            Following are the properties associated with `DNABaseButton`
    
            * **type** :  `DNAButtonType`
            type defines all possible types of buttons, which will be used repeatedly.
                 Button type has visual properties like tint color, background color etc. associated with it. 
                The library contains some pre-defined button types with following attributes. 
    
    
                | Button Type        | Tint Color      |  Background Color     | Border Color| 
                | :--------------: |:-----------------:||:-----------------:||:-----------------:|
                |    abc               | 123                   | sklkd                 |aa
    
    
            * **buttonState** : `DNAButtonState`
            
                button state defines different behaviors of the button. 
                For example if a button is in disabled state the touch interactions are disabled
                > Default state for a button is normal
    
                Following are the button states
                * normal
                * disabled
                * loading
                * highlighted  
                * error
        
            * **title** : `String`
    
                Title for the button (optional)
        
            * **image** : `UIImage`
    
                Image icon for the button (optional)
      
            * **buttonHeight** : `DNAButtonHeight`
                 For consistency purpose the height of the button is standardized. You can provide custom height by using                       `DNAButtonHeight.custom(<desiredHeight: Int>)`
    
                | type                 | height              |  font size    | 
                | :--------------: |:-----------------:|:-----------------:|
                |   small           | 24                 |        11          |
                |   medium       | 34                  |    14              |
                |  large             | 40                  |   14               |
                |  custom         |  variable                |   14               |
       
                for more information please refer `DNAButtonHeight` 
       
        
            * **action** :  `(DNABaseButton) -> Void`
                All tap events recieved by the button can be handled by `action` variable.
                It is a closure which can be implemented (optionally), and gets triggered whenever user
  
    


    2. #### DNAText Button




2. ### Labels
    Custom label classes which supports displaying text with predefined typography, processing numerical values, and adding user interaction
    
    * #### DNALabel
        A highly customizable label, which supports the typography, and also contains spport for recieving user interactions
        
        By using typography defining a heading label can be as easy as this :
        
        ` let headerLabel = DNALabel(withType: .h1(.product), text: "Hello World")`
        
     * #### Initialization
        DNALabel can be initialized with a specific [Typography]( link://typography) 
            
         ```swift
        
                /**
                Initialize a DNALabel
                - parameter type: Typography of the text
                - parameter text: text string for the label
                */
                init(withType type: Typography, text: String?)
          ```
        
         ```swift
                /**
                Initialize text without typography
                */
                init() 
                
          ```
        
     * #### Properties
         
      * **textColor**: `UIColor` 
        tint color of the text
                
      * **customAttributedText** : `DNAAttributedString
      * **type**: `Typography`
            
   * #### Supporting User Interactions
      To add and handle user tap events, implement the following method.
        
    ```swift
    typealias Action = (DNALabel) -> Void
    public func action(_ closure: @escaping Action)
    ```
            
    * ### DNANumericLabel
        A subclass of `DNALabel` for handling and processing special types of numeric values; these include amount, percentages, differences and signed numbers
       
        It takes a Double value as params and displays a processed value based on the numberType Specified.
        Number type defines what kind of value the number is for eg. A number can be a percentage or an amount
        
        
     * #### Initialization
       
       Initialized with a number type which determines how to process the number value
        
            ```swift

            public init(withNumberType numType: DNANumberType)
            ```
        
      * #### Properties
        
     * **value** :  `Double`
            number value to be displayed
           
     * **numberType** : ` DNANumberType`
           
        the number value can be of one of the following types.
        The numbers can be signed, that is showing + / - signs for respective values
            
        > To have different colors for positive and negitive values provide
        `Color.colored` value for color variable

           
         ```swift
            public enum DNANumberType {
             /**
              Percentage: Appends % sign at the end of the value
             - color: option to show positive / negetive values in different colors
              - font : font for the number labbel
              - signed : if true appends + / - sign before number value
              */
             case percentage(_ color: Color, font: Font, signed: Bool = false)
             
             /**
             Amount:  Prepends amount with rupee sign
              - color: option to show positive / negetive values in different colors
              - font: font of the value to display
              - unit: appended to the value eg: "cr"
              */
             case amount(_ color: Color, font: Font, unit: String? = nil)
             
             /**
             Number: shows a number value
                 - color: option to show positive / negetive values in different colors
                 - font: font of the value to display
                 - signed : if true appends + / - sign before number value
                 */
             case number(_ color: Color, font: Font, signed: Bool = false)
             
             /**
             Change: Shows a up(🔼) image if value is positive and (🔽) if value is negetive
             - color: option to show positive / negetive values in different colors
             - font: font of the value to display
             - signed : if true appends + / - sign before number value
             */
             case change(_ color: Color, font: Font, signed: Bool = false)
             
             }
             
              public enum Color {
                    
                    // text color positive numbers are set to green, negetive values are set to red
                    case colored
                    
                    // all values set to the label's text color
                    case uncolored
                    
                }
             
          ```


3. ### Text Inputs

    1. #### DNATextField
        A  stateful textfield with rule based validation. 
        
      * #### Validation 
            The text field input can be validated by adding validation rules. 
            A validation rule describes what type of input to accept.
    
            
           Each [rule type](link://textValidationRuleType) has a [TextValidationRule](link://validation) and  an error object associated with it . If the rules provided are evaluated are not satisfied, the textField's input state enters errored state, and associated error message is displayed.
            
            
           You can provided multiple rules, if there are confilcting rules conditions, then precedence will be given on the basis of  whichever rule is added first in the array.
            
           **TextValidationRule**
           
          ```
            public enum TextValidationRule {
                
                case noRestriction
                case nonEmpty
                //Regex string
                case string(String)
                case regularExpression(NSRegularExpression)
                case predicate((String) -> Bool)
                
                public func isValid(_ input: String) -> Bool {
                    switch self {
                    //There are no restrictions, i.e. any input is valid, including the empty string
                    case .noRestriction:
                        return true
                        
                    //The input must be non-empty
                    case .nonEmpty:
                        return !input.isEmpty
                        
                    //The substring is part of the string being validated
                    case .string(let str):
                        return input.evaluate(with: str)
                        
                    //You can specify a regular expression the input string must match
                    case .regularExpression(let regex):
                        let fullNSRange = NSRange(input.startIndex..., in: input)
                        return regex.rangeOfFirstMatch(in: input, options: .anchored, range: fullNSRange) == fullNSRange
                        
                    //Yu can pass in a predicate function that determines if the input is valid
                    case .predicate(let p):
                        return p(input)
                    }
                }
                
            }
            
          ```   
    
      * #### Properties 
      
          DNATextfield is a subclass of `UITextField` , hence all the properties of UITextField are applicable, along with some extra properties. 
            * **borderColor** : `UIColor`
                border color for the text feild
             * **typography**: `Typography`
                    to add custom attributes to the text 
             * **inputState** :  `DNATextInputState`
             * **normal** : When no text is inputed
             * **disabled**  :  Input will be in de-activated state
             * **error** :  If input is incorrect (based on rules provided)
             * **focused**  : While the text is being entered, the text feild is in foceused state.
             * **validationRules** : `TextValidationRuleType`
                Input text can be validated by adding text validation rule type.
                TextValidationRuleType has a [rule]() and an error object associated with it.
            
                ````swift
                public enum TextValidationRuleType {
                case email
                case phoneNumber
                case custom(TextValidationRule, ValidationError?)
                case nonEmpty
                case name
                case lessThan(maxValue: Int)
                case greaterThan(minValue: Int)
        
                }
                ````
                           
                You can provide custom validation rules 
                
                ````swift
                    TextValidationRuleType.custom(TextValidationRule.nonEmpty, ValidationError.custom("Invalid Input Ctring"))
                
                 ```` 
                
    * **validationDelegate** : `DNATextInputDelegate`
            
                To be notified about the status of input text validation, conform to the validationDelegate.
            
                ````swift
                protocol DNATextInputDelegate {
                    
                func didValidateInput<T>(isValid: Bool, error: ValidationError?, input: String?, inputFeild: T)
                }
                        
                ```` 
            
            
     *  **error**: `ValidationError`
            
                 Possible error states for text input
                 
                 ````swift
                enum ValidationError: Error {
            
                case invalidEmail
                case invalidPhoneNumber
                case invalidName
                case emptyValue
                case valueTooLow
                case valueTooHigh
                case custom(String)
                
                }
                                         
                ```` 
                 
    
    
    2. #### `DNATextView`
    
    
    A subclass of UITextView with placeholder text support and rule based validations. 
    
    > The process of adding validations to a text view is similar to that in DNATextField
    
    * #### Properties 
     * **typography** :  `Typography`
     * **placeholderText** : `String`
     * **inputState** :  `DNATextInputState
     * **borderColor** :  `UIColor`
     * **validationRules** : `[TextValidationRuleType]`
     * **validationDelegate** :  `DNATextInputDelegate?`
     * **error** : `ValidationError?`
    

## Molecules

Molecules are relatively simple groups of UI elements functioning together as a unit. For example, a label, search input, and button can join together to create a search form molecule.



## Organisms

Organisms are relatively complex UI components composed of groups of molecules and/or atoms and/or other organisms.


## Templates


## Pages








