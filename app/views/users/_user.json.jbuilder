json.extract! user, :id, :email, :fname, :lname, :gender, :dob, :created_at, :updated_at
json.url user_url(user, format: :json)
