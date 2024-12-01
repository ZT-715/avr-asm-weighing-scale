space = 1024
end_value = 5.0

step = end_value / space

LUT = [x * step for x in range(0, space)]

with open("LUT.asm", "w") as file:
    file.write(".cseg\nLUT_kg: .db ")
    for i in LUT:
        kg_string = f'"{str(round(i, 3)).ljust(6)}", '
        file.write(kg_string)
    file.write('"OVRW-"\nLUT_lb: .db ')
    for i in LUT:
        lb_string = f'"{str(round(i * 2.20462, 3)).ljust(6)}", '
        file.write(lb_string)
    file.write('"OVRW-"\n')

