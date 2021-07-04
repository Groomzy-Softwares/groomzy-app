class ProviderBookingsQuery {
  String get providerBookings {
    return '''
      query PROVIDER_BOOKINGS_QUERY (
        \$providerId: Int!
      ) {
        providerBookings (
          providerId: \$providerId
        ) {
          bookings {
            id
            bookingTime
            status
            inHouse
            service {
              id
              title
              description
              duration
              price
              inHouse
            }
            staff {
              id
              fullName
            }
            client {
              fullName
            }
          }
        }
      }
    ''';
  }
}