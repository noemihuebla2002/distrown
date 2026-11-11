# # # # =====================================================
# # # # EXAMEN PARCIAL 1 - SIMULACIÓN
# # # # Carrera de Estadística
# # # # =====================================================
# # #
# # # # Sea X una variable aleatoria continua con función de densidad:
# # #
# # # #                2(x-a)
# # # # f(x) = ------------------- ,  a < x < b
# # # #          (b-a)^2
# # # #
# # # # f(x) = 0 , caso contrario
# # #
# # # # =====================================================
# # # # PREGUNTA 1
# # # # =====================================================
# # #
# # # # Crear una función llamada "aleatorios" que genere
# # # # números aleatorios mediante el método de la inversa.
# # #
# # # # Se genera una variable uniforme U~U(0,1).
# # # # Luego se aplica la función inversa obtenida a partir
# # # # de la función de distribución acumulada.
# # #
# # # aleatorios <- function(n, a, b){
# # #
# # #   # Genera n números uniformes entre 0 y 1
# # #   u <- runif(n)
# # #
# # #   # Transformación inversa
# # #   a + sqrt(u)*(b-a)
# # # }
# # #
# # # # Generar una muestra de tamaño 1000
# # # # usando a = 1 y b = 10
# # #
# # # muestra <- aleatorios(n = 1000, a = 1, b = 10)
# # #
# # # # =====================================================
# # # # PREGUNTA 2
# # # # =====================================================
# # #
# # # # Crear una función llamada "probs"
# # # # que permita calcular probabilidades teóricas.
# # #
# # # # Función de densidad
# # #
# # # fx <- function(x, a, b){
# # #
# # #   ifelse(
# # #     x >= a & x <= b,
# # #     (2*(x-a))/(b-a)^2,
# # #     0
# # #   )
# # #
# # # }
# # #
# # # # La función probs calcula probabilidades
# # # # acumuladas a izquierda:
# # # #
# # # # P(X <= q)
# # #
# # # probs <- function(q, a, b){
# # #
# # #   integrate(
# # #     fx,
# # #     a,
# # #     q,
# # #     a = a,
# # #     b = b
# # #   )$value
# # #
# # # }
# # #
# # # # =====================================================
# # # # PREGUNTA 3
# # # # =====================================================
# # #
# # # # Graficar el histograma de la muestra
# # # # y ajustar la curva teórica.
# # #
# # # # Valores donde se calcularán las probabilidades
# # # # acumuladas.
# # #
# # # xval <- 1:10
# # #
# # # # Vector vacío para guardar probabilidades acumuladas
# # #
# # # cumProbs <- NULL
# # #
# # # # Calcular F(x) para cada valor
# # #
# # # for(i in 1:length(xval)){
# # #
# # #   cumProbs[i] <- probs(
# # #     xval[i],
# # #     a = 1,
# # #     b = 10
# # #   )
# # #
# # # }
# # #
# # # # Obtener probabilidades entre intervalos
# # # # mediante diferencias sucesivas.
# # #
# # # probabilidades <- diff(cumProbs)
# # #
# # # # Histograma de la muestra simulada
# # #
# # # hist(
# # #   muestra,
# # #   probability = TRUE,
# # #   main = "",
# # #   xlab = "",
# # #   ylab = ""
# # # )
# # #
# # # # Agregar la densidad teórica
# # #
# # # curve(
# # #   fx(x, a = 1, b = 10),
# # #   add = TRUE,
# # #   col = "red"
# # # )
# # #
# # # # Interpretación:
# # # #
# # # # Las barras representan las frecuencias observadas
# # # # de la muestra generada.
# # # #
# # # # La línea roja representa la función de densidad
# # # # teórica.
# # # #
# # # # Si ambas son parecidas, la simulación reproduce
# # # # adecuadamente la distribución propuesta.
# # #
# # # # =====================================================
# # # # PREGUNTA 4
# # # # =====================================================
# # #
# # # # Realizar una prueba de bondad de ajuste
# # # # Chi-cuadrado.
# # #
# # # library(fdth)
# # #
# # # # Construir tabla de frecuencias
# # #
# # # tfr <- fdt(
# # #   muestra,
# # #   start = 1,
# # #   end = 10,
# # #   h = 1
# # # )
# # #
# # # # Extraer frecuencias observadas
# # #
# # # fa <- tfr$table$f
# # #
# # # # Aplicar prueba Chi-cuadrado
# # #
# # # chisq.test(
# # #   fa,
# # #   p = probabilidades
# # # )
# # #
# # # # Resultado obtenido:
# # # #
# # # # X-squared = 6.7032
# # # # df = 8
# # # # p-value = 0.569
# # # #
# # # # Interpretación:
# # # #
# # # # H0: La muestra proviene de la distribución propuesta.
# # # #
# # # # H1: La muestra NO proviene de la distribución propuesta.
# # # #
# # # # Como el p-value = 0.569 es mayor que 0.05,
# # # # no se rechaza H0.
# # # #
# # # # Concluimos que los datos simulados son
# # # # compatibles con la distribución teórica.
# # #
# # # # =====================================================
# # # # FIN DEL EJERCICIO
# # # # =====================================================
# #
# # # =====================================================
# # # PRÁCTICA 1 - SIMULACIÓN
# # # Carrera de Estadística
# # # =====================================================
# #
# # # Sean X1, X2, ..., Xn variables aleatorias
# # # independientes e idénticamente distribuidas
# # # con distribución Exponencial de parámetro λ.
# #
# # # Función de densidad:
# #
# # # f(x) = λe^(-λx) , x >= 0
# # # f(x) = 0         , caso contrario
# #
# # # =====================================================
# # # PROPIEDAD UTILIZADA
# # # =====================================================
# #
# # # Si sumamos n variables exponenciales
# # # independientes con el mismo parámetro λ:
# #
# # # X1 + X2 + ... + Xn
# #
# # # entonces la suma sigue una distribución Gamma.
# #
# # # Es decir:
# #
# # # ΣXi ~ Gamma(k = n, θ = 1/λ)
# #
# # # donde:
# #
# # # k = parámetro de forma (shape)
# # # θ = parámetro de escala (scale)
# #
# # # En este ejercicio queremos generar datos de una:
# #
# # # Gamma(k = 10, θ = 1/2)
# #
# # # =====================================================
# # # PASO 1
# # # =====================================================
# #
# # # Crear una función llamada randomgamma
# # # que genere números aleatorios Gamma
# # # utilizando la suma de variables Exponenciales.
# #
# # # k     = parámetro de forma
# # # theta = parámetro de escala
# #
# # randomgamma <- function(n, k, theta){
# #
# #   # Crear una matriz vacía
# #   # n filas y k columnas
# #
# #   mat <- matrix(
# #     NA,
# #     n,
# #     k
# #   )
# #
# #   # Generar k variables exponenciales
# #
# #   for(i in 1:k){
# #
# #     mat[,i] <- rexp(
# #       n,
# #       rate = 1/theta
# #     )
# #
# #   }
# #
# #   # Sumar cada fila
# #   # para obtener una Gamma
# #
# #   rowSums(mat)
# #
# # }
# #
# # # =====================================================
# # # INTERPRETACIÓN DEL ALGORITMO
# # # =====================================================
# #
# # # Como una Gamma puede construirse
# # # sumando k variables exponenciales,
# # # generamos k columnas de datos
# # # exponenciales y luego sumamos
# # # cada fila.
# #
# # # Esa suma produce observaciones
# # # con distribución Gamma(k, theta).
# #
# # # =====================================================
# # # PASO 2
# # # =====================================================
# #
# # # Generar una muestra de tamaño 1000
# # # proveniente de una distribución
# # # Gamma(k = 10, theta = 1/2)
# #
# # mgamma <- randomgamma(
# #   n = 1000,
# #   k = 10,
# #   theta = 1/2
# # )
# #
# # # =====================================================
# # # PASO 3
# # # =====================================================
# #
# # # Dibujar un histograma de la muestra
# # # generada y superponer la curva
# # # teórica Gamma.
# #
# # hist(
# #   mgamma,
# #   probability = TRUE,
# #   main = "Gamma(k=10, theta = 1/2)",
# #   xlab = "",
# #   ylab = "",
# #   col = "skyblue"
# # )
# #
# # # Agregar la densidad teórica
# #
# # curve(
# #   dgamma(
# #     x,
# #     shape = 10,
# #     scale = 1/2
# #   ),
# #   add = TRUE,
# #   col = "red",
# #   lwd = 1.5
# # )
# #
# # # Interpretación:
# # #
# # # Las barras azules representan
# # # la distribución observada de la muestra.
# # #
# # # La línea roja representa
# # # la distribución Gamma teórica.
# # #
# # # Si ambas formas son parecidas,
# # # significa que la simulación
# # # está funcionando correctamente.
# #
# # # Histograma y curva teórica mostrados en el documento. ![EMBEDDEDIMAGE](placeholder-0) 【1-ffb76e】
# #
# # # =====================================================
# # # PASO 4
# # # =====================================================
# #
# # # Realizar prueba de bondad de ajuste
# # # Chi-cuadrado para verificar si los datos
# # # realmente siguen una Gamma(10, 1/2).
# #
# # library(fdth)
# #
# # # Construir tabla de frecuencias
# #
# # tfr <- fdt(
# #   mgamma,
# #   start = 0,
# #   end = 18,
# #   h = 2
# # )
# #
# # # Frecuencias observadas
# #
# # fa <- tfr$table$f
# #
# # # Límites de clase
# #
# # xval <- c(
# #   seq(0,16,2),
# #   Inf
# # )
# #
# # # Probabilidades acumuladas teóricas
# #
# # cumprobs <- pgamma(
# #   xval,
# #   shape = 10,
# #   scale = 1/2
# # )
# #
# # # Probabilidades teóricas por intervalo
# #
# # probs <- diff(cumprobs)
# #
# # # Prueba Chi-cuadrado
# #
# # chisq.test(
# #   fa,
# #   p = probs
# # )
# #
# # # =====================================================
# # # RESULTADO OBTENIDO
# # # =====================================================
# #
# # # X-squared = 7.962
# # # df = 8
# # # p-value = 0.4372
# #
# # # =====================================================
# # # INTERPRETACIÓN DEL RESULTADO
# # # =====================================================
# #
# # # Hipótesis nula (H0):
# # # Los datos provienen de una
# # # distribución Gamma(10, 1/2).
# #
# # # Hipótesis alternativa (H1):
# # # Los datos NO provienen de una
# # # distribución Gamma(10, 1/2).
# #
# # # Como:
# #
# # # p-value = 0.4372
# #
# # # y
# #
# # # 0.4372 > 0.
# ########################3
#
# # =====================================================
# # PRÁCTICA DE LABORATORIO
# # GENERADORES CONGRUENCIALES Y NÚMEROS
# # PSEUDOALEATORIOS
# # =====================================================
#
# # Asignatura: Simulación
#
# # =====================================================
# # 1. PLANTEAMIENTO
# # =====================================================
#
# # Considere el siguiente generador congruencial
# # lineal mixto:
#
# # Xi+1 = (13Xi + 7) mod 4096
#
# # donde:
#
# # a = 13  (multiplicador)
# # c = 7   (incremento)
# # m = 4096 (módulo)
#
# # =====================================================
# # ACTIVIDAD 1
# # GENERACIÓN DE NÚMEROS PSEUDOALEATORIOS
# # =====================================================
#
# # Implementar en R el generador congruencial.
#
# # Generar una muestra de 5000 números
# # pseudoaleatorios.
#
# # Semilla inicial:
#
# # X0 = 2026
#
# seed <- 2026
#
# muestra <- replicate(
#
#   5000,
#
#   {
#
#     # Aplicación del generador congruencial
#
#     seed <<- ((13 * seed) + 7) %% 4096
#
#     # Transformación al intervalo (0,1)
#
#     seed / 4096
#
#   }
#
# )
#
# # =====================================================
# # INTERPRETACIÓN
# # =====================================================
#
# # En cada iteración se genera un nuevo valor Xi.
#
# # Luego se divide para el módulo m = 4096.
#
# # De esta manera se obtiene:
#
# # Ui = Xi / 4096
#
# # obteniendo números pseudoaleatorios
# # entre 0 y 1.
#
# # =====================================================
# # ACTIVIDAD 2
# # PRUEBA DE BONDAD DE AJUSTE
# # =====================================================
#
# # Verificar si la muestra generada
# # sigue una distribución Uniforme U(0,1).
#
# # Nivel de significancia:
#
# # α = 0.05
#
# library(fdth)
#
# # Probabilidades teóricas
#
# probs <- rep(0.1,10)
#
# # Como existen 10 intervalos,
# # cada intervalo debe tener
# # probabilidad 0.1
#
# # Construcción de frecuencias
#
# tfr <- fdt(
#   muestra,
#   start = 0,
#   end = 1,
#   h = 0.1
# )
#
# # Frecuencias observadas
#
# fabs <- tfr$table$f
#
# # Aplicar prueba Chi-cuadrado
#
# chisq.test(
#   fabs,
#   p = probs
# )
#
# # =====================================================
# # RESULTADOS
# # =====================================================
#
# # X-squared = 1.416
#
# # df = 9
#
# # p-value = 0.9977
#
# # =====================================================
# # INTERPRETACIÓN
# # =====================================================
#
# # Hipótesis nula (H0):
# #
# # Los datos siguen una distribución
# # Uniforme U(0,1).
#
# # Hipótesis alternativa (H1):
# #
# # Los datos NO siguen una distribución
# # Uniforme U(0,1).
#
# # Como:
#
# # p-value = 0.9977
#
# # y
#
# # 0.9977 > 0.05
#
# # No se rechaza H0.
#
# # Conclusión:
#
# # No existe evidencia estadí
