import csv
import random
f = open('hce_genera.csv', 'r', encoding='utf-8')
f2 = open('populate_hce_generacion.sql', 'r', encoding='utf-8')   
out = open('script.txt', 'w', encoding='utf-8')
ids_validos = []
for linea in csv.DictReader(f):
    id_hce = linea['id_hce']
    farmacias_asociadas = linea['farmacias_asociadas']
    if id_hce not in ids_validos:
        ids_validos.append(id_hce)
    

for i in range(23):
    decidir = random.choices([1, 0, 2, 3], weights=[0.25, 0.25, 0.25, 0.25])[0]
    elemento = random.choice(ids_validos)
    ids_validos.remove(elemento)
    s1 = f'INSERT INTO HCEGeneraPrepagas (id_HCE) VALUES ({elemento});\n'
    s2 = f'INSERT INTO HCEGeneraObrasSociales (id_HCE) VALUES ({elemento});\n'
    if decidir == 0:
        out.write(s1)
    elif decidir == 1:
        out.write(s2)
    elif decidir == 2:
        out.write(s1)
        out.write(s2)
f.close()
f2.close()
out.close()

