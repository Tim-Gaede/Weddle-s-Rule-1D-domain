#-------------------------------------------------------------------------------
function ∫(f, x_min, x_max, hextets)
# Integrates by Weddle's Rule
    width_segment = (x_max - x_min) / 6hextets

    cnt_max = 6hextets - 1

    weighted_sum = f(x_min)
    for cnt = 1 : cnt_max
        x = x_min + cnt*width_segment

        mod = cnt % 6
        if     (mod == 2 || mod == 4)  coeff = 1
        elseif (mod == 1 || mod == 5)  coeff = 5
        elseif (mod == 3)              coeff = 6
        else                           coeff = 2
        end

        weighted_sum += coeff*f(x)
    end
    weighted_sum += f(x_max)


    (3/10)*weighted_sum * width_segment
end
#-------------------------------------------------------------------------------





#-------------------------------------------------------------------------------
function norm(x, μ, σ)
    exp(-(x-μ)^2 / 2σ^2) / √(2π*σ^2)
end
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
function distr(x)
    μ = 100
    σ = 15

    norm(x, μ, σ)
end
#-------------------------------------------------------------------------------


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function main()
    println("hextets       Integration")
    for p = 0 : 6
        hxts = 2^p
        println(lpad(hxts, 4), "      ", ∫(distr, 100, 115, hxts))
    end
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
main()
