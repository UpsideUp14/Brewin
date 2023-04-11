# Introcourse Project App for the iPraktikum - Inosensius Alvian

To pass the introcourse, you need to create your own unique iOS app (based on SwiftUI).

There are no requirements regarding the functions of your app, so you can get creative.
However, we provide you with Non-Functional Requirements (NFR) that your app needs to fulfill.

After each day of learning new Swift and SwiftUI concepts, these NFRs may change, or new NFRs get added.


## Submission procedure

You get a **personal repository** on Bitbucket to work on your app.

Once you implemented a new feature into your app, you need to create a Pull Request (PR) to merge your changes from the feature branch into your main branch.

Your tutor will review your changes and either request changes or approves the PR. 

If your PR got approved, you also need to merge it!

### Deadline: **19.04.2023 12:00**
Until the deadline all of your PRs **need to be merged** and your final app **needs to fulfill** all of the requested NFRs!

---

## Problem Statement (max. 500 words)

As a coffee lover, I find it difficult to keep track of my recipes and my settings. So rather than writting everything on post it notes and sticking them all over my room, 
    I would love an app that can keep track of all my notes. 

The app itself should be able to keep track of recipes of different brewing methods that I use, Keep track of beans that I brew. I also need to be able to add specific details for each combination of recipe and beans, details such as, grind size, and temprature. The app should also have a built in stopwatch/timer and hints for each recipe steps.

I should alaso be able to filter beans or recipes by types, and also mark any recipes, beans, or the combination as favorites. Brews should also be logged and can be editted and deleted. Notes should be able to be added to any specific instance of a log

## Requirements

- Add recipe entries
    The user should be able to add recipe entries for specific brewing method with timing and description infos

- Add beans entries 
    Users should be able to add entries of beans with details such as: bean name, origin, process, height, and tasting notes.
    
- Combine recipe and beans
    Users should be able to combine any recipe with any beans available. And they should be able to add details such as: grind size, water temprature 
    
- Log brews of a specific combination of recipe and beans 
    The app should log everytime the user decides to brew. The data that is log are: recipe, beans type, brew time, grind size
    
- Add notes to each log
    The user should be able to optionally add notes to brew logs. 
    
## Analysis

TODO: Include an analysis object model. You can use [draw.io](https://draw.io) or [apollon](https://apollon.ase.cit.tum.de) to create it.

## System Design

TODO: Include a system design overview describing your application.

## Product Backlog

TODO: Add a product backlog and don't forget to update it with each PR

