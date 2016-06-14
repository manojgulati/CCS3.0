B = zeros(2,2);
for i = 1:size(V, 2)
    B = B + V(:,i) * I(:,i)';
end
B = B / size(V, 2);

[U,S,V2] = svd(B);
M = [1,0;0,det(U).*det(V2')];
A = U * M * V2';

% Vhat = B * I;

inv_B = inv(B);

% scatter(Vhat(1,:), V(1,:), 'b')
% hold on;
% scatter(Vhat(2,:), V(2,:), 'r')

for i=1:15
    I_pred(:,i) = inv_B*V(:,i);
end

plot(I_pred(1,1:15),'b');
hold on; grid on;
plot(I(1,1:15),'r');
