# Avivas - Tienda de Indumentaria Deportiva

## Descripción del Proyecto

Avivas es una aplicación web de comercio electrónico desarrollada como proyecto para la materia Taller de Ruby de la Facultad de Informática de la Universidad Nacional de La Plata (UNLP) en la cursada 2024. La aplicación permite la gestión de productos deportivos (creación, edición, listado, control del stock, etc), usuarios con diferentes roles y funcionalidades de e-commerce.

## Tecnologías Utilizadas

### Versión de Ruby on Rails
- Ruby on Rails 8.0.0

### Gemas Utilizadas

1. **devise** *(utilizada para la autenticación de usuarios)*
   - Librería de autenticación completa
   - Gestiona registro, login, logout de usuarios
   - Proporciona controladores y vistas predeterminadas para la autenticación
   - Implementa funcionalidades de seguridad como recuperación de contraseña

2. **tailwindcss-rails** *(utilizada para el diseño y estilización de la interfaz)*
   - Integración de Tailwind CSS directamente en el proyecto Rails
   - Framework de estilos utilitario para diseño rápido y responsive
   - Permite crear interfaces modernas y personalizables

3. **kaminari** *(utilizada para la paginación de tablas y listados)*
   - Gema para paginación de registros
   - Facilita la división de grandes conjuntos de datos en páginas
   - Personalizable y ligera
   - Soporta múltiples ORM (Object-Relational Mapping)

### Servicio Integrado

**Active Storage** *(utilizado para el manejo y almacenamiento de archivos)*
- Servicio nativo de Rails para manejo de archivos
- Gestiona la carga y almacenamiento de imágenes de productos
- Permite almacenamiento local y configuración con servicios en la nube como Amazon S3, Google Cloud Storage, etc.

### Librerías Frontend

1. **Flowbite** *(utilizada para componentes de interfaz de usuario)*
   - Librería de componentes basada en Tailwind CSS
   - Proporciona componentes de interfaz interactivos y prediseñados
   - Mejora la experiencia de usuario con elementos como modales, dropdowns, etc.


## Requisitos Previos

- Ruby 3.2.x
- Rails 8.0.0
- Node.js
- Yarn

## Instalación y Configuración

### 1. Clonar el Repositorio

```bash
git clone https://github.com/tu_usuario/avivas.git
cd avivas
```

### 2. Instalar Dependencias

```bash
# Instalar dependencias de Ruby
bundle install

# Instalar dependencias de JavaScript
yarn install

# Instalar Tailwind CSS
rails tailwindcss:install

# Compilar assets
rails assets:precompile
```

### 3. Configurar Base de Datos

```bash
# Crear base de datos
rails db:create

# Ejecutar migraciones
rails db:migrate

# Cargar datos semilla
rails db:seed
```

### 4. Iniciar Servidor

```bash
# Iniciar servidor de desarrollo
rails server
```
