defmodule MathTestProjectSpex.SubtractionCalculationSpex do
  use SexySpex
  use MathTestProjectWeb.ConnCase
  import Phoenix.LiveViewTest

  import_givens MathTestProjectSpex.SharedGivens

  spex "A user can enter two numbers and get the result" do
    scenario "user subtracts two positive numbers" do
      given_ "the user visits the subtraction page", context do
        {:ok, view, _html} = live(context.conn, "/subtraction")
        {:ok, Map.put(context, :view, view)}
      end

      when_ "the user enters 10 and 3 and clicks subtract", context do
        html =
          context.view
          |> form("#subtraction-form", subtraction: %{number_1: "10", number_2: "3"})
          |> render_submit()

        {:ok, Map.put(context, :result_html, html)}
      end

      then_ "the user sees the result 7", context do
        assert render(context.view) =~ "7"
        :ok
      end
    end

    scenario "user subtracts resulting in a negative number" do
      given_ "the user visits the subtraction page", context do
        {:ok, view, _html} = live(context.conn, "/subtraction")
        {:ok, Map.put(context, :view, view)}
      end

      when_ "the user enters 3 and 8 and clicks subtract", context do
        html =
          context.view
          |> form("#subtraction-form", subtraction: %{number_1: "3", number_2: "8"})
          |> render_submit()

        {:ok, Map.put(context, :result_html, html)}
      end

      then_ "the user sees the result -5", context do
        assert render(context.view) =~ "-5"
        :ok
      end
    end

    scenario "user subtracts zero" do
      given_ "the user visits the subtraction page", context do
        {:ok, view, _html} = live(context.conn, "/subtraction")
        {:ok, Map.put(context, :view, view)}
      end

      when_ "the user enters 9 and 0 and clicks subtract", context do
        html =
          context.view
          |> form("#subtraction-form", subtraction: %{number_1: "9", number_2: "0"})
          |> render_submit()

        {:ok, Map.put(context, :result_html, html)}
      end

      then_ "the user sees the result 9", context do
        assert render(context.view) =~ "9"
        :ok
      end
    end
  end
end
