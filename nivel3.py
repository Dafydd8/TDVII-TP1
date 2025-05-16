# f = open('populate_efectores.sql', 'r', encoding='utf-8')
# #out = open('script.txt', 'w', encoding='utf-8')
# s ='INSERT INTO EfectorDeSalud (nombre, id_prov, nivel) VALUES '
# for linea in f:
#     aux = linea[59:].strip().replace(');', '').replace('(', '')
#     elems = aux.split(', ')
#     nombre = elems[0]
#     id_prov = elems[1]
#     nivel = elems[2]
#     if nivel == '\'Tercer Nivel\'':
#         comando = f'INSERT INTO EfectorTercerNivel (nombre, id_prov, nivel) VALUES (\'{nombre}\', {id_prov}, \'{nivel}\');'

# f.close()
import random
import csv
f = open('hce.csv', 'r', encoding='utf-8')
out = open('script.txt', 'w', encoding='utf-8')
for linea in csv.DictReader(f):
    valor = random.choices([1, 0], weights=[0.7, 0.3])[0]
    id = linea['id_hce']
    "nombre","id_prov","tipo_gestion","tipo_desarrollo","gestion_estudios","generacion_receta_digital"
    nombre = linea['nombre']
    id_prov = linea['id_prov']
    genera = linea['generacion_receta_digital'].replace('\"', '')
    if valor == 1:
        tipo = '\'Públicas\''
    else:
        tipo = '\'Todas\''
    if genera == 'Genera':
        comando = f'INSERT INTO HCEGeneraReceta (id_HCE, farmacias_asociadas) VALUES ({id},{tipo});\n'
        out.write(comando)
f.close()
out.close()
