# MathTestProjectWeb.AdditionLive

Standalone page where users enter two numbers and get their sum

## Type

liveview

## Route

`/addition`

## Params

None

## User Interactions

- **phx-change="validate"**: Live-validate form inputs to ensure number_1 and number_2 are valid numbers, update changeset in assigns.
- **phx-submit="calculate"**: Parse number_1 and number_2 from form params, call MathTestProject.Calculator.add/2 with the parsed numbers, assign result to socket.

## Dependencies

- MathTestProject.Calculator

## Components

None

## Design

Layout: Centered single-column page

Main content:
  - Heading: "Addition"
  - Form with id "addition-form" containing:
    - Number input field for addition[number_1]
    - Number input field for addition[number_2]
    - Submit button labeled "Add"
  - Result display area showing the calculated sum after form submission

Components: .form-control, .btn-primary

Responsive: Single column layout suitable for all screen sizes
