class ApplicationController < ActionController::Base
    def blank_square_form
        render({ :template => "calculation_templates/square_form.html.erb"})
    end

    def calculate_square
        @num = params.fetch("number").to_f
        @squared_num = @num ** 2

        render({ :template => "calculation_templates/square_results.html.erb"})
    end

    def blank_root_form
        render({ :template => "calculation_templates/root_form.html.erb"})
    end

    def calculate_root
        @num = params.fetch("user_number").to_f
        @root_num = @num ** 0.5

        render({ :template => "calculation_templates/root_results.html.erb"})
    end

    def blank_payment_form
        render({ :template => "calculation_templates/payment_form.html.erb"})
    end

    def calculate_payment
        @apr = params.fetch("user_apr").to_f
        @apr_percent = @apr/100
        @num_years = params.fetch("user_years").to_f
        @principal = params.fetch("user_pv").to_f
        @result = ((@apr_percent/12)*@principal)/(1-((1+(@apr_percent/12))**(-12*@num_years)))

        render({ :template => "calculation_templates/payment_results.html.erb"})
    end

    def blank_random_form
        render({ :template => "calculation_templates/random_form.html.erb"})
    end

    def calculate_random
        @lower = params.fetch("user_min").to_f
        @upper = params.fetch("user_max").to_f
        @rand_num = rand(@lower..@upper)

        render({ :template => "calculation_templates/random_results.html.erb"})
    end
end
