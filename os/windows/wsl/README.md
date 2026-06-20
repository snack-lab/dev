 # WSL-Ubuntu

## 参考

 [Cloud-init](https://cloud-init.io/)

 [Cloud-init documentation](https://docs.cloud-init.io/en/latest/)

## 配置フォルダ

ubuntu-all.user-dataを配置する

%USERPROFILE%\.cloud-init

## WSLでインストール可能なディストリビューションを確認

```powershell
wsl --list --online
```

## WSL Ubuntu インストール

```powershell
wsl --install -d Ubuntu-24.04 --name cloud-init-test
```
## インストール確認

```powershell
wsl -l -v
```

## Ubuntu 起動

```powershell
wsl -d cloud-init-test
```

## 規定のディストリビューションに変更

```powershell
wsl -s cloud-init-test
```

## WSL Ubuntu アンインストール

```powershell
wsl --unregister cloud-init-test
```
