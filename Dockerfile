FROM node:24-alpine

WORKDIR /app

# Copia os arquivos de dependências primeiro
COPY package*.json ./
COPY prisma ./prisma/

# Instala as dependências e gera o cliente do Prisma
RUN npm install
RUN npx prisma generate

# Copia o restante do código fonte da API
COPY . .

# Executa o build do TypeScript (Gera a pasta dist/)
RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]