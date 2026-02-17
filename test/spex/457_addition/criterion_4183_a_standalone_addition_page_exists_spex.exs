defmodule MathTestProjectSpex.AdditionPageExistsSpex do
  use SexySpex
  use MathTestProjectWeb.ConnCase
  import Phoenix.LiveViewTest

  import_givens MathTestProjectSpex.SharedGivens

  spex "A standalone addition page exists" do
    scenario "user can navigate to the addition page" do
      given_ "the user visits the addition page", context do
        {:ok, view, html} = live(context.conn, "/addition")
        {:ok, context |> Map.put(:view, view) |> Map.put(:html, html)}
      end

      then_ "the page loads successfully with a heading", context do
        assert context.html =~ "Addition"
        :ok
      end
    end

    scenario "the addition page displays a form for entering numbers" do
      given_ "the user visits the addition page", context do
        {:ok, view, _html} = live(context.conn, "/addition")
        {:ok, Map.put(context, :view, view)}
      end

      then_ "the page contains input fields for two numbers", context do
        assert has_element?(context.view, "input[name=\"addition[number_1]\"]")
        assert has_element?(context.view, "input[name=\"addition[number_2]\"]")
        :ok
      end

      then_ "the page contains an add button", context do
        assert has_element?(context.view, "button", "Add")
        :ok
      end
    end
  end
end
