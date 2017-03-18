json.email @user.email
json.authentication_token @user.user_tokens.current[0].authentication_token
json.refresh_token @user.user_tokens.current[0].refresh_token