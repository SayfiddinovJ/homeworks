const getSingleCountry = r'''
         query GetShipById($code:ID!){
         ship(type: $code) {
         name
       }
      }
        ''';