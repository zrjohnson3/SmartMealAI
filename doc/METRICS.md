# Metrics Documentation

To better understand our application's usability and user engagement, we use the Google HEART framework as outlined in our [HEART framework](https://docs.google.com/presentation/d/1LoHqij2aKoj_UmXh4wUQEc_CQnoW8cLxyOgLZfQxe4I/edit?usp=sharing)

## Key Metrics

Our application tracks the following metrics to monitor performance and user satisfaction:

1. **NPS (Net Promoter Score)**
2. **Adoption**
3. **DAU (Daily Active Users)**
4. **Retention**
5. **CTR (Click-Through Rate) for an event on the Golden Path**
6. **Average number of new ToDo tasks created per active user each day**

### Metrics Collection Methods

Below are the methods we use to collect data for each metric:

- **NPS**: Collected via a pop-up survey that appears at the end of the Golden Path. The user's response is recorded in our database associated with their user ID.
  
- **Adoption**: Measured by the number of new authentication sign-ups in Firebase, which automatically logs these events.
  
- **DAU**: Tracked by Firebase Analytics by counting the number of unique users who engage with the app daily.
  
- **Retention**: Measured by analyzing user logins over a period to determine the percentage of returning users. This is tracked via Firebase authentication timestamps.
  
- **CTR for an event on the Golden Path**: Tracked using Firebase Analytics with a custom event that logs clicks on the specified event. The event ID and user interaction are recorded for analysis.
  
- **Average number of new ToDo tasks created per active user each day**: This metric is specifically tracked by counting the number of tasks created by users who log in daily, recorded in our backend database. The data is aggregated daily to monitor active engagement within our app.

### FlutterFlow Automatic Metrics Logging

In addition to the above metrics, our application also takes advantage of automatic metrics logging provided by FlutterFlow. This includes:

- User session times
- Page views
- Button clicks

These metrics help us further refine the user experience and identify any potential issues in app navigation or performance.

## Conclusion

Continuously monitoring these metrics provides our team with critical insights into our app's performance and user satisfaction. We use this data to make informed decisions about future developments and enhancements. For more detailed information on our HEART framework implementation, please refer to the linked Google Slide presentation.
