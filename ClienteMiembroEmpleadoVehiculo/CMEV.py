import numpy as np
from random import choice
import string
 
    

def InsertMiembro(n,l): #l donde empieza persona
    Sentencia='INSERT INTO miembro(id_persona,vigencia,nonomina) VALUES '
    with open('InsertMiembro.txt', 'w') as file:
        for i in range(n):
            sucursal=choice(range(1,33))
            nonomina=choice(range(4*sucursal-3,sucursal*4+1))
            vigencia=('%i/%i/2021' %  (choice(range(1,28)),choice(range(1,13))) )
            file.write( Sentencia+"( %i, \'%s\',%i );\n" % ( i+l, vigencia,nonomina ) )
    return


def Insertmiembro_telefono(n,l,m): #l en donde empiezan miembros, m en donde empiezan telefonos
    Sentencia='INSERT INTO miembro_telefono (id_miembro, id_telefono) VALUES '
    with open('Insertmiembro_telefono.txt', 'w') as file:
        [file.write(Sentencia+"(\'%i\',\'%i\');\n" % ( i+l, i+m)) for i in range(n)]
    return

def Insertcliente_telefono(n,l,m): #l en donde empiezan miembros, m en donde empiezan telefonos
    Sentencia='INSERT INTO cliente_telefono (id_cliente, id_telefono) VALUES '
    with open('Insertcliente_telefono.txt', 'w') as file:
        [file.write(Sentencia+"(\'%i\',\'%i\');\n" % ( i+l, i+m)) for i in range(n)]
    return

def InsertCliente(m,n,l):
    enc='utf-8'
    Sentencia='INSERT INTO cliente (nombre_cliente, id_domicilio) VALUES'
    nombres=np.genfromtxt('c_nombres.txt',dtype='str',delimiter = '\n',encoding=enc)
    apellidos=np.genfromtxt('c_apellidos.txt',dtype='str',delimiter = '\n',encoding=enc)
    with open('InsertCliente.txt', 'w') as file:
        for i in range(m):
            nombre=choice(nombres)+' '+choice(apellidos)
            file.write( Sentencia+"( \'%s\', \'%s\' );\n" % ( nombre, l+i ) )
        for i in range(n):
            nombre=choice(nombres)+' '+choice(apellidos)
            file.write( Sentencia+"( \'%s\',  NULL  );\n" % ( nombre ) )
    return



def InsertVehiculoMiembro(n,l): #l donde empieza miembro
    enc='utf-8'
    letras=string.ascii_uppercase
    marcas=np.genfromtxt('c_marca.txt',dtype='str',delimiter = '\n',encoding=enc)
    modelos=np.genfromtxt('c_modelo.txt',dtype='str',delimiter = '\n',encoding=enc)
    colores=np.genfromtxt('c_color.txt',dtype='str',delimiter = '\n',encoding=enc)
    Sentencia='INSERT INTO vehiculo (placa,modelo,id_ccolor,marca,id_ctipo,id_miembro) VALUES '
    ctipos=[]
    placas=[]
    with open('InsertVehiculoMiembro.txt', 'w') as file:
        for i in range(n):
            placa=( "%s%s%s%i%i%i" % 
                   (choice(letras),choice(letras),choice(letras),
                    choice(range(10)),choice(range(10)),choice(range(10)) ) )
            placas.append(placa)
            tipo=choice([1,2,3,4])
            ctipos.append(tipo)
            file.write(Sentencia+"(\'%s\',\'%s\',\'%s\',\'%s\',\'%i\',\'%i\');\n" % 
                       ( placa, choice(modelos),choice(range(1,len(colores))),
                        choice(marcas),tipo,i+l ))
    with open('c_tiposvehic_miembros.txt','w') as file:
        [file.write("%i\n"% (ctipos[i])) for i in range(len(ctipos))]
    with open('c_placas_miembros.txt','w') as file:
        [file.write("%s\n" % (placas[i])) for i in range(len(placas))]
    return
    
def InsertVehiculoCliente(n,l): #l donde empieza miembro
    enc='utf-8'
    letras=string.ascii_uppercase
    marcas=np.genfromtxt('c_marca.txt',dtype='str',delimiter = '\n',encoding=enc)
    modelos=np.genfromtxt('c_modelo.txt',dtype='str',delimiter = '\n',encoding=enc)
    colores=np.genfromtxt('c_color.txt',dtype='str',delimiter = '\n',encoding=enc)
    Sentencia='INSERT INTO vehiculo (placa,modelo,id_ccolor,marca,id_ctipo,id_cliente) VALUES '
    ctipos=[]
    placas=[]
    with open('InsertVehiculoCliente.txt', 'w') as file:
        for i in range(n):
            placa=( "%s%s%s%i%i%i" % 
                   (choice(letras),choice(letras),choice(letras),choice(range(10))
                    ,choice(range(10)),choice(range(10)) ) )
            placas.append(placa)
            tipo=choice([1,2,3,4])
            ctipos.append(tipo)
            file.write(Sentencia+"(\'%s\',\'%s\',\'%s\',\'%s\',\'%i\',\'%i\');\n" % 
                       ( placa, choice(modelos),choice(range(1,len(colores))),choice(marcas),tipo,i+l ))
    with open('c_tiposvehic_cliente.txt','w') as file:
        [file.write("%i\n"% (ctipos[i])) for i in range(len(ctipos))]
    with open('c_placas_cliente.txt','w') as file:
        [file.write("%s\n" % (placas[i])) for i in range(len(placas))]
    return

def Insertempleado_datos(n,l): #l donde empieza telefono
    letras=string.ascii_uppercase
    Sentencia='INSERT INTO empleado_datos (noss,rfc,id_telefono) VALUES ' # ('58794612358','PHTY981113B14');
    with open('Insertempleado_datos.txt', 'w') as file:
        for i in range(n):
            rfc=("%s%s%s%s%i%i%i%i%i%i%s%i%i" % 
                 (choice(letras),choice(letras),choice(letras),choice(letras),
                  choice(np.arange(0,10)),choice(np.arange(0,10)),choice(np.arange(0,10)),
                  choice(np.arange(0,10)),choice(np.arange(0,10)),choice(np.arange(0,10)),
                  choice(letras),choice(np.arange(0,10)),choice(np.arange(0,10)) ) )
            noss=("%i%i%i%i%i%i%i%i%i%i%i" % 
                  ((choice(np.arange(0,10))),choice(np.arange(0,10)),choice(np.arange(0,10)),
                   choice(np.arange(0,10)),choice(np.arange(0,10)),choice(np.arange(0,10)),
                   choice(np.arange(0,10)),choice(np.arange(0,10)),choice(np.arange(0,10)),
                   choice(np.arange(0,10)),choice(np.arange(0,10)) ))
            file.write(Sentencia+"(\'%s\',\'%s\',%i);\n" % (noss,rfc,i+l) )
    return 1

def InsertEmpleado(l,m):
    Sentencia='INSERT INTO empleado (id_cpuesto,id_empleado_datos,id_persona,id_sucursal) VALUES'
    j=0
    with open('InsertEmpleado.txt', 'w') as file:
        for i in range(1,33):
            file.write(Sentencia+"(2,%i,%i,%i);\n" % (j+l,j+m,i))
            j+=1
            for k in range(4):
                file.write(Sentencia+"(3,%i,%i,%i);\n" % (j+l,j+m,i))
                j+=1
            for k in range(14):
                file.write(Sentencia+"(1,%i,%i,%i);\n" % (j+l,j+m,i))
                j+=1
            for k in range(4):
                file.write(Sentencia+"(4,%i,%i,%i);\n" % (j+l,j+m,i))
                j+=1
            for k in range(5):
                file.write(Sentencia+"(5,%i,%i,%i);\n" % (j+l,j+m,i))
                j+=1
            for k in range(3):
                file.write(Sentencia+"(6,%i,%i,%i);\n" % (j+l,j+m,i))
                j+=1
        return 1
            


def InsertOrdenMiembro(n,o): #o donde empiezan las ordenes
    enc='utf-8'
    tipovehic=np.genfromtxt('c_tiposvehic_miembros.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv1=np.genfromtxt('c_servicio1.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv2=np.genfromtxt('c_servicio2.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv3=np.genfromtxt('c_servicio3.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv4=np.genfromtxt('c_servicio4.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv=[]
    serv.append(serv1)
    serv.append(serv2)
    serv.append(serv3)
    serv.append(serv4)
    placas=np.genfromtxt('c_placas_miembros.txt',dtype='str',delimiter = '\n',encoding=enc)
    precios=np.genfromtxt('c_precio_servicio.txt',dtype='str',delimiter = '\n',encoding=enc)
    Sentencia1='INSERT INTO orden(monto_total, fechahora, monto_pagar, descuento, id_miembro, nonomina, placa, id_cpago,a_domicilio,id_sucursal) VALUES '
    Sentencia2='INSERT INTO orden_servicio(id_orden, id_servicio, cantidad) VALUES '
    with open('InsertOrdenMiembro.txt', 'w') as file:
        for i in range(n):
            tipo=int(tipovehic[i]) #iesimo miembro tiene iesimo auto
            servicio=int(choice(serv[tipo-1]))#según el tipo, escoge lista de servicios, -1 porque los elementos empiezan en 0, recoge el id del servicio
            monto_total=str(precios[servicio-1])
            sucursal=choice(range(1,33))
            nonomina=choice(range(4*sucursal-3,sucursal*4+1))
            fechahora=("2020-%i-%i %i:%i:%i" % 
                       (choice([10,11,12]),choice(np.arange(1,30)),choice(np.arange(6,18)),
                        choice(np.arange(10,60)),choice(np.arange(10,60))) )
            file.write(Sentencia1+"(%s,\'%s\',%s*0.9,'TRUE',%i,%i,\'%s\',%i,\'FALSE\',%i);\n" % 
                       ( monto_total,fechahora,monto_total,i+1,nonomina,placas[i],choice([1,2]),sucursal ) )
            file.write(Sentencia2+"(%i,%i,%i);\n" % (i+o,servicio,1) )
    return


def InsertOrdenClienteD(n,o): #o donde empiezan las ordenes #c donde empiezan lso clientes
    enc='utf-8'
    tipovehic=np.genfromtxt('c_tiposvehic_cliente.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv1=np.genfromtxt('c_servicio1.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv2=np.genfromtxt('c_servicio2.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv3=np.genfromtxt('c_servicio3.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv4=np.genfromtxt('c_servicio4.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv=[]
    serv.append(serv1)
    serv.append(serv2)
    serv.append(serv3)
    serv.append(serv4)
    placas=np.genfromtxt('c_placas_cliente.txt',dtype='str',delimiter = '\n',encoding=enc)
    precios=np.genfromtxt('c_precio_servicio.txt',dtype='str',delimiter = '\n',encoding=enc)
    Sentencia1='INSERT INTO orden(monto_total, fechahora, monto_pagar, descuento, id_cliente, nonomina, placa, id_cpago,a_domicilio,id_sucursal) VALUES '
    Sentencia2='INSERT INTO orden_servicio(id_orden, id_servicio, cantidad) VALUES '
    with open('InsertOrdenClienteD.txt', 'w') as file:
        for i in range(n):
            tipo=int(tipovehic[i]) #iesimo miembro tiene iesimo auto
            servicio=int(choice(serv[tipo-1]))#según el tipo, escoge lista de servicios, -1 porque los elementos empiezan en 0, recoge el id del servicio
            monto_total=str(precios[servicio-1])
            sucursal=choice(range(1,33))
            nonomina=choice(range(4*sucursal-3,sucursal*4+1))
            fechahora=("2020-%i-%i %i:%i:%i" % 
                       (choice([10,11,12]),choice(np.arange(1,30)),choice(np.arange(6,18)),
                        choice(np.arange(10,60)),choice(np.arange(10,60))) )
            file.write(Sentencia1+"(%s,\'%s\',%s*0.9,'FALSE',%i,%i,\'%s\',%i,\'TRUE\',%i);\n" % 
                       ( monto_total,fechahora,monto_total,i+1,nonomina,placas[i],choice([1,2]),sucursal ) )
            file.write(Sentencia2+"(%i,%i,%i);\n" % (i+o,servicio,1) )
    return
    
def InsertOrdenClienteN(n,o,c): #o donde empiezan las ordenes #c donde empiezan lso clientes
    enc='utf-8'
    tipovehic=np.genfromtxt('c_tiposvehic_cliente.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv1=np.genfromtxt('c_servicio1.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv2=np.genfromtxt('c_servicio2.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv3=np.genfromtxt('c_servicio3.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv4=np.genfromtxt('c_servicio4.txt',dtype='str',delimiter = '\n',encoding=enc)
    serv=[]
    serv.append(serv1)
    serv.append(serv2)
    serv.append(serv3)
    serv.append(serv4)
    placas=np.genfromtxt('c_placas_cliente.txt',dtype='str',delimiter = '\n',encoding=enc)
    precios=np.genfromtxt('c_precio_servicio.txt',dtype='str',delimiter = '\n',encoding=enc)
    Sentencia1='INSERT INTO orden(monto_total, fechahora, monto_pagar, descuento, id_cliente, nonomina, placa, id_cpago,a_domicilio,id_sucursal) VALUES '
    Sentencia2='INSERT INTO orden_servicio(id_orden, id_servicio, cantidad) VALUES '
    with open('InsertOrdenClienteN.txt', 'w') as file:
        for i in range(n):
            tipo=int(tipovehic[i+c-1]) #iesimo miembro tiene iesimo auto
            servicio=int(choice(serv[tipo-1]))#según el tipo, escoge lista de servicios, -1 porque los elementos empiezan en 0, recoge el id del servicio
            monto_total=str(precios[servicio-1])
            sucursal=choice(range(1,33))
            nonomina=choice(range(4*sucursal-3,sucursal*4+1))
            fechahora=("2020-%i-%i %i:%i:%i" % 
                       (choice([10,11,12]),choice(np.arange(1,30)),choice(np.arange(6,18)),
                        choice(np.arange(10,60)),choice(np.arange(10,60))) )
            file.write(Sentencia1+"(%s,\'%s\',%s*0.9,'FALSE',%i,%i,\'%s\',%i,\'FALSE\',%i);\n" % 
                       ( monto_total,fechahora,monto_total,i+1+c,nonomina,placas[i],choice([1,2]),sucursal ) )
            file.write(Sentencia2+"(%i,%i,%i);\n" % (i+o,servicio,1) )
    return
    

def InsertOrdenP(n,o):
    enc='utf-8'
    precios=np.genfromtxt('c_precio_cproducto.txt',dtype='str',delimiter = '\n',encoding=enc)
    Sentencia1='INSERT INTO orden(monto_total, fechahora, monto_pagar, descuento, nonomina, id_cpago, a_domicilio, id_sucursal) VALUES '
    Sentencia2='INSERT INTO orden_cproducto(id_orden, id_cproducto, cantidad) VALUES '
    with open('InsertOrdenProd.txt', 'w') as file:
        for i in range(n):
            cproducto=int(choice(range(len(precios))))
            monto_total=str(precios[cproducto])
            sucursal=choice(range(1,33))
            nonomina=choice(range(4*sucursal-3,sucursal*4+1))
            fechahora=("2020-%i-%i %i:%i:%i" % 
                       (choice([10,11,12]),choice(np.arange(1,30)),choice(np.arange(6,18)),
                        choice(np.arange(10,60)),choice(np.arange(10,60))) )
            file.write(Sentencia1+"(%s,\'%s\',%s*0.9,'FALSE',%i,%i,\'FALSE\',%i);\n" % 
                       ( monto_total,fechahora,monto_total,nonomina,choice([1,2]),sucursal ) )        
            file.write(Sentencia2+"(%i,%i,%i);\n" % (i+o,cproducto+1,1) )
    

def InsertEncuesta(n):
    Sentencia='INSERT INTO encuesta(amabilidad,calidad,tiempo,precios,id_orden) VALUES '
    with open('InsertEncuesta.txt', 'w') as file:
            [file.write(Sentencia+"(%i,%i,%i,%i,%i);\n" % 
                        ( choice([1,2,3,4,5]),choice([1,2,3,4,5]),choice([1,2,3,4,5]),
                         choice([1,2,3,4,5]), i+1 ) ) for i in range(n)]
    return

def InsertFactura(n):
    Sentencia='INSERT INTO factura(id_orden) VALUES '
    with open('InsertFactura.txt', 'w') as file:
            [file.write(Sentencia+"(%i);\n" % (i+1) ) for i in range(n)]
    return


def InsertOrdenSucursal(o):
    enc='utf-8'
    precios=np.genfromtxt('c_precio_cproducto.txt',dtype='str',delimiter = '\n',encoding=enc)
    Sentencia1='INSERT INTO orden_sucursal (fechahorasuc,monto_totalsuc,id_sucursal,nonomina) VALUES '
    Sentencia2='INSERT INTO orden_sucursal_cproducto(id_orden_sucursal,id_cproducto,cantidad) VALUES'
    with open('InsertOrdenSuc.txt', 'w') as file:
        for i in range(1,33):
            for j in range(len(precios)):
                cproducto=j
                fechahorasuc=("2020-%i-%i %i:%i:%i" % 
                              (choice([10,11,12]),choice(np.arange(1,30)),choice(np.arange(6,18)),
                               choice(np.arange(10,60)),choice(np.arange(10,60))) )
                monto_totalsuc=str(int(precios[cproducto])*10)
                id_sucursal=i
                nonomina=31*(id_sucursal-1)+1
                file.write(Sentencia1+"(\'%s\',\'%s\',%i,%i);\n" % (fechahorasuc,monto_totalsuc,id_sucursal,nonomina) )
                file.write(Sentencia2+"(%i,%i,10);\n" % (o,cproducto+1) )
                o+=1
    return

def InsertInventario():
    enc='utf-8'
    precios=np.genfromtxt('c_precio_cproducto.txt',dtype='str',delimiter = '\n',encoding=enc)
    Sentencia2='INSERT INTO inventario(id_sucursal,id_cproducto,cantidad) VALUES'
    with open('InsertInventario.txt', 'w') as file:
        for i in range(1,33):
            for j in range(len(precios)):
                file.write(Sentencia2+"(%i,%i,100);\n" % (i,j+1) )
    return 1