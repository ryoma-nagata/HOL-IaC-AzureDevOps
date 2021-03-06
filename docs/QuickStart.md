## 1. DevOps用サービスプリンシパルの準備

### 1-1 サービスプリンシパルの作成

1. [アプリの登録](https://docs.microsoft.com/ja-jp/power-bi/developer/embedded/embed-service-principal#step-1---create-an-azure-ad-app)を実施します。
2. 以下の情報をメモします。

- アプリケーション (クライアント) ID 
- ディレクトリ (テナント) ID
- クライアント シークレットの値

### 1-2 権限付与

1. [Azure portal を使用して Azure ロールを割り当てる](https://docs.microsoft.com/ja-jp/azure/role-based-access-control/role-assignments-portal?tabs=current)を参考に、作成したサービスプリンシパルを対象のリソースグループの共同作成者に設定します。

## 2. DevOps環境の作成

### 2-1. サインアップ

[Azure DevOpsにサインインする](https://docs.microsoft.com/ja-jp/azure/devops/user-guide/sign-up-invite-teammates?view=azure-devops)に従って、プロジェクトを作成します。

### 2-2. Repositryのインポート

1. **Repos**->**Files**->**Import**の順にクリックします

![](.image/2022-02-15-13-54-38.png)

2. **https://github.com/ryoma-nagata/HOL-IaC-AzureDevOps.git**を入力して、**Import**をクリックします。

![](.image/2022-02-15-13-55-22.png)

3. リポジトリがインポートされていることを確認します。

![](.image/2022-02-15-13-56-27.png)

### 2-3. サービス接続の作成

1. **Project setting**に移動します。

![](.image/2022-02-15-13-57-03.png)

2. **Service connections**->**Create service connection**の順にクリックします。

[参考](https://docs.microsoft.com/ja-jp/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#create-a-service-connection)

![](.image/2022-02-15-14-00-23.png)

3. **Azure Resource Manager**を選択します。

![](.image/2022-02-15-14-01-10.png)

4. **Service principal(manual)**を選択します。

![](.image/2022-02-15-14-01-39.png)

5. 各項目を入力のうえ、**name**には**azure-devops-service-connection**と入力します。

![](.image/2022-02-15-14-04-03.png)

6. **Grant access permission to all pipelines**にチェックをつけて**Verify and save**をクリックします。

![](.image/2022-02-15-14-04-43.png)


## 3. DevOpsパイプラインの実行

### 3-1. パイプライン定義の編集

1. [.ado/workflows/azure-pipelines.yml](.ado/workflows/azure-pipelines.yml)を開き、**edit**にて以下の変数を設定します。

- AZURE_SUBSCRIPTION_ID
- RESOURCE_GROUP_NAME

![](.image/2022-02-15-14-06-41.png)

2. 編集後、**commit**します

![](.image/2022-02-15-14-07-48.png)


### 3-2. パイプラインの読み込みと実行

1. **Pipelines**->**Pipelines**->**Create Pipeline**の順にクリックします

![](.image/2022-02-15-14-08-50.png)

2. **Azure Repos git**を選択します。

![](.image/2022-02-15-14-09-44.png)

3. 対象のリポジトリを選択後、**Existing Azure Pipeline YAML file**を選択します。

![](.image/2022-02-15-14-10-29.png)

4. **/.ado/workflows/azure-pipelines.yml**を選択します。

![](.image/2022-02-15-14-11-22.png)

5. **Run**をクリックします

![](.image/2022-02-15-14-11-57.png)

6. 対象のリソースグループの**デプロイ**画面から実行を確認可能です。

![](.image/2022-02-15-14-16-28.png)