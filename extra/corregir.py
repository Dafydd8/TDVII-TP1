f = open('populate_hce.sql', 'r', encoding='utf-8')
out = open('script.txt', 'w', encoding='utf-8')
s = ''
for linea in f:
    s+= linea.strip()
s = s.replace(';', ';\n')
out.write(s)
f.close()
out.close()
