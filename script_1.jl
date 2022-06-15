using BenchmarkTools, DataFrames, DelimitedFiles, XLSX, ExcelFiles, Plots, LinearRegression, Plots.PlotMeasures
gr()

function input(prompt::String = "")
    print(prompt * " ")
    chomp(readline())
end

file_name = input("Nombre del archivo")
data_sheet = input("Hoja de trabajo")
data_range=input("Rango de celdas")
data_no_header=input("Rango de celdas sin nombre de columna")


#cargamos la hoja con header para tener los nombres de las columnas
data_header = XLSX.readdata(string(file_name), string(data_sheet), string(data_range))

#cargamos los datos sin los nombres, para formar una matríz
data = XLSX.readdata(string(file_name), string(data_sheet), string(data_no_header))

#convertimos cada columna a un arreglo para poder operar
matriz = convert(Matrix{Float64}, data)

#sacamos el inverso de cada elemento de los arreglos
mat_inv = 1 ./ matriz

#graficamos los arreglos 

sustrato = mat_inv[1:10]
control = mat_inv[11:20]
I = mat_inv[21:30]
X = mat_inv[31:40]
Y = mat_inv[41:50]
Z = mat_inv[51:60] 
array = [sustrato, control, I, X, Y, Z]


#_____________________________________________________________
plot(sustrato, control, label = "control")
scatter!(sustrato, control, label = false)

plot!(sustrato, I, label = "Inhibidor_I")
scatter!(sustrato, I, label = false)
#_____________________________________________________________
plot(sustrato, control, label = "control")
scatter!(sustrato, control, label = false)

plot!(sustrato, X, label = "Inhibidor_X")
scatter!(sustrato, X, label = false )
#_____________________________________________________________
plot(sustrato, control, label = "control")
scatter!(sustrato, control, label = false)

plot!(sustrato, Y, label = "Inhibidor_Y")
scatter!(sustrato, Y, label = false )
#_____________________________________________________________
plot(sustrato, control, label = "control")
scatter!(sustrato, control, label = false)

plot!(sustrato, Z, label = "Inhibidor_Z")
scatter!(sustrato, Z, label = false)
#_____________________________________________________________

p1 = plot(plot(sustrato, control, label = false),
scatter!(sustrato, control, label = false),
scatter!(sustrato, X, label = false))

p2 = plot(plot(sustrato, control, label = false),
scatter!(sustrato, control, label = false),
scatter!(sustrato, I, label = false))

p3 = plot(plot(sustrato, control, label = false),
scatter!(sustrato, control, label = false),
scatter!(sustrato, Y, label = false))

p4 = plot(plot(sustrato, control, label = false),
scatter!(sustrato, control, label = false),
scatter!(sustrato, Z, label = false))
          
fig = plot(p1, p2, p3, p4, layout=(2,2), fmt = :png, margin=-7mm, link = :x)

save = input("Deseas guardar la figura")

if save == "si" 
     png("layout.png") 
else 
    print("Ok")
end
       
include("Linear_regression.jl")


 











