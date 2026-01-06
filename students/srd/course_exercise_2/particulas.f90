PROGRAM particulas
  IMPLICIT NONE

  INTEGER :: i, n, k
  INTEGER :: values(1:8)
  INTEGER, DIMENSION(:), ALLOCATABLE :: seed
  REAL :: mass, rx, ry, rz
  REAL :: dt, dt_out, t_end
  INTEGER :: outunit

  ! Inicialización de semilla aleatoria
  CALL date_and_time(values = values)
  CALL random_seed(size = k)
  ALLOCATE(seed(1:k))
  seed(:) = values(8)
  CALL random_seed(put = seed)

  ! Número de partículas
  PRINT*, "Number of bodies?"
  READ*, n

  mass = 1.0 / n

  ! Parámetros de tiempo
  dt = 0.01
  dt_out = 0.1
  t_end = 33.0

  ! Abrir archivo para escribir
  OPEN(NEWUNIT=outunit, FILE="input.dat", STATUS="REPLACE", ACTION="WRITE")

  ! Escribir parámetros iniciales
  WRITE(outunit,*) dt
  WRITE(outunit,*) dt_out
  WRITE(outunit,*) t_end
  WRITE(outunit,*) n

  ! Escribir partículas
  DO i = 1, n
     CALL random_number(rx)
     DO
        CALL random_number(ry)
        IF (rx**2 + ry**2 <= 1.0) EXIT
     END DO
     DO
        CALL random_number(rz)
        IF (rx**2 + ry**2 + rz**2 <= 1.0) EXIT
     END DO

     WRITE(outunit,'(F6.3,3F11.8,3I2)') mass, rx, ry, rz, 0, 0, 0
  END DO

  CLOSE(outunit)
END PROGRAM particulas

