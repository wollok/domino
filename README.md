# Dominó

Este ejercicio busca trabajar con colecciones

# Objetos principales

En este ejercicio no vamos a desarrollar un juego de dominó completo

Vamos a diseñar los siguientes objetos:

## Fichas:

Las fichas tienen dos valores que van del 0 al 6, y existe una única ficha
por cada combinación de estos valores. 
Si bien podríamos modelar cada una de las fichas con un objeto autodefinido 
(Los que programamos con la palabra object) vamos a utilizar
los objetos `Pair` de Wollok, que se construyen a partir de dos valores separados por flecha.
Por ejemplo 
``` 
   const ficha34 = 3->4 
   assert.equals(3, ficha32.x())
   assert.equals(4, ficha32.y())
```  

La construcción de fichas está resuelta en el objeto pozo

## Pozo

Del pozo se pide el siguiente comportamiento:

- crear fichas: Crea todas las fichas, como es un problema un tanto
complicado para esta altura de la materia, ya viene resuelto.
Sin embargo es código que deben leer y entender.

- tomar ficha(jugador): Elige una ficha al azar y se la pasa al jugador. 
Tener en cuenta que el método `anyOne`
de las listas devuelven un elemento al azar, pero dicho método no modifica la colección.
Es responsabilidad de ustedes remover el elemento luego de seleccionado.
Además, ustedes deberán diseñar en el objeto jugador un mensaje que reciba la ficha seleccionada
por parámetro.
Asumir que nunca se pide tomar una ficha cuando el pozo no tiene elementos para devolver.

- saber el tamaño del pozo: Saber cuantas fichas quedan

## Mesa

La mesa va a ir manteniendo las fichas que se jueguen.
 
Las fichas que se jueguen podrán ingresar por izquierda o por derecha,
que dependerá de los números que haya en los extremos: 

Por ejemplo:  `[ 6->3, 3->3, 3->2 ]`
 En esta mesa el extremo izquierdo es 6 y el derecho es 2.
 
- La ficha `2->1` puede ingresar por derecha: `[ 6->1, 6->3, 3->3, 3->2, 2->1 ]` siendo el 1 el nuevo extremo derecho
- La ficha `6->1` puede ingresar por izquierda: `[ 6->1, 6->3, 3->3, 3->2 ]` siendo el 1 el nuevo extremo izquierdo (ojo con esto! puede confundir)
- La ficha `6->2` puede ingresar tano por derecha como por izquierda.

> ** Girar la Ficha ** 
> Para evitar el problema de la visualización entre el 6->1 y el 6->3, se puede
> la implementación podría desechar la ficha 6->1 y agregar la inversa, 1->6.
> Esta rotación además de dejar la colección mejor visualmente, ayuda mucho
> al cálculo de los extremos, sin necesidad de agregar atributos adicionales.
> Así quedaría las fichas de la mesa `[ 1->6, 6->3, 3->3, 3->2 ]` el extremo
> izquierdo es el x de la primera ficha y el extremo derecho el y de la última
  
Una mesa que no tiene fichas permite ingresar cualquier ficha por cualquier lado

Al ingresar una ficha inicial a la mesa, los extremos se pueden 
definir arbitrariamente por el sistema

Se pide el siguiente comportamiento:

- Saber si una ficha puede ser ingresada por derecha
- Saber si una ficha puede ser ingresada por izquierda
- Ingresar una ficha por izquierda
- Ingresar una ficha por derecha

Asumir que nunca se intenta ingresar una ficha que no corresponde

Bonus: Girar la ficha cuando corresponda. por ejemplo, si se
pide ingresar la ficha 6->1 por izquierda en 
`[ 6->3, 3->3, 3->2 ]`, se cambia la ficha por el 1->6:
`[ 1->6, 6->3, 3->3, 3->2 ]` de manera que la visualización sea 
más amena.

## Jugador

Del jugador interesa: 

- iniciar juego: Debe tomar 7 fichas del pozo y conservarlas (es lo que se llama mano).
El orden de la mano es importante, ya que seleccionaremos las fichas por posición.

- mano:  Debe devolver las fichas que tiene en la mano

- jugar ficha por izquierda: Se selecciona una ficha por la posición en la mano, y se juega en la mano
en el extremo que se izquierdo  

- jugar ficha por derecha: Se selecciona una ficha por la posición en la mano, y se juega en la mano
en el extremo que se izquierdo  

- pedir una ficha A pozo.
