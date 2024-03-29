function total_Hu_Features = Extract_Hu_Features(data)
%��ȡHu������
[rows,cols,totalNum] = size(data);
total_Hu_Features = [];
for i = 1 : totalNum
    image = data(:,:,i);
    m00 = sum(sum(image));m10 = 0;m01 = 0;
    for j = 1 : rows
        for k = 1 : cols
            m10 = m10+j*image(j,k);
            m01 = m01+k*image(j,k);
        end
    end
    u10 = m10/m00;u01 = m01/m00;
    m20 = 0;m02 = 0;m11 = 0;m30 = 0;m12 = 0;m21 = 0;m03 = 0;
    for j = 1 : rows
        for k = 1 : cols
            m20 = m20+j^2*image(j,k);
            m02 = m02+k^2*image(j,k);
            m11 = m11+j*k*image(j,k);
            m30 = m30+j^3*image(j,k);
            m03 = m03+k^3*image(j,k);
            m12 = m12+j*k^2*image(j,k);
            m21 = m21+j^2*k*image(j,k);
        end
    end
    y00 = m00;
    y10 = 0;
    y01 = 0;
    y11 = m11-u01*m10;
    y20 = m20-u10*m10;
    y02 = m02-u01*m01;
    y30 = m30-3*u10*m20+2*u10^2*m10;
    y12 = m12-2*u01*m11-u10*m02+2*u01^2*m10;
    y21 = m21-2*u10*m11-u01*m20+2*u10^2*m01;
    y03 = m03-3*u01*m02+2*u01^2*m01;
    
    n20 = y20/m00^2;
    n02 = y02/m00^2;
    n11 = y11/m00^2;
    n30 = y30/m00^2.5;
    n03 = y03/m00^2.5;
    n12 = y12/m00^2.5;
    n21 = y21/m00^2.5;

    h1 = n20+n02;
    h2 = (n20-n02)^2+4*(n11)^2;
    h3 = (n30-3*n12)^2+(3*n21-n03)^2;
    h4 = (n30+n12)^2+(n21+n03)^2;
    h5 = (n30-3*n12)*(n30+n12)*((n30+n12)^2-3*(n21+n03)^2)+(3*n21-n03)*(n21+n03)*(3*(n30+n12)^2-(n21+n03)^2);
    h6 = (n20-n02)*((n30+n12)^2-(n21+n03)^2)+4*n11*(n30+n12)*(n21+n03);
    h7 = (3*n21-n03)*(n30+n12)*((n30+n12)^2-3*(n21+n03)^2)+(3*n12-n30)*(n21+n03)*(3*(n30+n12)^2-(n21+n03)^2);

    Hu = [h1,h2,h3,h4,h5,h6,h7];
    Hu = -1*sign(Hu).*log10(abs(Hu));
    total_Hu_Features = [total_Hu_Features;Hu];
end
end
