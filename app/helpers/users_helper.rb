module UsersHelper
    def display_role 
        content_tag(:h2,"Current Role #{current_user.role.split("_").join(" ").titleize}")
    end
end
