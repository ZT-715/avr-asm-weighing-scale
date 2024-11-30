space = 1024
end_value = 5.0

step = end_value / space

LUT = [x * step for x in range(0, space)]

with open("LUT.asm", "w") as file:
    file.write(".cseg\nLUT_kg:\n")
    for i in LUT:
        file.write('"' + str(round(i,3))+ 'A", ')
    file.write('"OVRW-A"\nLUT_lb:\n')
    for i in LUT:
        file.write('"' + str(round(i* 2.20462,3)) + 'A", ')
    file.write('"OVRW-A"\n')

