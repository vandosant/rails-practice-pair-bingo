feature "managing pairings" do

  scenario "create and view a pairing" do
    user = create_user(email: "user@example.com")

    create_user(
      email: "otheruser@example.com",
      name: "Other User",
      photo_name: "face-01.jpeg"
    )

    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"

    within "div.user", match: :first do
      click_link "Face 01"
    end

    fill_in "When did you pair with Other User?", with: "04-08-2014"
    click_button "Create Pairing"

    expect(page).to have_content "8/4/2014"
    within "div.user", match: :first do
      expect(page).to_not have_link "Face 01"
    end
  end
end