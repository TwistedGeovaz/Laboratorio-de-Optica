function f_negativa = calcularFocalNegativaGrafico(distObjetoLenteNegativa, distLentePositivaPantalla, fDeseada)
    % Verifica si el usuario ha proporcionado la distancia focal deseada, si no, usa 100 mm como predeterminado
    if nargin < 3
        fDeseada = 100; % Valor predeterminado de distancia focal deseada en mm
    end

    % Constantes dadas
    distanciaEntreLentes = 100; % en milimetros
    fPositiva = 100; % Distancia focal de la lente positiva en milimetros

    % Preallocate vector for f_negativa calculations
    f_negativa = zeros(size(distObjetoLenteNegativa));

    for i = 1:length(distObjetoLenteNegativa)
        % Cálculos similares a la versión anterior
        uNegativa = distObjetoLenteNegativa(i);
        vPositiva = distLentePositivaPantalla(i);
        uPositiva = distanciaEntreLentes + (vPositiva - distanciaEntreLentes - fPositiva);
        vNegativa = uPositiva - distanciaEntreLentes;
        f_negativa(i) = 1 / ((1/vNegativa) - (1/-uNegativa));
    end

    % Mostrar el resultado
    disp('La distancia focal de la lente negativa para cada configuración es:');
    disp(f_negativa);

    % Graficar las distancias focales calculadas
    figure; % Crea una nueva figura
    plot(distObjetoLenteNegativa, f_negativa, '-o', 'LineWidth', 2); % Grafica las distancias focales calculadas
    hold on; % Mantiene el gráfico actual para superponer el próximo gráfico
    yline(fDeseada, '--r', 'LineWidth', 2); % Línea horizontal que muestra la distancia focal deseada
    hold off; % No se superponen más gráficos

    % Etiquetas y leyenda para el gráfico
    title('Distancia Focal de la Lente Negativa Calculada');
    xlabel('Distancia del Objeto a la Lente Negativa (mm)');
    ylabel('Distancia Focal Calculada (mm)');
    legend('Distancia Focal Calculada', ['Distancia Focal Deseada = ' num2str(fDeseada) ' mm'], 'Location', 'best');

    % Ajuste de los ejes para mejor visualización
    grid on; % Activa la cuadrícula
    xlim([min(distObjetoLenteNegativa) max(distObjetoLenteNegativa)]); % Limita el eje X a las distancias proporcionadas
    ylim([min([f_negativa, fDeseada]) - 10 max([f_negativa, fDeseada]) + 10]); % Limita el eje Y para una mejor visualización
end
