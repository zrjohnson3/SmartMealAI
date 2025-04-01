# Metrics Documentation

To better understand our application's usability and user engagement, we use the Google HEART framework as outlined in our [HEART framework](https://docs.google.com/presentation/d/1LoHqij2aKoj_UmXh4wUQEc_CQnoW8cLxyOgLZfQxe4I/edit?usp=sharing)

## Key Metrics

Our application tracks the following metrics to monitor performance and user satisfaction:

1. **NPS (Net Promoter Score)**
2. **Adoption**
3. **DAU (Daily Active Users)**
4. **Retention**
5. **CTR (Click-Through Rate) for an event on the Golden Path**
6. **Average number of new meals generated per day**

### Metrics Collection Methods

Below are the methods we use to collect data for each metric:

- **NPS (Net Promoter Score)** - how to collect:

    NPS is collected via a custom FlutterFlow component that pops up after the user's 5th login (tracked using a custom counter stored in Firebase         under each user's document).

    When the pop-up appears, the user's score (0–10) and optional feedback are written to a nps_responses subcollection in Firestore, along with their     user_id, timestamp, and number of logins.

    Firebase Analytics also logs a custom event nps_submitted to allow cross-analysis with session engagement data.
  
- **Adoption**: Measured by the number of new authentication sign-ups in Firebase, which automatically logs these events.
  
- **DAU**: Tracked by Firebase Analytics by counting the number of unique users who engage with the app daily.
    Firebase Analytics shows amount of active users, and average active user engagement time.
  
- **Retention**: Measured by analyzing user logins over a period to determine the percentage of returning users. This is tracked via Firebase authentication timestamps.
  
- **CTR for an event on the Golden Path**: Tracked using Firebase Analytics with a custom event that logs clicks on the specified event. The event ID and user interaction are recorded for analysis.
  
- **Average number of new meal created each day per user**: This metric is specifically tracked by counting the number of meals created by users who log in daily, recorded in our backend database. The data is aggregated daily to monitor active engagement within our app, it will help
  to showcase how many users are actually using our application for its intended purposes, opposed to merely logging in. This metric will be useful for us to scale our application as well as keep track of user engagement. It can be further expanded upon by keeping track of a range of dates in which
  user continuously visited our application. 

### FlutterFlow Automatic Metrics Logging

In addition to the above metrics, our application also takes advantage of automatic metrics logging provided by FlutterFlow. This includes:

- User session times
- Page views
- Button clicks

These metrics help us further refine the user experience and identify any potential issues in app navigation or performance.

## Conclusion

Continuously monitoring these metrics provides our team with critical insights into our app's performance and user satisfaction. We use this data to make informed decisions about future developments and enhancements. For more detailed information on our HEART framework implementation, please refer to the linked Google Slide presentation.
