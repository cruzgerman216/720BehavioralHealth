
[1mFrom:[0m /mnt/g/rails-project/behavioralhealth/app/controllers/sessions_controller.rb:16 SessionsController#create:

    [1;34m14[0m: [32mdef[0m [1;34mcreate[0m 
    [1;34m15[0m:     puts [31m[1;31m"[0m[31mtest[1;31m"[0m[31m[0m
 => [1;34m16[0m:     binding.pry
    [1;34m17[0m:     user = [1;34;4mUser[0m.find_by([35musername[0m: params[[33m:user[0m][[33m:username[0m])
    [1;34m18[0m: 
    [1;34m19[0m:     [32mif[0m user && user.authenticate(params[[33m:user[0m][[33m:password[0m])
    [1;34m20[0m:         session[[33m:user_id[0m] = user.id
    [1;34m21[0m:         redirect_to user_path(user)
    [1;34m22[0m:     [32melse[0m
    [1;34m23[0m:         flash[[33m:message[0m] = [31m[1;31m"[0m[31mIncorrect login info. Please Try Again.[1;31m"[0m[31m[0m
    [1;34m24[0m:         redirect_to login_path
    [1;34m25[0m:     [32mend[0m
    [1;34m26[0m: [32mend[0m

