---
layout: post
title:  "Fabric-CA(非Docker)使用说明"
date:   2020-05-16
excerpt: "Stick to note down what I'v learnt"
tag:
- Hyperledger Fabric
- Fabric CA
---

<center><H2><b>Fabric-CA(非Docker)使用说明</b></H2></center><br>

## 下载二进制文件

Fabric CA服务器和CA客户端二进制文件可以从github下载。向下滚动到Assets并为您的机器类型选择最新的二进制文件。zip文件包含CA服务器和CA客户端二进制文件。在您通过使用这些二进制文件掌握了如何部署和运行CA之后，您可能希望使用Fabric CA映像，例如在Kubernetes或Docker部署中。

### Fabric服务二进制文件

在本文上，我们使用服务器二进制文件来部署三种不同类型的CA: TLS CA、组织CA和可选的中间CA。组织CA颁发身份证书。如果您决定包含一个中间CA，那么组织CA将作为中间CA的根CA或父服务器。如果您还不了解这些内容，那么您应该回顾有关计划使用CA的主题，以了解每种CA的用途及其差异。我们从不同的文件夹运行TLS CA、组织CA和中间CA。我们将把CA服务器二进制文件复制到每个文件夹。

### Fabric客户端二进制文件

同样，我们将Fabric CA客户机二进制文件复制到它自己的目录中。将CA客户端放在自己的文件夹中有助于证书管理，尤其是在需要与多个CA交互时。当您从CA客户端对CA服务器发出命令时，您可以通过修改请求上的CA服务器URL来针对特定的CA。因此，只需要一个Fabric CA客户端二进制文件，就可以使用它与多个CA进行交易。下面是关于使用Fabric CA客户端的更多信息。

## Fabric CA 客户端

注册身份或用户是将注册id和secret添加到CA数据库用户注册中心的过程。如果您使用LDAP服务器作为用户注册中心，则不需要注册步骤，因为LDAP数据库中已经存在身份标识。在用户注册之后，您可以使用Fabric CA客户端来登记身份，该身份是生成证书的过程，身份需要作为组织的一部分进行交易。当您提交注册请求时，Fabric CA客户端首先在本地生成私钥和公钥，然后将公钥发送给CA, CA将返回经过编码的签名证书。

由于您将使用单个CA客户端向多个CA提交注册和登记请求，因此在使用CA客户端时，证书管理非常重要。因此，最佳实践是为CA客户机将与之交互的每个CA服务器创建子文件夹，以存储生成的证书。

