require 'rails_helper'

RSpec.feature "RegistrationUsers", type: :feature do
  context "Landing page" do
    Steps "Going to the landing page" do
      Given "I visit the local Host 3000" do
        visit "/"
      end
      Then "I see a welcome message" do
        expect(page).to have_content("Welcome")
      end

      And "I can enter information" do
        fill_in 'full_name', with: 'Amar S'
        fill_in 'street_address', with: 'Oceanside'
        fill_in 'city', with: 'San Diego'
        fill_in 'state', with: 'CA'
        fill_in 'postal_code', with: '11111'
        fill_in 'country', with: 'USA'
        fill_in 'email', with: 'someone@somewhere.com'
        fill_in 'user_id', with: 'Tommy'
        fill_in 'password', with: 'Arcade'
        click_button 'Register'
      end

    end # end of steps
  end # end of context

  context "I can register" do
    Steps " " do
      Given "I visit the local Host 3000" do
        visit "/"
      end

      Then "I can register" do
      fill_in 'user_id', with: 'Tommy'
      fill_in 'password', with: 'Arcade'
      click_button 'Register'
      end

      And "I am taken to the registration page" do
        expect(page).to have_content("You've been registered")
      end
    end # end steps
  end # end context

  context "Registrering without the required data" do
    Steps "Filling out the form without required inputs" do
      Given "I'am on the landing page" do
        visit "/"
      end# 2nd Given


      Then " I can fill out registration form without required inputs" do
      fill_in 'full_name', with: 'Rudy@Amar'
      fill_in 'street_address', with: '124 way street'
      fill_in 'city', with: 'Oceanside'
      fill_in 'state', with: 'CA'
      fill_in 'postal_code', with: '12345'
      fill_in 'country', with: 'United State'
      click_button 'Register'
      end

      And "I see error page" do
      expect(page).to have_content("Missing user ID or password")
      end
    end# End of 2nd steps
  end# End of 2nd Context

    context "I am able to Log in with the previoius credentials" do

      Steps "Going to the landing page" do

        Given "I visit the local Host 3000" do
          visit "/"
        end

        And "I can register" do
          fill_in 'user_id', with: 'Tommy'
          fill_in 'password', with: 'Arcade'
          click_button 'Register'
        end

        Then "I am taken back to the landing/login page" do
          visit "/"
          fill_in 'login_user_id', with: 'Tommy'
          fill_in 'login_password', with: 'Arcade'
          click_button 'Log In'
        end

        And "User is taken to the LOGIN page" do
          expect(page).to have_content("Welcome back")
        end

      end # end of steps
    end #end of context

    context "I am able to fill in the phone information" do
      Steps "Going to the landing page" do
        Given "I visit the local Host 3000" do
          visit "/"
        end# end of Given

        And "I am able to fill in phones and register" do
          fill_in 'phone1', with: 1234
          fill_in 'phone2', with: 5678
          fill_in 'phone3', with: 9101
          fill_in 'user_id', with: 'Tommy'
          fill_in 'password', with: 'Arcade'
          click_button 'Register'
        end
      end# end of steps
    end# end of context



    context " I cannot register with a user ID that is already in use"do
      Steps "if the user ID us taken, I am taken back to the registration" do
        Given "I visit the local Host 3000" do
          visit "/"
        end # end of Given

        And "if the user ID is not taken I can fill in " do
          fill_in 'user_id', with: 'Tommy'
          fill_in 'password', with: 'Arcade'
          click_button 'Register'
          expect(page).to have_content("You've been registered!")
        end

        Then " " do
        visit "/"
      end

      then " " do
        fill_in 'user_id', with: 'Tommy'
        fill_in 'password', with: 'Arcade'
        click_button 'Register'
        expect(page).to have_content("User ID taken, try another")
      end

        #
        # Then " if the user ID is taken" do
        #   visit "/"
        #   fill_in 'user_id', with: 'Tommy'
        #   fill_in 'password', with: 'Arcade'
        #   click_button 'Register'
        #   visit "/"
        #   expect(page).to have_content("User ID taken, try another")
        # end# end of Then



        # And " You cannot log in " do
        #   expect(page).to have_content("User ID taken, try another")
        #   # expect(page).to have_content("Missing user ID or password")
        # end





      end# end of Steps
    end# end of context








end # end of rspec
# Story: As a registered user, I can login into the web site by providing user ID and password. If log in is successful, I am taken to a page saying "Hello <user ID>".
