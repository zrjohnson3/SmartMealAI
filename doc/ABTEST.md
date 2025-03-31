

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
