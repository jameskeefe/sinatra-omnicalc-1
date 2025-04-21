require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/square/") do
  @num = params[:number].to_f
  @calc = @num**2
  erb(:square_results)
end

get("/square_root/") do
  @num = params[:user_number].to_f
  @calc = @num**(1.0/2.0)
  erb(:square_root_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square/new") do
  erb(:square)
end

get("/random/new") do
  erb(:random)
end

get("/random/") do

  @min = params[:user_min].to_f
  @max = params[:user_max].to_f

  @calc = rand(@min..@max)

  erb(:random_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/") do

  @r = ((params[:user_apr].to_f))
  @pv = (params[:user_pv].to_f)
  @n = (params[:user_years].to_i)

  rmonth = (@r/100.0)/12.0
  n2 = @n*12

  @num = rmonth*@pv
  @den = 1 - ((1+rmonth)**-n2)
  @calc = @num/@den

  erb(:payment_results)

end
