1) Credenciais AWS:
   
- Criar usuário IAM e colocar em algum grupo (ou criar o grupo) com acesso de admin
- Fazer o download das credenciais
- Configurar CLI AWS:
    
    'aws configure'
No aws configure, inserir as credenciais: 
    'cat new_user_credentials.csv'

2) Criar arquivo 'main.tf'

3) Adicionar key pair no EC2:
    - gerar chave: ssh-keygen -f terraform-aws -t rsa
    - mv terraform-aws ~/.ssh/
    - cp terraform-aws.pub ~/.ssh/
    -  ~/.ssh/
  
4) Deploy da primeira infra - instâncias EC2
    - sequência de comandos para deploy: init (inicializar o terraform), plan (mostra todas as alteracões), apply (efetiva as mudancas)

5) Criar security group
   - Para conectar-se à instância, o security group deve regras de entrada que permitam acesso SSH (para instâncias Linux) ou acesso RDP (para instâncias Windows). Link: https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/security-group-rules-reference.html
   - Criar security group
   - Associar security group às intâncias criadas (vpc_security_group_ids)
   - Fazer o SSH:
     - Ir na Instância > Conect
     - Copiar: ssh -i "terraform-alura.pem" ubuntu@ec2-54-232-199-52.sa-east-1.compute.amazonaws.com
     - Subtituir "terraform-alura.pem" pelo path onde a chave privada está localizada 'ssh -i ~/.ssh/terraform-aws ubuntu@ec2-54-232-199-52.sa-east-1.compute.amazonaws.com'

6)