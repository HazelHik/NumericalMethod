function [k,p,P]= fixpt(p0,tol,max1)                         

P(1,1)=p0;                           %�������ʼֵ                        
for k=2:max1    %��������������ֹ�����������ɢ�����޷��ﵽ���þ��ȶ���ѭ��
    P(k,1)=g(P(k-1,1));                 %�����麯����ֵΪ�µ��Ա���ֵ
    err = abs(P(k)-P(k-1));
    relerr = err/(abs(P(k))+eps);   %�����������ֵ�Ľ��������
    P(k,2) = relerr;
    p = P(k);   
    dP(k)=df(P(k));              %�����ʱ����Ӧ�ĵ���ֵ
    if ((err<tol)||(relerr<tol))               %���Ƶ�������ﵽ�������ȼ�ֹͣ
        break
    end    
end
if k==max1                           %k��������������ʱδ�������ʾ
    disp('maximum number of iterations exceeded')
end

end
