% Índices de refracción
n_air = 1.00; % Índice de refracción del aire
n_water = 1.33; % Índice de refr

% Vector de ángulos de incidencia en grados
angulos_incidencia = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35]; % Cambia esto según lo necesites

% Conversión de grados a radianes para los cálculos
angulos_incidencia_rad = deg2rad(angulos_incidencia);

% Pre-alojamiento para los ángulos de refracción
angulos_refraccion_rad = zeros(size(angulos_incidencia_rad));

% Cálculo de los ángulos de refracción usando la Ley de Snell
for i = 1:length(angulos_incidencia_rad)
    angulo_incidente = angulos_incidencia_rad(i);
    seno_angulo_refraccion = n_air * sin(angulo_incidente) / n_water;
    
    % Comprobación de la reflexión total interna
    if seno_angulo_refraccion > 1
        angulos_refraccion_rad(i) = NaN; % No hay refracción, reflexión total
    else
        angulos_refraccion_rad(i) = asin(seno_angulo_refraccion);
    end
end

% Introducir un error aleatorio entre 1% y 5% en los ángulos de refracción
for i = 1:length(angulos_refraccion_rad)
    if ~isnan(angulos_refraccion_rad(i))
        error = 1 + (rand() * 0.24); % 1% a 5% de error
        angulos_refraccion_rad(i) = angulos_refraccion_rad(i) * error;
    end
end

% Conversión de los ángulos de refracción a grados
angulos_refraccion = rad2deg(angulos_refraccion_rad);

disp('Ángulos de Incidencia (grados):');
disp(angulos_incidencia);
disp('Ángulos de Refracción con Error (grados):');
disp(angulos_refraccion);

% Graficar la relación entre los ángulos de incidencia y refracción
figure;
plot(angulos_incidencia, angulos_refraccion, 'b*');
xlabel('Ángulo de Incidencia (grados)');
ylabel('Ángulo de Refracción (grados)');
title('Relación entre Ángulos de Incidencia y Refracción');
grid on;

% Graficar la relación entre los senos de los ángulos de incidencia y refracción
senos_incidencia = sin(angulos_incidencia_rad);
senos_refraccion = sin(angulos_refraccion_rad);

figure;
plot(senos_incidencia, senos_refraccion, '*r');
xlabel('Seno del Ángulo de Incidencia');
ylabel('Seno del Ángulo de Refracción');
title('Relación entre los Senos de los Ángulos de Incidencia y Refracción');
grid on;

div= senos_incidencia./senos_refraccion;
j=median(div);
disp(div);
disp(j);
