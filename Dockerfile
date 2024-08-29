# 使用官方Node.js镜像作为基础镜像
FROM node:22.2.0-slim

# 设置工作目录
WORKDIR /app

# 复制package.json和package-lock.json到工作目录
COPY package.json ./

# 设置npm源为淘宝镜像 
RUN npm config set registry https://registry.npmmirror.com

# 安装项目依赖
RUN npm install

# 复制项目的所有文件到工作目录
COPY . .

# 构建项目
RUN npm run build

# 暴露应用运行的端口
EXPOSE 3000

# 启动应用
CMD ["npm", "run", "start"]