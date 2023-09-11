const getJobs = '''
  query GetShips() {
    ships{
        id
        name
        model
        image
        status
        roles
        year_built
        type
    }
  }
''';