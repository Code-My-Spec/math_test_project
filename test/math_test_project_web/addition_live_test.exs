defmodule MathTestProjectWeb.AdditionLiveTest do
  use MathTestProjectWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "mount/3" do
    test "renders the addition page with heading", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/addition")

      assert has_element?(view, "h1", "Addition")
    end

    test "renders the addition form with correct id", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/addition")

      assert has_element?(view, "form#addition-form")
    end

    test "renders number input fields with correct names", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/addition")

      assert has_element?(view, "input[name='addition[number_1]']")
      assert has_element?(view, "input[name='addition[number_2]']")
    end

    test "renders submit button with correct text", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/addition")

      assert has_element?(view, "button", "Add")
    end
  end

  describe "handle_event calculate" do
    test "calculates sum of two positive numbers", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/addition")

      result_html =
        view
        |> form("#addition-form", addition: %{number_1: "3", number_2: "5"})
        |> render_submit()

      assert result_html =~ "8"
    end

    test "calculates sum of negative numbers", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/addition")

      result_html =
        view
        |> form("#addition-form", addition: %{number_1: "-5", number_2: "3"})
        |> render_submit()

      assert result_html =~ "-2"
    end

    test "calculates sum of decimal numbers", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/addition")

      result_html =
        view
        |> form("#addition-form", addition: %{number_1: "1.5", number_2: "2.5"})
        |> render_submit()

      assert result_html =~ "4"
    end

    test "calculates sum with zero", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/addition")

      result_html =
        view
        |> form("#addition-form", addition: %{number_1: "0", number_2: "7"})
        |> render_submit()

      assert result_html =~ "7"
    end
  end
end
