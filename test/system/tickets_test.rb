require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
  end

  test "visiting the index" do
    visit tickets_url
    assert_selector "h1", text: "Tickets"
  end

  test "should create ticket" do
    visit tickets_url
    click_on "New ticket"

    fill_in "Description", with: "My new ticket"
    fill_in "Title", with: "My new ticket title"
    click_on "Create Ticket"

    sleep 1

    assert_equal "My new ticket title", Ticket.last.title
    assert_equal "My new ticket", Ticket.last.description
  end

  test "should update Ticket" do
    visit ticket_url(@ticket)
    click_on "Edit this ticket", match: :first

    updated_title = "this is a test title"
    updated_description = "this is a test description"

    fill_in "Title", with: updated_title
    fill_in "Description", with: updated_description
    click_on "Update Ticket"
    sleep 1

    @ticket.reload

    assert_equal updated_description, @ticket.description
    assert_equal updated_title, @ticket.title
  end

  test "should destroy Ticket" do
    visit ticket_url(@ticket)
    accept_confirm { click_on "Destroy this ticket", match: :first }

    assert_text "Ticket was successfully destroyed"
  end
end
