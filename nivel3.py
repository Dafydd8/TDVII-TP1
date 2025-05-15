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
f = open('efectores.csv', 'r', encoding='utf-8')
out = open('script.txt', 'w', encoding='utf-8')
for linea in csv.DictReader(f):
    valor = random.choices([1, 0], weights=[0.6, 0.4])[0]
    refes = linea['cod_refes']
    nombre = linea['nombre']
    id_prov = linea['id_prov']
    nivel = linea['nivel'].replace('\"', '')
    if valor == 1:
        tipo = '\'Alta Tecnología\''
    else:
        tipo = '\'Instituto Especializado\''
    if nivel == 'Tercer Nivel':
        comando = f'INSERT INTO EfectorTercerNivel (cod_refes, tipo) VALUES ({refes},{tipo});\n'
        out.write(comando)
f.close()
out.close()
