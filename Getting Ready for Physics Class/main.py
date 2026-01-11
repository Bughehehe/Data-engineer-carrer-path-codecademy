c = 3E8

def f_to_c(f_temp):
    return (f_temp - 32) * 5/9


def c_to_f(c_temp):
    return (c_temp * 9/5) + 32


def get_force(mass, acceleration):
    return mass * acceleration


def get_energy(mass, c=c):
    return mass * c ** 2


def get_work(mass, acceleration, distance):
    force = get_force(mass, acceleration)
    return force * distance


print(f"The GE train supplies {get_force(100, 10)} Newtons of force.")
print(f"A 1kg bomb supplies {get_energy(1)} Joules.")
print(f"The GE train does {get_work(20, 10, 5)} Joules of work over {5} meters.")