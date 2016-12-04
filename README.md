# FPGAs: Las impresoras 3D de la electrónica

## Justificación

Las FPGAs son unos chips "en blanco" que nos permiten configurarlos para crear dentro de ellos nuestros propios circuitos digitales. ¡Si! ¡Con las FPGAs estamos creando hardware!

Una única FPGA nos permite sustituir a muchos circuitos digitales discretos (chips) necesarios en dispositivos para realizar diferentes funciones. Además en caso de detctarse error se puede actualizar su diseño para corregirlo.

Hasta hace poco la única forma de trabajar con una FPGA era usando el sortware que proporcionaba el fabricante.

En mayo de 2015 ocurrió un hito histórico: se tuvieron por primera vez todas las herramientas necesarias para generar el bitstream a partir de código en Verilog usando sólo software libre, gracias al proyecto icestorm, liderado por Clifford Wolf. A partir de ese momento,ya tenemos herramientas que pertenecen al patrimonio tecnológico de la humanidad para trabajar con FPGAs, y poder desarrollar hardware usando sólo herramientas de este patrimonio

Al mismo tiempo se han creado diseños abiertos de placas que incorporan FPGAs, como la [IceZum Alhambra](https://github.com/FPGAwars/icezum) desarrollada totalmente con herramientas open-source como [Kicad](http://kicad-pcb.org/) y [Freecad](freecadweb.org).

![IceZum Alhambra](https://github.com/FPGAwars/icezum/raw/master/wiki/V1.1-RC1/icezum-alhambra-v1.1.jpg)

Todo este ecosistema (hardware y software) totalmente libre demuestra la enorme capacidad del mundo open-source

Estas herramientas y diseños tiene un evidente uso docente, demostrando que ya no requieren de complejos conocimientos, antes sólo disponibles para profesionales:

* Enseñar electrónica digital fácilmente
* Construcción de entrenadores digitales
* Uso de herramientas opensource, tanto visuales como de línea de comandos

## Objetivos

* Introducir el concepto  de las FPGAs
* Mostrar las posibilidades de uso a día de hoy
* Presentar los diseños de hardware libre de entrenadores
* Aprender a usar las herramientas software para sintetizar hardware actuales

## Contenidos

* ¿Qué es una FPGA?
* Usos docentes de las FPGAs
* Diseños libres de placas con FPGAs
* Software libre para sintetizar circuitos
  * Herramientas de línea de comandos
  * Herramientas visuales

![iceStudio](https://github.com/FPGAwars/icestudio/raw/develop/doc/images/icestudio-0.2-project.png?raw=true)
