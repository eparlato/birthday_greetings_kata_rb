"users" should be renamed to "persons"?

the filter for persons born on month/day is set on UserFileDataSource, should it belong to SendGreetingsUseCase instead?
- (+) it is domain logic, it should belong to the use case
- (-) if moved to domain, I need to retrieve all the persons and then search for the proper ones, it is inefficient and doesn't scale