# TITAN - Backend del Módulo Académico

## Descripción del Proyecto

Este repositorio contiene el backend del módulo académico para el sistema **TITAN**, un Centro de Entrenamiento en Trabajo Seguro en Alturas. La API está diseñada para gestionar la programación de cursos, la inscripción de participantes, la validación de requisitos, el registro de asistencia y calificaciones, y la generación y gestión de certificados, siguiendo la normativa colombiana (Resolución 4272 de 2021 y Resolución 1178 de 2017).

El objetivo principal es automatizar y asegurar los procesos operativos del centro de entrenamiento, garantizando el cumplimiento de los estándares de seguridad y formación.

## Tecnologías Utilizadas

*   **Framework Web:** FastAPI
*   **Base de Datos:** MySQL
*   **ORM:** SQLAlchemy
*   **Conector MySQL:** PyMySQL
*   **Gestión de Entorno:** python-dotenv, pydantic-settings
*   **Seguridad:** passlib (para hashing de contraseñas), python-jose (para JWT)
*   **Validación de Datos:** Pydantic
*   **Generación de PDF:** fpdf2 (para certificados)
*   **Servidor ASGI:** Uvicorn

## Características Principales (Sprint 1 Implementado)

### Módulo de Cursos
*   **Programación de Cursos (HU-E01):**
    *   Permite programar cursos con detalles como nombre, tipo, fechas, horario, instructor, sede y cupo.
    *   Validación de disponibilidad del instructor para evitar cruces de horario.
    *   Validación de cupos y fechas.
*   **Inscripción de Participantes (HU-E02):**
    *   Inscripción de participantes a cursos programados.
    *   Manejo de concurrencia para el descuento de cupos.
    *   Prevención de inscripciones duplicadas.
*   **Validación de Requisitos para Inscripción (HU-E03):**
    *   Verificación automática de exámenes médicos vigentes.
    *   Validación de certificados previos vigentes para cursos de "Reentrenamiento".
    *   Bloqueo de inscripción si no se cumplen los requisitos.

### Estándar de Respuesta de la API
Todas las respuestas del backend siguen un formato JSON estandarizado para indicar éxito o error:

**Éxito:**
```json
{
  "success": true,
  "message": "Operación exitosa",
  "data": { "id_inscripcion": 1, "cupos_restantes": 9 },
  "error": null
}

