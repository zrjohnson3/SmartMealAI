

*Author: Zachary Johnson*

A/B Test Name: "Regenerate Meals" Button vs. No Button

User Story Number: US4 (Meal Plan Creation)
Metrics (HEART Framework):

    Happiness: Satisfaction rating with the generated meal plan

    Engagement: Average number of meal plan generations per session

    Task Success: Percentage of users who save or view the full meal plan

Hypothesis:

Adding a “Regenerate Meals” button after the meal plan is generated will increase user engagement and satisfaction, because users will feel more in control of their choices and better able to explore alternative plans.
What problem are we trying to solve?

Currently, once a meal plan is generated, users do not have an easy way to regenerate alternate options.
🧠 User Feedback/Observed Behavior: Some users abandon the screen if they dislike the suggestions, instead of starting over.
This lack of flexibility may reduce:

    User satisfaction

    Completion of meal planning

    Perceived control and personalization

Impact: This bottleneck could limit retention and adoption, especially among picky eaters or users with changing dietary moods.
Experiment:

    Audience Split:

        50% of users see the “Regenerate Meals” button

        50% see the current experience with no button

    Eligibility: All logged-in users who generate at least one meal plan

    Tooling:

        Use Firebase Remote Config to control feature exposure

        Track user group assignment with a regenerate_variant parameter (A or B)

    Firebase Analytics Events:

        meal_plan_generated

        regenerate_button_shown (group B only)

        regenerate_button_clicked (group B only)

        meal_plan_saved

        meal_plan_abandoned

        meal_plan_screen_duration

    Success Indicators:

        Higher average time on the meal plan screen in group B

        More saved plans in group B

        Higher completion rate (users viewing details or tapping next)

        Optional post-plan survey score (satisfaction)

Variations:

    Variant A (Control):

        No “Regenerate Meals” button after generating a plan.

        Existing screen flow remains unchanged.

    Variant B (Test):

        Add a visible “Regenerate Meals” button below the generated plan.

        Tapping the button will call the same AI function to regenerate a new plan with the same preferences.

        Optional: Animate button to attract attention on first view.

        Allow users in Variant B to select specific meals to keep and others to regenerate. This partial regeneration can increase the sense of control and personalization, possibly enhancing user satisfaction and engagement further.
***

*Author: Jack Reedy*

User Story Number: US4 (Meal Plan Creation)

Metrics (HEART Framework):

    Happiness: User satisfaction with the meal suggestions

    Engagement: Frequency of interactions with the meal suggestions (e.g., ratings, views, edits)

    Adoption: Percentage of users who interact with the meal suggestions more than once.

    Retention: Percentage of users who return to use the meal suggestion feature multiple times.

    Task Success: Percentage of users who save or share their meal suggestions.

    Hypothesis: Incorporating a rating system for users to provide feedback on each meal suggestion will increase engagement and improve the accuracy of future suggestions, as users feel their input is valued, which enhances the personalization of the app.

What problem are we trying to solve? While users can already edit their meal suggestions, there is no formal mechanism for them to provide feedback on the quality or relevance of each suggestion. Without this feedback loop, the app might not have the necessary data to refine future suggestions, and users might feel their preferences are not fully being taken into account.

Impact: Adding a feedback loop can help increase the personalization of the app by improving the suggestion algorithm based on real-time user input. It could also make users feel more engaged and heard, leading to increased satisfaction and retention.

Experiment:
    Audience Split:

        50% of users will have the current meal suggestion experience with no feedback mechanism.

        50% will be presented with an option to rate each meal suggestion (e.g., thumbs up/thumbs down or a 1-5 star rating system).

    Eligibility: All users who generate at least one meal suggestion.

    Tooling:

        Use Firebase Remote Config to enable the rating system for group B.

        Track user interactions with Firebase Analytics, tagging each user with a meal_suggestion_feedback_variant parameter.

        Firebase Analytics Events:

        meal_suggestion_generated

        meal_rating_shown (group B only)

        meal_rating_submitted (group B only)

        meal_suggestion_saved

        meal_suggestion_abandoned
    
        meal_feedback_received (for group B)

        meal_suggestion_engagement_time

    Success Indicators:

        Higher user engagement with meal suggestions in group B (e.g., more views or actions on meal suggestions).

        Higher completion rates of the feedback (i.e., users actually submitting ratings).

        Increased satisfaction from group B, possibly measured through in-app surveys or user ratings.

        Higher number of saved or shared meal plans in group B.

Variations:
    Variant A (Control):

        Users receive meal suggestions based on their preferences, but there is no option to rate or provide feedback on the suggestions.

    Variant B (Test):

        After meal suggestions are generated, users are prompted to rate each suggestion using a simple rating system (e.g., thumbs up/thumbs down or a 1-5 star scale).

        Optionally, allow users to provide specific feedback (e.g., "Why did you like or dislike this meal?") to further refine future suggestions.



        Ratings influence the personalization of future meal suggestions (e.g., better meal choices based on previous feedback).
***

*Author: Anthony Pellicone*

A/B Test Name: Meal Ingredients in Full View vs. Detailed View
User Story Number: US7 (Meal Display Preferences)
```
Metrics (HEART Framework):
Happiness: User satisfaction rating with meal display format

Engagement: Number of users interacting with the meal details

Task Success: Percentage of users who complete a meal selection

Hypothesis:
Displaying meal ingredients in the full meal view will improve user satisfaction and engagement because users can quickly assess whether a meal fits their preferences without needing extra clicks.
```
What Problem Are We Trying to Solve? Currently, the ingredients are displayed in the full meal view. Some users may find this additional step inconvenient, leading to frustration or decreased interaction with meal details,
as users may only want to see information like the cuisine type.

User Feedback/Observed Behavior:
Some users abandon the selection process if they cannot quickly assess meal suitability.

Users expect key meal information to be immediately visible without extra navigation.

Others prefer a cleaner interface with fewer details upfront, accessing ingredients only when needed.

Impact:
This friction point may reduce user engagement and the likelihood of users completing meal selections. It could also affect meal plan retention rates, as users who don’t immediately see relevant ingredients may disengage.

Experiment:
    Audience Split:
    
        50% of users (Variant A) see ingredients displayed directly in the full meal view.
        
        50% of users (Variant B - Control) only see ingredients when clicking on a meal for details.
        
        Eligibility:
        All logged-in users who view at least one meal.
        
        Tooling:
        Firebase Remote Config to control feature exposure.
        
        Track user group assignment with a meal_display_variant parameter (A or B).
        
        Firebase Analytics Events:
        meal_viewed
        
        meal_ingredients_visible (Variant A only)
        
        meal_clicked_for_details (Variant B only)
        
        meal_selected
        
        meal_abandoned
        
        meal_screen_duration
        
        Success Indicators:
        Higher meal selection rate in Variant A (indicating reduced friction).
        
        Higher meal screen duration in Variant A (users engaging more with visible information).
        
        Fewer abandoned meals in Variant A.
        
        Higher satisfaction ratings in a post-test survey.

Variations:
    Variant A (Test Group - Ingredients in Full View):
    
        Ingredients are always visible in the full meal view.
        
        No need to tap to see ingredients.
        
Variant B (Control - Ingredients in Detailed View):

        Ingredients are only visible when the user clicks on the meal.

        Existing meal browsing experience remains unchanged.

Conclusion:
If Variant A results in higher engagement and satisfaction, we may consider making ingredient visibility a default or allowing users to toggle their preference. 
