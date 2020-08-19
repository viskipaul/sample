
def visit_login_page 
    click_on 'Log in'
end

def visit_register_page
    click_on 'Sign up now!'
end

def login_user
    visit_login_page
    fill_in 'session_email', with: 'login@test.com'
    fill_in 'session_password', with: 'login_test'
    find('[name="commit"]').click
end

def register_user
    visit_register_page
    fill_in 'user_name', with: 'RegisterTest'
    fill_in 'user_email', with: 'register@test11.com'
    fill_in 'user_password', with: 'register_test'
    fill_in 'user_password_confirmation', with: 'register_test'
    find('[name="commit"]').click
end

def visit_user_update_page
    login_user
    click_on "Account"
    click_on "Settings"
end