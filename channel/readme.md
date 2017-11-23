**注意事项：该系列操作，都在前端项目的根目录(有package.json文件的目录)下进行**

## 安装运行环境
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash     #安装nvm
nvm --version             #查看nvm版本，如果提示nvm没有安装，则执行source ~/.bashrc 如果安装成功，则输出0.33.4
nvm install v8.4.0        #通过nvm安装node，如果卡住了，是因为网络(qiang)问题，就ctrl+c，重新执行一遍命令
nvm alias default v8.4.0  #设置node的默认版本
node --version            #确认node的版本，8.4.0
npm --version             #确认npm的版本， 5.3.0
npm install -g yarn pm2   #安装包管理、进程管理
yarn config set registry https://registry.npm.taobao.org/     #包仓库切换到国内源。
yarn config get registry                                      #确认包仓库设置成功，输出为：https://registry.npm.taobao.org/
```
## 部署并启动项目
### 配置nginx服务器，将API服务器与本项目映射到同一域下。
代码示例： 将api服务器映射为同域下/apis路径
```
location / {
  proxy_pass http://localhost:3000;  #渠道管理平台地址
  proxy_redirect default;
  proxy_http_version 1.1;
  proxy_set_header Upgrade $http_upgrade;
  proxy_set_header Connection 'upgrade';
  proxy_set_header Host $host;
  proxy_cache_bypass $http_upgrade;
}

location /apis {
  rewrite  ^/apis/(.*)$ /$1 break;
  proxy_pass   http://192.168.1.239:8287;  #api服务器地址
}
```
### 配置管理平台的启动端口
```
更改package.json文件，
start  为测试环境
server 为生产环境
将/apis改为nginx指定的路径，例如，上例中设置的/apis
如果3000或4000端口冲突，可以更改为其他端口
"start": "BASE_URL=/apis next start -p3000",
"server": "BASE_URL=/apis next start -p4000"
```
### 安装运行项目所需包，每次版本更新，都要走一遍
```
yarn  #安装项目所需要的包
```
### 启动项目。第一次启动运行start，后来的一律用restart，详情参考后文的PM2项目地址
```
pm2 start yarn --name "渠道管理--测试"  -- start    #启动测试环境的前端服务器
pm2 start yarn --name "渠道管理"  -- server         #启动生产环境的前端服务器

pm2 restart "渠道管理--测试"  #重启测试环境的前端服务器
pm2 restart "渠道管理"        #重启生产环境的前端服务器
```
附PM2项目地址，以供参考： https://github.com/Unitech/pm2/blob/master/README.md
