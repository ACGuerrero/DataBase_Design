import random,string
import numpy as np


def randomword(length):
   letters = string.ascii_lowercase
   return ''.join(random.choice(letters) for i in range(length))


def InsertDom(n):
    enc='utf-8'
    calles=np.genfromtxt('c_calles.txt',dtype='str',delimiter = '\n',encoding=enc)
    delegaciones=np.genfromtxt('c_delegaciones.txt',dtype='str',delimiter = '\n',encoding=enc)
    colonias=np.genfromtxt('c_colonias.txt',dtype='str',delimiter = '\n',encoding=enc)
    Sentencia='INSERT INTO domicilio(calle,numerointerior,numeroexterior,colonia,delegacion,codigopostal) VALUES ';
    with open('InsertDom.txt', 'w') as file:
        for i in range(n):
            k=random.choice(range(len(colonias)))
            codigopostal=('1%i%i%i%i' % (random.choice(np.arange(0,10)),(random.choice(np.arange(0,10))),(random.choice(np.arange(0,10))),(random.choice(np.arange(0,10))) ))
            file.write(Sentencia+"(\'%s\', \'%i \', \'%i \', \'%s\', \'%s\', \'%s\');\n" % ( random.choice(calles), random.choice(np.arange(1,300)), random.choice(np.arange(1,300)), colonias[k], delegaciones[k], codigopostal ) )
    return


def InsertTel(n):
    Sentencia='INSERT INTO telefono(telefono,id_ctipotel) VALUES ';

    with open('InsetTel.txt', 'w') as file:
            [file.write(Sentencia+"(\'55%i%i%i%i%i%i%i%i\',%i);\n" % (random.choice(np.arange(0,10)),random.choice(np.arange(0,10)),random.choice(np.arange(0,10)),random.choice(np.arange(0,10)),random.choice(np.arange(0,10)),random.choice(np.arange(0,10)),random.choice(np.arange(0,10)),random.choice(np.arange(0,10)), random.choice([1,2,3]) )) for i in range(n)]
    return

def InsertCorr(n):
    enc='utf-8'
    correos=np.genfromtxt('c_correos.txt',dtype='str',delimiter = '\n',encoding=enc)
    Sentencia='INSERT INTO correo_persona(correo) VALUES '

    with open('InsertCorr.txt', 'w') as file:
            [file.write(Sentencia+"(\'%s@%s.com\');\n" % ( randomword(8), random.choice(correos) ) ) for i in range(n)]
    return

def InsertPer(n,l,m): #l numero en que empieza id_domicilio #m numero en que empieza id_correo
    enc='utf-8'
    nombresf=np.genfromtxt('c_nombresf.txt',dtype='str',delimiter = '\n',encoding=enc)
    nombresm=np.genfromtxt('c_nombresm.txt',dtype='str',delimiter = '\n',encoding=enc)
    apellidos=np.genfromtxt('c_apellidos.txt',dtype='str',delimiter = '\n',encoding=enc)
    Sentencia='INSERT INTO persona(app,apm,nombre,fechanacimiento,id_sexo,id_domicilio,id_correo) VALUES ';
    with open('InsertPer.txt', 'w') as file:
        for i in range(n):
            region=[range(3,5),range(5,7),range(7,10)]
            decada=random.choice(random.choices(region,weights=(10,40,50))[0])
            anonacimiento=('19%i%i' % (decada, random.choice(range(10))))
            anonacimiento=int(anonacimiento)
            sexo=random.choice([1,2])
            if (sexo==1):
                file.write(Sentencia+"(\'%s\',\'%s\',\'%s\',\'%i/%i/%i\',\'%i\',\'%i\',\'%i\');\n" % ( random.choice(apellidos), random.choice(apellidos), random.choice(nombresf), random.choice(np.arange(1,28)),random.choice(np.arange(1,13)), anonacimiento, sexo, i+l , i+m))
            else:
                file.write(Sentencia+"(\'%s\',\'%s\',\'%s\',\'%i/%i/%i\',\'%i\',\'%i\',\'%i\');\n" % ( random.choice(apellidos), random.choice(apellidos), random.choice(nombresm), random.choice(np.arange(1,28)),random.choice(np.arange(1,13)), anonacimiento, sexo, i+l , i+m))
    return