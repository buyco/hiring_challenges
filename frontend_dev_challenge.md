# Front-End Developper Challenge

## Overview
The goal of this test is to display a list of users and to be able to delete people from the list.

Please read the entire file before starting to code.

The application **must** use TypeScript and React. The only allowed libraries are:
`create-react-app`, `lodash`, `ramda`, `fetch`, `axios`, `styled-components`, `emotion`

Coding style, UI and UX will be studied and evaluted.

Clean code counts! We encourage you to use `prettier` and `eslint`.


## Step 1
Display a list of users using the JSON source file found here:
https://jsonplaceholder.typicode.com/users

Use `json-server` (https://github.com/typicode/json-server) to load the API in-memory.

Which data are displayed, as well as the design of the application are up to you.

### Constraint
Abstract away the AJAX logic into a reusable *hook* called `useFetch`.


## Step 2
The next step is to be able to select and remove one or more users from the list.

Since `json-server` simulates a ReST API, several requests must be made to remove several users (one request per user).
However this an implementation detail, for them it must appear as an atomic operation.

### Constraint
Your AJAX request must be abstracted into a reusable *hook* called `useCommand`.


## Bonus step 🎖
The `useFetch` *hook* allows putting several requests in cache.
