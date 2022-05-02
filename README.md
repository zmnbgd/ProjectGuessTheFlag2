# ProjectGuessTheFlag2
Paul Hudson 100DaysOfSwiftUI


DAY 21

Today you have three topics to work through, in which you’ll apply your knowledge of VStack, LinearGradient, building layouts, tracking state, randomizing arrays.


Stacking up buttons

We’re going to start our app by building the basic UI structure, which will be two labels telling the user what to do, then three image buttons showing three world flags.

Next, we need two properties to store our game data: an array of all the country images we want to show in the game, plus an integer storing which country image is correct.

var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
var correctAnswer = Int.random(in: 0...2)

The Int.random(in:) method automatically picks a random number, which is perfect here – we’ll be using that to decide which country flag should be tapped.

Inside our body, we need to lay out our game prompt in a vertical stack, so let’s start with that:

var body: some View {
    VStack {
        Text("Tap the flag of")
        Text(countries[correctAnswer])
    }
}

Below there we want to have our tappable flag buttons, and while we could just add them to the same VStack we can actually create a second VStack so that we have more control over the spacing.
The VStack we just created above holds two text views and has no spacing, but the flags are going to have 30 points of spacing between them so it looks better.
So, start by adding this ForEach loop directly below the end of the VStack we just created:

ForEach(0..<3) { number in
    Button {
       // flag was tapped
    } label: {
        Image(countries[number])
            .renderingMode(.original)
    }
}

And now we have a problem: our body property is trying to send back two views, a VStack and a ForEach, but that won’t work correctly. This is where our second VStack will come in: I’d like you to wrap the original VStack and the ForEach below in a new VStack, this time with a spacing of 30 points.

var body: some View {
    VStack(spacing: 30) {
        VStack {
            Text("Tap the flag of")
            // etc
        }

        ForEach(0..<3) { number in
            // etc
        }
    }
}

We’ll come back to polish the UI later, but for now let’s put in a blue background color to make the flags easier to see. Because this means putting something behind our outer VStack, we need to use a ZStack as well. Yes, we’ll have a VStack inside another VStack inside a ZStack, and that is perfectly normal.
Start by putting a ZStack around your outer VStack, like this:

Now put this just inside the ZStack, so it goes behind the outer VStack:

Color.blue
    .ignoresSafeArea()

Now that we have a darker background color, we should give the text something brighter so that it stands out better:

Text("Tap the flag of")
    .foregroundColor(.white)

Text(countries[correctAnswer])
    .foregroundColor(.white)


Showing the player’s score with an alert

