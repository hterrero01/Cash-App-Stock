## Architectural Approach

_Describe the architectural approach you took and explain why you chose it._

For this project I chose the MVVM architectural design pattern with SwifTUI vs MVC and UIKit for development. My reasoning
1. MVC can lead to extremely large and complex viewcontrollers
2. SwiftUI uses declarive programming which help speed up UI development
3. The ViewModel seperate business logic which makes it easier to produce unit test for it. as shown in the project.
4. Data binding: SwiftUI has a more reactive approach where the viewmodel can automatically update the view when the model changes
5. Views are easier to handle and re-use
6. Better support for accessibility in SwifTUI

## Trade-offs

_Describe the trade-offs you made during the development process and explain why you made those decisions._

Here is a list of tradeoffs I made during the project.

1. I sacriface Accessibility over Localization. In an ideal world I would have initially started it off with some stringLocalizable files to handle multiple language. However I would have improved that experience by adding another endpoint to fetch the desired language for the current design local. this would ensure that the client is only caching needed data. I would have some keys on a StringLocalizable file to handle some errors and other keys before fetching localization.
2. In the project, rather than starting off with a SwiftUI project (app architecture) - I used a UIKit template. I made this decision because I wanted to show that you  can support both UIKit and SwiftUI in the same project. Given that SwiftUI is still a relatively mordern framework, most Apps are using UIKit. However, there is opportunity to start migrating some components given support in SwiftUI. Additionally, I prefer having the UIKit SceneDelete and AppDelegate files to better manage the application life cycle.
3. Primarily focused on VO support for accessibility. would have loved to take more time to find intuitive ways to support Accessibility with navigation custom rotors and/or accessibility actions and others.

## How to Run the Project

_Provide step-by-step instructions on how to run your project, including any required setup or installation steps._

1. download from github
2. pick device / simulator of choice (iphone)
3. build project on xcode
4. run

## 3rd Party Libraries and Copied Code

_List any 3rd party libraries or copied code you used in your project, and provide proper attribution if required._

NONE

## Additional Information

_Provide any other information that you would like us to know about your project._

Had a great time and I'm looking forward to having more converstations about this project.
