para distinguir dejé los comentarios en español del codigo original y los mios son en eng
Serial and OpenMP
Both programs do the same if you compile serial 
The OpenMP works without the openmp flag in compilation because instructions start with !
We paralellize the important loops (most important is forces), but not the tree because different cores would try to create the same cell at the same time -> program breaks
the Integration + I/O part is a bit slower with OpenMP -> simple task, it's harder to assign all the work than to do it
similar to integration 1
MPI
now we can paralellize the tree -> integration 2 
