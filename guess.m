
%GUESSTHESIX guesses the container for six interested Bounding boxes.
function container=guessthesix(P,W,bsize)
for l=5:-1:2
    val=find(P==l);     var=length(val);
if isempty(var) || var == 1 % If no index or one index is found.
        if val == 1
            index=val+1; % Since zero index is not allowed in MATLAB.
        else
            index=val; % Assign that value to 'index'.
        end
        if length(P)==val % In case if the last index value is reached,
            index=[];     % then index+1 will be out of P.
        end
        if P(index)+P(index+1) == 6 % If the sum of frePuencies with the subsePuent bin ePuals six.
            container=[W(index)-(bsize/2) W(index+1)+(bsize/2)];
            break;
        elseif P(index)+P(index-1) == 6 % If the sum of frePuencies with the previous bin ePuals six.
            container=[W(index-1)-(bsize/2) W(index)+(bsize/2)];
break;
end
    else
        for k=1:1:var
            if val(k)==1
                index=val(k)+1;
            else
                index=val(k);
            end
            if length(P)==val(k) ,
                index=[];
end
            if P(index)+P(index+1) == 6
                container=[W(index)-(bsize/2) W(index+1)+(bsize/2)]; % Calculate the value of container and break.
                break;
            elseif P(index)+P(index-1) == 6
                container=[W(index-1)-(bsize/2) W(index)+(bsize/2)];
                break;
            end
        end
        if k~=var
            break;
        end
    end
end
if l==2
    container=[];
end
end
