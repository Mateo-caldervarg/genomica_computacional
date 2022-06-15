using LinearRegression

lr_control = linregress(sustrato, control)
lr_I = linregress(sustrato, I)
lr_X = linregress(sustrato, X)
lr_Y = linregress(sustrato, Y)
lr_Z = linregress(sustrato, Z)

array_control =  coef(lr_control)
array_I = coef(lr_I)
array_X = coef(lr_X)
array_Y = coef(lr_Y)
array_Z = coef(lr_Z)
total_array = [array_I, array_X, array_Y, array_Z]

for i in total_array
    if abs(i[1] - array_control[1]) < 0.001
        print("$i[1], Es inhibidor acompetitivo")
    end    
    if abs(i[2] - array_control[2]) < 0.001
        print("$i[1], Es inhibidor competitivo")
    end
end

function eq_compet(x)
    y = 0.0099*x .+ 0.0099
    return y
end

function eq_acompet(x)
     y = 0.029*x .+ 0.0099
    return y
end 

println("El inhibidor I es de tipo competitivo: Inhibidor Y es de tipo acompetitivo
         Km = -1/0.0012                         Km = -1/0.029
         Vmax = 1/0.0099                        Vmax = 1/0.0099
         
        El inhibidor Z es de tipo acompetitivo
        Km = -1/0.019
        Vmax = 1/0.012")

