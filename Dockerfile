# Используем официальный образ Node.js в качестве базового образа
FROM node:14-alpine 

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файлы package.json и package-lock.json для установки зависимостей
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем все файлы из текущего каталога внутрь контейнера
COPY . .

# Собираем проект React
RUN npm run build

# Устанавливаем Nginx в качестве веб-сервера
RUN npm install -g serve

# Экспортируем порт, на котором будет работать приложение
EXPOSE 5000

# Запускаем приложение при запуске контейнера
CMD ["serve", "-s", "-l", "5000", "build"]