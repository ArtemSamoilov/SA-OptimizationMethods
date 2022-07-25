% Function for Newton Method
function u_opt = iteration(A,f,u0)
    epsilon=0.001;
    n = length(f);
    J = @(u) 0.5*u'*A*u - f'*u; %����������
    dJ = @(u) A*u-f; %����������� �����������
    scalar = @(a,b) a'*b; %��������� ������������
    norma = @(a) sqrt(scalar(a,a)); %����� �������
    alpha_formula = @(u,p) -scalar(dJ(u),p)/scalar(A*p,p); %������� (2) �� �������� 38 ������ 
    beta_formula = @(u,p) scalar(dJ(u),A*p)/scalar(A*p,p); %������� (4\beta) �� �������� 39 ������
    
    u_tmp = zeros(n,2); %� ������ ������� ������� u_k, � �� ������ u_{k+1}
    p_tmp = zeros(n,2); %� ������ ������� ������ p_k, � �� ������ p_{k+1}
    u_tmp(:,1) = u0;
    p_tmp(:,1) = -dJ(u0);

    while norma(dJ(u_tmp(:,1)))/norma(f) > epsilon %��������� ������ �������
        alpha = alpha_formula(u_tmp(:,1),p_tmp(:,1)); %��������� �����
        u_tmp(:,2) = u_tmp(:,1)+alpha*p_tmp(:,1); %��������� ��������� uk �� ������� (4u) �� �������� 39 ������
        beta = beta_formula(u_tmp(:,2),p_tmp(:,1)); %��������� ����
        p_tmp(:,2) = -dJ(u_tmp(:,2)) + beta*p_tmp(:,1); %��������� ��������� uk �� ������� (4p) �� �������� 39 ������
        u_tmp = circshift(u_tmp,[0,-1]); %����������� �������� ������� ����� �� 1
        p_tmp = circshift(p_tmp,[0,-1]); %����������� �������� ������� ����� �� 1
    end
    u_opt=u_tmp(:,1);
end

