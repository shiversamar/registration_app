class UsersController < ApplicationController
  def index
  end

  def register
    # #storing the user ID form the form
    user_id = params[:user_id]

    #storing the password from the form
    password = params[:password]

    # #  Pulls the attempted user_id and saves it to a variable
    #  user_id_check = params[:user_id]

    user = User.find_by_user_d(user_id)

    # Are the following true? if one is false then continue onto the nested if statement.
    # If even one is true then go to nested if statement
    if user_id.nil? || user_id.strip.empty? || password.nil? || password.strip.empty? || !user.nil?

      # if the user is nit or is nothing
      if user.nil?
      # User does not exist
      flash[:alert] = "Missing user ID or password"
      else
        flash[:alert] = "User ID taken, try another"
      end

      #render text: "Error"
      redirect_to "/"

    else
      @user = User.new
      @user.user_d = user_id.downcase
      @user.password = password
      @user.full_name = params[:full_name]
      @user.street_address = params[:street_address]
      @user.city = params[:city]
      @user.state = params[:state]
      @user.postal_code = params[:postal_code]
      @user.country = params[:country]
      @user.email = params[:email]
      @user.save

      if !(params[:phone1].nil? || params[:phone1].strip.empty?)

        phone = Phone.new
        phone.number = params[:phone1]
        # @user.phones << phone
        # above... a user has many 'phones' and we shovel in the .new phone.
        phone.user = @user
        # grab the .new 'new' phone object we join with the user (_id) with the (user) .id
        phone.save

      end

        # We have the if statement so that we can check whether the key value pair has a value
        if !(params[:phone2].nil? || params[:phone2].strip.empty?)

          phone2 = Phone.new
          phone2.number = params[:phone2]
          phone2.user = @user
          phone2.save

        end

        if !(params[:phone3].nil? || params[:phone3].strip.empty?)

          phone3 = Phone.new
          phone3.number = params[:phone3]
          phone3.user = @user
          phone3.save

        end

        render :confirmation
     end#if end




    end# register

    def login
      #storing the user ID from the form comes back with strings
      login_id = params[:login_user_id].downcase
      #storing the password from the form
      login_pass = params[:login_password]

      # By calling the "User" model we search the DB on the
      # user_d column for the login id that the user provided and then we assigned it a instance variable. It will retun an object.
      @user = User.find_by_user_d(login_id)
      # if login_pass are not matched to User it will stayed on the page
      if !@user.nil? && login_pass == @user.password
        render :login
      else
        # if not matched go to landing page "registration page"
        redirect_to "/"
        flash[:notice] = "Log in failed, try again"

      end # in of if statement

    end #end of login method


end#class
