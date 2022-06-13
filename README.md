Mi idea consiste en dos aplicaciones una para administrador y la otra para Ejecutivo de Venta. La aplicacion Administrador (FORCE TRANSPORTS) cuenta con acceso a la mayoria de los recuros , mientras que el ejecutivo de Ventas tiene acceso solo a su aplicacion. En el video solo muestro la aplicacion de administracion , ya que 
la mayoria de funciones se encuentran en esta.

Fundamental Leer este readme con la documentacion necesaria donde podra encontrarse la configuracion para Deployar la aplicacion , de igual manera , adjunto enlace a 
video de presentacion.Sepan disculpar la prolijidad del mismo , ya que no cuento con Licencias para el software utilizado.

https://drive.google.com/file/d/1q2B6TFjKQmRTLmNbzFUyT9eD_eNtkRS_/view?usp=sharing

Nubes utilizadas 

Git:https://github.com/pmullersolution/ForceTransports

Salesforce:Sales

Rama del repositorio :Prot_force_PabloM


# Objetos Prototipo Force Transports
Vehiculo__c
Viajes_Individuales__c
Account
Contactabilidad__c
Email__c
EmailMessage
Factura__c
Detalle_factura__c
Lead
Opportunity
Maintenance Request(CASE)
## OBJETOS APLICACION PARA EL EJECUTIVO DE VENTAS 
Inconvenientes__c
Consultas__c
Maintenance Request(CASE)

## Flows utilizados en app Force Transports
 case_alert.flow
 create_property.flow
 detalle_factura.flow
 Estado_en_Cuenta.flow
 Factura_pag.flow
 flo_lead.flow
 flow_de_contactabilidad.flow
 flow_opportunity.flow


## Roles utilizado y Perfiles 

Perfiles:Administrador y Salesforce platform
Roles:Ceo , Ejecutivo de ventas , jefe Comercial


## Dashboards y reportes
Dashboardprototipo

## web component
<>form.html(formulario)
{}launch.json

## nubes utilizadas 
nube de Salesforce( Sales )
file:///C:/Users/PabloMuller/Documents/GitHub/dev401v3/form.html (para formulario)

## Email templates y Alertas
Factura_Paga
Facturas
opportunidad creada

Alertas: 	Factura(Descripcion) 	Template Name(Facturas)	Objeto (Factura)
            opportunity(Descripcion) Template Name(opportunidad creada) objeto (Opportunity)
