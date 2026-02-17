defmodule MathTestProjectSpex.AdditionCalculationSpex do
  use SexySpex
  use MathTestProjectWeb.ConnCase
  import Phoenix.LiveViewTest

  import_givens MathTestProjectSpex.SharedGivens

  spex "The user can enter two numbers, hit plus and get the product" do
    scenario "user adds two positive numbers" do
      given_ "the user visits the addition page", context do
        {:ok, view, _html} = live(context.conn, "/addition")
        {:ok, Map.put(context, :view, view)}
      end

      when_ "the user enters 3 and 5 and clicks add", context do
        html =
          context.view
          |> form("#addition-form", addition: %{number_1: "3", number_2: "5"})
          |> render_submit()

        {:ok, Map.put(context, :result_html, html)}
      end

      then_ "the user sees the result 8", context do
        assert render(context.view) =~ "8"
        :ok
      end
    end

    scenario "user adds a negative and a positive number" do
      given_ "the user visits the addition page", context do
        {:ok, view, _html} = live(context.conn, "/addition")
        {:ok, Map.put(context, :view, view)}
      end

      when_ "the user enters -2 and 7 and clicks add", context do
        html =
          context.view
          |> form("#addition-form", addition: %{number_1: "-2", number_2: "7"})
          |> render_submit()

        {:ok, Map.put(context, :result_html, html)}
      end

      then_ "the user sees the result 5", context do
        assert render(context.view) =~ "5"
        :ok
      end
    end

    scenario "user adds two zeros" do
      given_ "the user visits the addition page", context do
        {:ok, view, _html} = live(context.conn, "/addition")
        {:ok, Map.put(context, :view, view)}
      end

      when_ "the user enters 0 and 0 and clicks add", context do
        html =
          context.view
          |> form("#addition-form", addition: %{number_1: "0", number_2: "0"})
          |> render_submit()

        {:ok, Map.put(context, :result_html, html)}
      end

      then_ "the user sees the result 0", context do
        assert render(context.view) =~ "0"
        :ok
      end
    end
  end
end
