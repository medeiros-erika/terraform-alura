1) Credenciais AWS:
   
- Criar usuário IAM e colocar em algum grupo (ou criar o grupo) com acesso de admin
- Fazer o download das credenciais
- Configurar CLI AWS:
    
    'aws configure'
No aws configure, inserir as credenciais: 
    'cat new_user_credentials.csv'

2) criar arquivo 'main.tf'

3) Adicionar key pair no EC2:
    - gerar chave: ssh-keygen -f terraform-aws -t rsa
    - mv terraform-aws ~/.ssh/
    - cp terraform-aws.pub ~/.ssh/
    -  ~/.ssh/
  
4) Deploy da primeira infra - instâncias EC2
    - sequência de comandos para deploy: init (inicializar o terraform), plan (mostra todas as alteracões), apply (efetiva as mudancas)