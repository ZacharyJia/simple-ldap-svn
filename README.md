# 支持ldap访问的SVN 服务器 Docker 镜像

该镜像运行带有 Apache 和 mod_dav_svn 的 SVN 服务器。它也配置了 SVN 服务器的 LDAP 认证。

## 组件

- Apache HTTPD 2.4
- Subversion
- mod_dav_svn - 在 Apache 中提供 SVN 服务器功能的模块
- OpenLDAP 客户端 - 用于 LDAP 认证

## 使用方法

将该目录下的`docker-compose.example.yml`文件中的内容复制到`docker-compose.yml`文件中，并根据实际情况修改其中的配置项。

使用以下命令启动容器:
```  
docker-compose up -d
```

这将在对应端口启动 SVN 服务器。

## 配置

可以设置以下环境变量来配置 SVN 服务器:

- `APACHE_LDAP_AUTH_URL` - 用于认证的 LDAP 服务器 URL
- `LDAP_BIND_DN` - 用于认证用户的 LDAP 账号
- `LDAP_BIND_PASSWORD` - LDAP 绑定账号的密码
- `LDAP_AUTH_NAME` - 认证提示中显示的域名

## 数据卷

- `/data` - 保存 SVN 仓库数据的位置。应该挂载到主机上以实现持久化。 

## 创建仓库

启动容器之后，默认没有可用的svn仓库。可以使用以下命令创建新仓库:

```
sudo docker compose exec svn /bin/sh -c "/bin/create-repo.sh {repo_name}"
```

请根据需要替换 {repo_name}。

## Dockerfile 详情

Dockerfile 安装所需的软件包,创建默认配置并暴露 80 端口。

`/data/svn_repos` 目录是为 SVN 仓库创建的。配置 `dav_svn.conf` 启用了 dav_svn 模块并配置它使用 LDAP 认证。
