# FPGAs: Las impresoras 3D de la electrónica ([172319GE043](https://www.juntadeandalucia.es/educacion/secretariavirtual/consultaCEP/actividad/172319GE043/))

## CEP Linares-Andújar

### José Antonio Vacas @javacasm

### 30/1/2017

![Licencia CC](./images/Licencia_CC.png)


## ¿Qué sabéis de las FPGAs? ¿Las habéis usado? ¿Tenéis un a mano?

## La [IceZum Alhambra](./icezum.md)

![iceZum Alhambra](https://github.com/FPGAwars/icezum/raw/master/wiki/V1.1-RC1/icezum-alhambra-v1.1.jpg)

Es una placa totalmente [libre (Open Hardware)](https://github.com/FPGAwars/icezum) que incluye una FPGA en un formato totalmente compatible  con Arduino

## Desarrollada con Herramientas libres

### Desde el diseño con [Kicad](http://kicad-pcb.or) (http://kicad-pcb.or)

([Tutorial de kicad (en proceso)](https://github.com/javacasm/KicadTutorial))

### La documentación con [inkscape](https://inkscape.org/es/) (https://inkscape.org/es/)

Pasando por toda la toolchain

## Introducción

**Al principio teníamos el control sobre los ordenadores**: los primeros hackers creaban las herramientas (sus 'hachas') y de modo natural las compartían. Escribían su código lo probaban y enviaban a otros usuarios para así compartirlo y mejorarlo entre todos

Esos Hackers creaban/escribían sus sistemas operativos desde cero (Historia del b para hacer el C)

Cuando las grandes empresas vieron el negocio cerraron las posibilidad de compartirlo y ocultaron las herramientas existentes.

Usaban muchas de las herramientas creada de forma libre (¿sabías que existe un directorio etc, como el de linux,  dentro de windows, porque los componentes de la pila TCP que usan esperan encontrarlas?)

Añadieron un **"halo" de dificultad** a todo el mundo de la creación de programas, y nos vendían que las suyas eran las únicas herramientas que después de comprarlas nos iban a permitir hacer maravillosas aplicaciones

**Casi todas las herramientas se hicieron privativas** , hasta las que nos permitían hacer nuestros propios programas.

Había que pagar por ellas, **pero no era muy difícil piratearlas** y con ellos nos daba la sensación de que estaban a nuestro alcance,

Pero no todo funcionaba, **estas herramientas no hacían lo que necesitábamos** ¿alguien ha conseguido usar bien el sistema de numeración de párrafos en word?

Tuvo que pasar mucho tiempo hasta que aparecieron y se difundieran sistemas que volvían a dar esa libertad: **GCC**

A partir de ahí se volvieron a empezar a crear, por segunda vez, todos los componentes necesarios para devolver el control sobre las herramientas

Y ese movimiento **Open-Source llenó de libertad todo el panorama del software**. Volvíamos a tener soberanía tecnológica y podíamos decidir qué herramientas usar y hasta ¡¡qué herramientas hacer!!

Con el tiempo los más expertos se dieron cuenta de que era posible crear plataformas hardware abiertas y diferentes, como Arduino

Empezaron a aparecer diseños de placas electrónicas, y cada vez se hacía más sencillo el construirlas

Aparecieron herramientas como **Kicad** Algunos fabricantes nos "dejaban" su software como Eagle

**Podíamos diseñar nuestra propia electrónica**, hacer nuestros aparatos y robots

Un poco tiempo después llegaron las impresoras 3D y **el mundo empezó a llenarse de nuestras ideas materializadas** en plástico.

Necesitábamos software para diseñar esas piezas: Freecad o Blender

Hasta hace poco se necesitaba un equipo de diseño y otro de fabricación además de tener acceso a máquinas muy costosas para poder crear una PCB. En casa, con la planta o con la impresora láser del trabajo podíamos hacer con mucho cuidado hasta PCBs de 2 capas...

Hoy tenemos CNC que nos permiten hacer las PCBs... y los servicios de creación de PCBs son muy baratos y accesibles.


**Teníamos que usar los chips que existían pero ya no** ...

....

El tener todas estas herramientas a nuestro alcance nos permite acelerar enormemente el ciclo de desarrollo: podemos crear un prototipo a partir de nuestras ideas, implementarlo, imprimirlo, montarlo y probarlo en  cuestion de horas y así mejorar constantemente. Son lasº metodologías ágiles de desarrollo.


## ¿FPGA?

[Field Programmable Gate Array](https://es.m.wikipedia.org/wiki/Field_Programmable_Gate_Array)

![FPGA](http://www.nextplatform.com/wp-content/uploads/2015/03/fpga_384.jpg)

### ¿Qué es una FPGA?

(Del [Capítulo 0 de Tutorial de @Obijuan sobre Verilog](https://github.com/Obijuan/open-fpga-verilog-tutorial/wiki/Cap%C3%ADtulo-0:-you-are-leaving-the-privative-sector))

"Las [FPGAs](https://es.wikipedia.org/wiki/Field_Programmable_Gate_Array) son unos chips "en blanco" que nos permiten configurarlos para crear dentro de ellos nuestros propios circuitos digitales. ¡Si! ¡Con las FPGAs estamos creando hardware!

![](https://github.com/Obijuan/open-fpga-verilog-tutorial/raw/master/tutorial/ICESTICK/T00-Intro/images/fpga-config1.png)

Los circuitos se describen usando un **Lenguaje de Descripción de Hardware** (HDL) como Verilog o VHDL. A partir de ellos se genera un bitstream que describe las uniones entre los elementos usados.

Llamamos **síntesis** a todo el proceso que nos lleva desde el diseño en código fuente hasta la configuración de la FPGA. Estas son las fases:

![](https://github.com/Obijuan/open-fpga-verilog-tutorial/raw/master/tutorial/ICESTICK/T00-Intro/images/fpga-bitstream1.png)

**1 Síntesis**: La herramienta de síntesis infiere los elementos hardware básicos a partir de su descripción, y obtiene un fichero **netlist** que describe las uniones entre ellos. Esta fase no depende de la FPGA a usar

**2 Emplazado y rutado**. Los componentes del netlist se hacen corresponder con los elementos físicos de la FPGA, se determina su colocación y se realiza el rutado. Toda la información de configuración de la FPGA se condensa en el bitstream. Esta fase sí depende del modelo concreto de FPGA que se disponga

### ¿Para qué se utilizan las FPGAs?

Nos permiten sustituir a muchos circuitos digitales discretos necesarios en dispositivos.

[Apple usa FPGAs en su iPhone](http://www.fool.com/investing/2016/09/19/1-more-surprise-winner-inside-the-apple-inc-iphone.aspx) posiblemente para sustituir a docenas de componentes.

Podemos modificar el comportamiento de una FPGA cambiando su bitstream, por tanto podríamos resolver errores y aportar mejoras a un diseño hardware.

### Comparación con un procesador Von Newman

* Con una FPGA podemos crear un procesador donde configuremos la cantidad de RAM, la cantidad de I/O, número de UART, incluso modificarlos si es necesarios


### Compara con una arquitectura tradicional ¿Von Newman?
[Ventajas e inconvenientes de las FPGAs](http://drmaker.es/no-lo-podras-creer-5-ventajas-9-desventajas-las-fpga/)

[FPGA vs Microcontoller](https://www.youtube.com/watch?v=AZInaAaDlvE)

* Piensa en un programa Arduino que reproduce un sonido. Ahora intenta hacer un programa que reproduzca 2 sonidos a la vez, o tres... con una FPGA basta con copiar+pegar el hardware

* Facilitan enórmemente la paralelización del hardware.

* Encoder para 1 rueda: programación vía interrupciones, necesitamos 2 entradas con interrupción. Si ahora necesitamos 4....

* Ejemplo del reproductor de notas (con arduino) 1 voz, ¿2 voces? ¿se complica la programción?
* Ejemplo de control de un parking

En un microcontrolador no estamos aprovechando la máquina...

### ¿Qué electrónica podemos sustituir por una FPGA?

* Electrónica digital
* Puertas lógicas
* ~~¿Electrónica analógica? ¿Acondicionamiento?~~
* ~~¿Electrónica de potencia?~~

## "Las FPGAs son las impresoras 3D de los circuitos digitales"



### Un poco de historia

Hasta hace poco la única forma de trabajar con una FPGA era usando el sortware que proporcionaba el fabricante.

En **mayo de 2015** ocurrió un **hito histórico**: se tuvieron por primera vez todas las herramientas necesarias para **generar el bitstream** a partir de **código en Verilog** usando **sólo software libre**, gracias al [proyecto icestorm](http://www.clifford.at/icestorm/), liderado por **Clifford Wolf**.  A partir de ese momento,ya tenemos herramientas que pertenecen al **patrimonio tecnológico de la humanidad** para trabajar con FPGAs, y poder desarrollar hardware usando sólo herramientas de este patrimonio

Actualmente sólo se pueden usar las FPGAs de Lattice de la familia ICE40

### Las herramientas del proyecto Icestorm

Las herramientas libres para trabajar con las FPGAs de lattice son las siguientes:

**Sintetizador**: [Yosys](http://www.clifford.at/yosys/) ([Repo en github](https://github.com/cliffordwolf/yosys))
**Place & route**: [Arachne-pnr](https://github.com/cseed/arachne-pnr) (en github)
**Utilidades y descarga en FPGA**: [Proyecto icestorm](http://www.clifford.at/icestorm/)

En la siguiente figura se muestran las diferentes herramientas usadas en las etapas, y las extensiones de los archivos que se van generando:

![](https://github.com/Obijuan/open-fpga-verilog-tutorial/raw/master/tutorial/ICESTICK/T00-Intro/images/icestorm-1.png)

Se parte de los ficheros **fuente en verilog** (.v). Usando el sintetizador **Yosys**, se generan los ficheros **netlist** (.blif). El emplazado y rutado se realiza con **arachne-pnr**, generándose el **bitstream en formato ascii** (.txt). Con **icepack** se crea el **bitstream binario** (.bin) que finalmente se envía a la FPGA con **iceprog**

## En este contexto apareción la [ICEZum ALhambra](./icezum.md)


![iceZum Alhambra](https://github.com/FPGAwars/icezum/raw/master/wiki/V1.1-RC1/icezum-alhambra-v1.1.jpg)


## Me has convencido ¡¡quiero participar!!


* [Lista de correo: FPGAWars explorando el lado libre](https://groups.google.com/forum/#!forum/fpga-wars-explorando-el-lado-libre)
Preséntate y si quieres puedes pedir una Alhambra
Ahora mismo se está entregando la 1a tirada de 110 placas y hay una lista de espera (con casi 80 apuntados) para una segunda tirada

* [Organización de Github FPGAWars](https://github.com/FPGAwars)
Puedes ver los proyectos actuales y la documentación sobre las [charlas](https://github.com/FPGAwars/workshops)

## Mucho trabajo por hacer

* Mejora del software
* Optimización en MS Windows
* Implementación hardware de un periferico I2C
* Implementación del protocolo I2C para el ADC
* Implementación de bloques generales


## [Herramientas para crear](./Herramientas.md)


## Recursos

* [Curso de Verilog by @obijuan](https://github.com/Obijuan/open-fpga-verilog-tutorial/wiki)



* [Curso de lógica y electrónica digital by jjviton](https://github.com/jjviton/CursoLogica/wiki)

* [Testeando la IceZum Alhambra (entre maestros)](https://photos.google.com/album/AF1QipP36t5ZhMG71LPr7_C7epm73dmTEdLRZpW79_7S)

* [Presentaciones de Obijuan sobre FPGAs](https://github.com/Obijuan/myslides)

* [OSHWDem 2016: Charla FPGAs Libres - Juan González ( Obijuan ](https://www.youtube.com/watch?v=XWC1B7UKv98)

* [Juan Gonzalez Obijuan FPGAWars Explorando el lado libre de las FPGAs](https://www.youtube.com/watch?v=rdlEpW_Ce5g)

* [Vídeos sobre FPGAs de @Obijuan](https://www.youtube.com/user/obijuancube/videos)

* [Definición Verilog de CI TTL](https://github.com/taw/ttl-cpu/tree/master/verilog)
