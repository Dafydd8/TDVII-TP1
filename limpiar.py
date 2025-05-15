import csv
f = open('Provincias.csv', 'r')
out = open('script.txt', 'w')
for linea in csv.DictReader(f):
    id_provincia = linea['id_provincia']
    nombre = linea['nombre']
    poblacion_total = linea['poblacion_total'].replace('.', '')
    out.write(f'INSERT INTO Provincia (nombre, poblacion_total) VALUES (\'{nombre}\', {poblacion_total});\n')
f.close()
out.close()
