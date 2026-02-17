defmodule MathTestProjectSpex.SubtractionPageExistsSpex do
  use SexySpex
  use MathTestProjectWeb.ConnCase
  import Phoenix.LiveViewTest

  import_givens MathTestProjectSpex.SharedGivens

  spex "A standalone subtraction page exists" do
    scenario "user can navigate to the subtraction page" do
      given_ "the user visits the subtraction page", context do
        {:ok, view, html} = live(context.conn, "/subtraction")
        {:ok, context |> Map.put(:view, view) |> Map.put(:html, html)}
      end

      then_ "the page loads successfully with a heading", context do
        assert context.html =~ "Subtraction"
        :ok
      end
    end

    scenario "the subtraction page displays a form for entering numbers" do
      given_ "the user visits the subtraction page", context do
        {:ok, view, _html} = live(context.conn, "/subtraction")
        {:ok, Map.put(context, :view, view)}
      end

      then_ "the page contains input fields for two numbers", context do
        assert has_element?(context.view, "input[name=\"subtraction[number_1]\"]")
        assert has_element?(context.view, "input[name=\"subtraction[number_2]\"]")
        :ok
      end

      then_ "the page contains a subtract button", context do
        assert has_element?(context.view, "button", "Subtract")
        :ok
      end
    end
  end
end
