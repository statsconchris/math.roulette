## math.roulette : Un código en Matlab / Octave (.m) para simular los resultados en el juego de la ruleta
Para ver el funcionamiento del código y su análisis respectivo, ir al artículo: [nepy.pe/en/math.roulette.](http://www.nepy.pe/es/programacion/aprendiendo-programacion-con-la-ruleta-y-respondiendo-si-estamos-solos/) 

Existen 3 archivos: 

1. rouletteDeterministic.m : Se determina una apuesta fija, e.g., apostar solo al color rojo
2. rouletteStochastic.m : En cada ronda se apuesta aleatoriamente a distintos números
3. rouletteMartingale.m : Se usa la estrategia de Martingale

Todos los archivos requieren un valor de entrada. Los detalles aparecen explicados en el mismo código.
Para los parámetros dados, cada archivo toma aproximadamente 15 segundos en Matlab y más de 5 minutos en Octave. 
