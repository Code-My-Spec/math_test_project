# MathTestProjectWeb.SubtractionLive

Standalone page where users enter two numbers and get the difference

## Type

liveview

## Route

`/subtraction`

## Params

None

## User Interactions

- **phx-change="validate"**: Live-validate form inputs to ensure number_1 and number_2 are valid numbers, update changeset in assigns.
- **phx-submit="calculate"**: Parse number_1 and number_2 from form params, call MathTestProject.Calculator.subtract/2 with the parsed numbers, assign result to socket.

## Dependencies

- MathTestProject.Calculator

## Components

None

## Design

Layout: Centered single-column page

Main content:
  - Heading: "Subtraction"
  - Form with id "subtraction-form" containing:
    - Number input field for subtraction[number_1]
    - Number input field for subtraction[number_2]
    - Submit button labeled "Subtract"
  - Result display area showing the calculated difference after form submission

Components: .form-control, .btn-primary

Responsive: Single column layout suitable for all screen sizes
