## 1. DevOps用サービスプリンシパルの準備

### 1-1 サービスプリンシパルの作成

1. [アプリの登録](https://docs.microsoft.com/ja-jp/power-bi/developer/embedded/embed-service-principal#step-1---create-an-azure-ad-app)を実施します。
2. 以下の情報をメモします。

- アプリケーション (クライアント) ID 
- ディレクトリ (テナント) ID

### 1-2 権限付与

1. [Azure portal を使用して Azure ロールを割り当てる](https://docs.microsoft.com/ja-jp/azure/role-based-access-control/role-assignments-portal?tabs=current)を参考に、作成したサービスプリンシパルを対象のリソースグループの共同作成者に設定します。

## 2. DevOps環境の作成

### 2-1. サインアップ

[Azure DevOpsにサインインする](https://docs.microsoft.com/ja-jp/azure/devops/user-guide/sign-up-invite-teammates?view=azure-devops)に従って、プロジェクトを作成します。

### 2-2. Repositryのインポート

### 2-3. サービス接続の作成

1. 

[参考](https://docs.microsoft.com/ja-jp/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#create-a-service-connection)

## 3. DevOpsパイプラインの実行

### 3-1. パイプライン定義の編集

1. [.ado/workflows/azure-pipelines.yml](.ado/workflows/azure-pipelines.yml)を開き、以下の変数を設定します。

- AZURE_SUBSCRIPTION_ID
- RESOURCE_GROUP_NAME

2. 



