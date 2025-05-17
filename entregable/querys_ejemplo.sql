-- 🔎 ¿Qué HCEs permiten generar recetas y están integradas con prepagas?
SELECT h.id_HCE, h.nombre
FROM HCE h
JOIN HCEGeneraReceta gr ON h.id_HCE = gr.id_HCE
JOIN HCEGeneraPrepagas gp ON h.id_HCE = gp.id_HCE;

-- 🔎 ¿Qué capacidades tiene cada HCE que permite la generación de prescripciones?
SELECT h.id_HCE, h.nombre, c.nombre AS capacidad
FROM HCE h
JOIN HCECapacidad hc ON h.id_HCE = hc.id_HCE
JOIN Capacidad c ON hc.cod_capacidad = c.cod_capacidad
WHERE h.id_HCE IN (
    SELECT id_HCE
    FROM HCECapacidad
    WHERE cod_capacidad = (
        SELECT cod_capacidad
        FROM Capacidad
        WHERE nombre = 'Generación de Prescripciones'
    )
);

-- 🔎 ¿Qué HCEs ofrecen acceso a 'Estudios de Laboratorio' por WhatsApp?
SELECT DISTINCT h.id_HCE, h.nombre
FROM HCE h
JOIN AccedeDocumento ad ON h.id_HCE = ad.id_HCE
JOIN DocumentoDigital d ON ad.id_documento = d.id_documento
JOIN FormaEnvio f ON ad.id_forma_envio = f.id_forma_envio
WHERE d.tipo = 'Estudio de Laboratorio' AND f.nombre = 'WhatsApp';

-- 🔎 ¿Qué porcentaje de HCEs usa SNOMED CT?
SELECT ROUND(
    (COUNT(DISTINCT hc.id_HCE) * 100.0 / (SELECT COUNT(*) FROM HCE)),
    2
) AS porcentaje_usan_snomed
FROM HCECapacidad hc
JOIN Capacidad c ON hc.cod_capacidad = c.cod_capacidad
WHERE c.nombre = 'Uso de Terminología SNOMED CT';

-- 🔎 ¿Qué provincias no tienen ninguna HCE que acceda a documentos digitales?
SELECT pr.nombre
FROM Provincia pr
WHERE pr.id_prov NOT IN (
    SELECT DISTINCT h.id_prov
    FROM HCE h
    JOIN AccedeDocumento ad ON h.id_HCE = ad.id_HCE
);