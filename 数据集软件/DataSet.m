function varargout = DataSet(varargin)
% DATASET MATLAB code for DataSet.fig
%      DATASET, by itself, creates a new DATASET or raises the existing
%      singleton*.
%
%      H = DATASET returns the handle to a new DATASET or the handle to
%      the existing singleton*.
%
%      DATASET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATASET.M with the given input arguments.
%
%      DATASET('Property','Value',...) creates a new DATASET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DataSet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DataSet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DataSet

% Last Modified by GUIDE v2.5 03-Apr-2018 16:47:28

% Begin initialization code - DO NOT EDIT
addpath ./λ�˴���
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @DataSet_OpeningFcn, ...
    'gui_OutputFcn',  @DataSet_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
global  line_table;
line_table = [2,4,1;1,3,2;2,4,2;1,3,1];

% --- Executes just before DataSet is made visible.
function DataSet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataSet (see VARARGIN)

% Choose default command line output for DataSet
handles.output = hObject;
setappdata(handles.DS_Figure,'Cflag',0);%Classification flag
setappdata(handles.DS_Figure,'Hflag',0);%Height flag
setappdata(handles.DS_Figure,'SVflag',0);%Save flag
setappdata(handles.DS_Figure,'NEXflag',0);%Next flag
set(handles.PDE,'Enable','off');
set(handles.VEC,'Enable','off');
set(handles.PRE,'Enable','off');
set(handles.NEX,'Enable','off');
set(handles.FRM,'Enable','off');
set(handles.H_D,'Enable','off');
set(handles.H_T,'Enable','off');
set(handles.DEL,'Enable','off');
set(handles.SV,'Enable','off');
set(handles.PedAction,'Enable','off');
set(handles.CarAction,'Enable','off');
set(handles.DriveTask,'Enable','off');
set(handles.AutoBehavior,'Enable','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DataSet wait for user response (see UIRESUME)
% uiwait(handles.DS_Figure);


% --- Outputs from this function are returned to the command line.
function varargout = DataSet_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in DriveTask.
function DriveTask_Callback(hObject, eventdata, handles)
% hObject    handle to DriveTask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag = get(hObject,'Value');
setappdata(handles.DS_Figure,'TFlag',flag);
switch flag
    case 1
        str = {'�󳬳�','�ҳ���','ǰ����������','����ʻ�복��','����ʻ�복��','����ʻ�복��','����ʻ�복��','����ֱ��'};
        handles.CarAction.String = str;
    case 2
        str = {'��ǰ����������','����ʻ�복��','����ʻ�복��','����ֱ��'};
        handles.CarAction.String = str;
    case 3
        str = {'��ǰ����������','����ʻ�복��','����ʻ�복��','����ʻ�복��','����ʻ�복��','����ֱ��'};
        handles.CarAction.String = str;
    case 4
        str = {'�󳬳�','�ҳ���','��ǰ����������','����ʻ�복��','����ʻ�복��','����ʻ�복��','����ʻ�복��','����ֱ��'};
        handles.CarAction.String = str;
        str = {'��·��ֱ���ܲ�����','��·��ֱ����������','�����ܲ��ᴩ','���������ᴩ','�����ܲ��ᴩ','���������ᴩ','פͣ'};
        handles.PedAction.String = str;
    case 5
        str = {'��ǰ����������','����ʻ�복��','����ʻ�복��','����ֱ��'};
        handles.CarAction.String = str;
        str = {'�����ܲ��ᴩ','���������ᴩ','�����ܲ��ᴩ','���������ᴩ','פͣ'};
        handles.PedAction.String = str;
    case 6
        str = {'��ǰ����������','����ֱ��'};
        handles.CarAction.String = str;
        str = {'�����ܲ��ᴩ','���������ᴩ','�����ܲ��ᴩ','���������ᴩ','פͣ'};
        handles.PedAction.String = str;
end
set(handles.AutoBehavior,'Enable','on');

% Hints: contents = cellstr(get(hObject,'String')) returns DriveTask contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DriveTask


% --- Executes during object creation, after setting all properties.
function DriveTask_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DriveTask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in AutoBehavior.
function AutoBehavior_Callback(hObject, eventdata, handles)
% hObject    handle to AutoBehavior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag = get(hObject,'Value');
setappdata(handles.DS_Figure,'BFlag',flag);
% Hints: contents = cellstr(get(hObject,'String')) returns AutoBehavior contents as cell array
%        contents{get(hObject,'Value')} returns selected item from AutoBehavior


% --- Executes during object creation, after setting all properties.
function AutoBehavior_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AutoBehavior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in PDE.
function PDE_Callback(hObject, eventdata, handles)
% hObject    handle to PDE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.DS_Figure,'Cflag',1);
setappdata(handles.DS_Figure,'color','r');
set(handles.PedAction,'Enable','on');
set(handles.CarAction,'Enable','off');
% --- Executes on button press in VEC.
function VEC_Callback(hObject, eventdata, handles)
% hObject    handle to VEC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.DS_Figure,'Cflag',2);
setappdata(handles.DS_Figure,'color','g');
set(handles.PedAction,'Enable','off');
set(handles.CarAction,'Enable','on');

function PedAction_Callback(hObject, eventdata, handles)
% hObject    handle to PedAction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
tmp = get(hObject,'Value');
setappdata(handles.DS_Figure,'AFlag',tmp); 
setappdata(handles.DS_Figure,'AStr',contents{tmp});
% --- Executes during object creation, after setting all properties.
function PedAction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PedAction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in CarAction.
function CarAction_Callback(hObject, eventdata, handles)
% hObject    handle to CarAction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
tmp = get(hObject,'Value');
setappdata(handles.DS_Figure,'AFlag',tmp); 
setappdata(handles.DS_Figure,'AStr',contents{tmp});

% --- Executes on selection change in idBox.
function idBox_Callback(hObject, eventdata, handles)
% hObject    handle to idBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
tmp = get(hObject,'Value');
if tmp == 1
    NVal = str2double(contents(end))+1;
    if isnan(NVal)
        NVal = 1;
    end
    contents(end+1) = {num2str(NVal)};
    hObject.String = contents;
else 
    VAL = str2double(contents(tmp));
    setappdata(handles.DS_Figure,'IFlag',VAL);
    setappdata(handles.DS_Figure,'IStr',contents{tmp});
end
% Hints: contents = cellstr(get(hObject,'String')) returns idBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from idBox


% --- Executes during object creation, after setting all properties.
function idBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to idBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function CarAction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CarAction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function DEL_Callback(hObject, eventdata, handles)
% hObject    handle to DEL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
NEXflag = getappdata(handles.DS_Figure,'NEXflag');
if NEXflag == 0
    btnName = questdlg('�Ƿ�ɾ�����б�ע���','����','ȷ��ɾ��','ȡ��','ȡ��');
else
    btnName = 'ȷ��ɾ��';
end
if strcmp(btnName,'ȷ��ɾ��')
    CFtemp = getappdata(handles.axes_laser,'ClassFlag');
    Vt2dtemp = getappdata(handles.axes_laser,'Vertex2d');
    HDtemp = getappdata(handles.axes_laser,'H_D');
    HTtemp = getappdata(handles.axes_laser,'H_T');
    Otemp = getappdata(handles.axes_laser,'Direct');
    SPttemp = getappdata(handles.axes_laser,'SlcPoint');
    CBtemp = getappdata(handles.axes_laser,'Cube');
    CB2dtemp = getappdata(handles.axes_laser,'Cube2d');
    AdLinetemp = getappdata(handles.axes_laser,'AdjLine');
    AFtemp = getappdata(handles.axes_laser,'ActionFlag');
    ASPtemp = getappdata(handles.axes_laser,'ActionStrPlot');
    TFtemp = getappdata(handles.axes_laser,'TaskFlag');
    BFtemp = getappdata(handles.axes_laser,'BehaviorFlag');
    IFtemp = getappdata(handles.axes_laser,'IDFlag');
    if ~isempty(CFtemp)
        CFtemp = [];
        setappdata(handles.axes_laser,'ClassFlag',CFtemp);
    end
    if ~isempty(Vt2dtemp)
        Vt2dtemp = [];
        setappdata(handles.axes_laser,'Vertex2d',Vt2dtemp);
    end
    if ~isempty(HDtemp)
        HDtemp = [];
        setappdata(handles.axes_laser,'H_D',HDtemp);
        if ~isempty(HDtemp)
            set(handles.H_D,'String',num2str(HDtemp(end)));
        else
            set(handles.H_D,'String','');
        end;
    end
    if ~isempty(HTtemp)
        HTtemp = [];
        setappdata(handles.axes_laser,'H_T',HTtemp);
        if ~isempty(HTtemp)
            set(handles.H_T,'String',num2str(HTtemp(end)));
        else
            set(handles.H_T,'String','');
        end
    end
    if ~isempty(Otemp)
        Otemp = [];
        setappdata(handles.axes_laser,'Direct',Otemp);
    end
    if ~isempty(SPttemp)
        delete(SPttemp);
        SPttemp = [];
        setappdata(handles.axes_laser,'SlcPoint',SPttemp);
    end
    if ~isempty(CBtemp)
        delete(CBtemp);
        CBtemp = [];
        if isempty(CBtemp)
            set(handles.H_D,'Enable','off');
            set(handles.H_T,'Enable','off');
            set(handles.DEL,'Enable','off');
            set(handles.SV,'Enable','off');
        end
        setappdata(handles.axes_laser,'Cube',CBtemp);
    end
    if ~isempty(CB2dtemp)
        delete(CB2dtemp);
        CB2dtemp = [];
        setappdata(handles.axes_laser,'Cube2d',CB2dtemp);
    end
    if ~isempty(AdLinetemp)
        delete(AdLinetemp);
        AdLinetemp = [];
        setappdata(handles.axes_laser,'AdjLine',AdLinetemp);
    end
    if ~isempty(AFtemp)
        AFtemp = [];
        setappdata(handles.axes_laser,'ActionFlag',AFtemp);
    end
    if ~isempty(ASPtemp)
        delete(ASPtemp);
        ASPtemp = [];
        setappdata(handles.axes_laser,'ActionStrPlot',ASPtemp);
    end
    if ~isempty(TFtemp)
        TFtemp = [];
        setappdata(handles.axes_laser,'TaskFlag',TFtemp);
    end
    if ~isempty(BFtemp)
        BFtemp = [];
        setappdata(handles.axes_laser,'BehaviorFlag',BFtemp);
    end
    if ~isempty(IFtemp)
        IFtemp = [];
        setappdata(handles.axes_laser,'IDFlag',IFtemp);
    end
    setappdata(handles.DS_Figure,'ActionObject',[]);
    setappdata(handles.DS_Figure,'SVflag',0);
end
% --- Executes on button press in PRE.
function PRE_Callback(hObject, eventdata, handles)
% hObject    handle to PRE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ind = getappdata(handles.DS_Figure,'Index');
setappdata(handles.DS_Figure,'Index',Ind-1);
Ind = num2str(Ind-1);
set(handles.FRM,'String',Ind);
FRM_Callback(handles.FRM, eventdata, handles);
% --- Executes on button press in NEX.
function NEX_Callback(hObject, eventdata, handles)
% hObject    handle to NEX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SVflag = getappdata(handles.DS_Figure,'SVflag');
if SVflag == 0
    btnName = questdlg('�Ƿ񱣴��ע���','��ʾ','����','������','ȡ��','����');
    switch btnName
        case '����'
            SV_Callback(handles.axes_laser, eventdata, handles);
        case 'ȡ��'
            return
        case ' '
            return
        case '������'
    end
end
setappdata(handles.DS_Figure,'NEXflag',1);
Ind = getappdata(handles.DS_Figure,'Index');
setappdata(handles.DS_Figure,'Index',Ind+1);
Ind = num2str(Ind+1);
set(handles.FRM,'String',Ind);
FRM_Callback(handles.FRM, eventdata, handles);
% DEL_Callback(handles.DEL, eventdata, handles);
% setappdata(handles.DS_Figure,'SVflag',0);
setappdata(handles.DS_Figure,'NEXflag',0);

function axes_laser_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes_laser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pFlag = getappdata(handles.DS_Figure,'PressFlag');
if pFlag == 0
    return
end
CFlag = getappdata(handles.DS_Figure,'Cflag');
IFlag = getappdata(handles.DS_Figure,'IFlag');
if isempty(IFlag)
    return
end
num = length(getappdata(handles.axes_laser,'ClassFlag'));
if CFlag == 0
    return
end
clr = getappdata(handles.DS_Figure,'color');
if strcmp(get(handles.DS_Figure,'SelectionType'),'normal')
    for i = 1:4
        % pt = get(gca,'CurrentPoint');
        % axes(handles.axes_laser);
        pt = ginput(1);
        X(i,1) = pt(1,1);
        X(i,2) = pt(1,2);
        if i<3
            Pt(i) = plot(X(i,1),X(i,2),['o',clr]);
            Y(i,:) = X(i,:);
        end
        if i == 2
            L(1) = line(Y(1:2,1),Y(1:2,2),'color',clr,'tag',[num2str(num+1),'.1'],'ButtondownFcn',{@Recfun,handles});
        end
        if i == 3
            Y(3,:) = X(3,:)+(X(1,:)-X(2,:))*((X(3,:)-X(2,:))*(X(2,:)-X(1,:))')/((X(2,:)-X(1,:))*(X(2,:)-X(1,:))');
            Pt(3) = plot(Y(3,1),Y(3,2),['o',clr]);
            Y(4,:) = Y(3,:)+(X(1,:)-X(2,:));
            Pt(4) = plot(Y(4,1),Y(4,2),['o',clr]);
            L(2) = line(Y(2:3,1),Y(2:3,2),'color',clr,'tag',[num2str(num+1),'.2'],'ButtondownFcn',{@Recfun,handles});
            L(3) = line(Y([4,3],1),Y([4,3],2),'color',clr,'tag',[num2str(num+1),'.3'],'ButtondownFcn',{@Recfun,handles});
            L(4) = line(Y([1,4],1),Y([1,4],2),'color',clr,'tag',[num2str(num+1),'.4'],'ButtondownFcn',{@Recfun,handles});
        end
        if i==4
            O(1,:) = (Y(2,:)+Y(3,:))/2+(Y(1,:)-Y(2,:))/2;
            flag1 = (Y(2,:)-O(1,:))*(X(4,:)-O(1,:))';
            flag2 = (Y(3,:)-O(1,:))*(X(4,:)-O(1,:))';
            if flag1>0
                if flag2>0
                    O(2,:) = O(1,:)+3/4*(Y(2,:)-Y(1,:));
                else
                    O(2,:) = O(1,:)+3/4*(Y(2,:)-Y(3,:));
                end
            else
                if flag2>0
                    O(2,:) = O(1,:)-3/4*(Y(2,:)-Y(3,:));
                else
                    O(2,:) = O(1,:)-3/4*(Y(2,:)-Y(1,:));
                end
            end
            L(5) = line(O(:,1),O(:,2),'color',clr);
            L(6) = plot(O(1,1),O(1,2),['o',clr],'tag',[num2str(num+1),'.6'],'ButtondownFcn',{@Recfun,handles});
            L(7) = plot(O(2,1),O(2,2),['o',clr],'tag',[num2str(num+1),'.7'],'ButtondownFcn',{@Recfun,handles});
        end
    end
    %% ����ھ��ο��еĵ㲢�洢
    pcData = getappdata(handles.DS_Figure,'pcData');
    in = inpolygon(pcData(:,1),pcData(:,2),Y(:,1),Y(:,2));
    if isempty(pcData(in,:))
%         ClassFlag(end) = [];
%         setappdata(hObject,'ClassFlag',ClassFlag);
%         Direct(end-1:end,:) = [];
%         setappdata(hObject,'Direct',Direct);
%         Vertex2d(end-3:end,:) = [];
%         setappdata(hObject,'Vertex2d',Vertex2d);
        delete(L);
        delete(Pt);
        return
    end
    axes(handles.axes_laser);
    SPt = plot3(pcData(in,1),pcData(in,2),pcData(in,3),['d',clr]);
    SlcPoint = getappdata(hObject,'SlcPoint');
    SlcPoint = [SlcPoint,SPt];
    setappdata(hObject,'SlcPoint',SlcPoint);
    %% �洢��������ǩ
    ClassFlag = getappdata(hObject,'ClassFlag');
    ClassFlag = [ClassFlag,CFlag];
    setappdata(hObject,'ClassFlag',ClassFlag);
    %% �洢����ID��ǩ
    IDFlag = getappdata(hObject,'IDFlag');
    IDFlag = [IDFlag,IFlag];
    setappdata(hObject,'IDFlag',IDFlag);
    %% �洢������Ϊ��ǩ
    AFlag = getappdata(handles.DS_Figure,'AFlag');
    ActionFlag = getappdata(hObject,'ActionFlag');
    ActionFlag = [ActionFlag,AFlag];
    setappdata(hObject,'ActionFlag',ActionFlag);
    %% �洢��ʻ�����ǩ
    TFlag = getappdata(handles.DS_Figure,'TFlag');
    TaskFlag = getappdata(hObject,'TaskFlag');
    TaskFlag = [TaskFlag,TFlag];
    setappdata(hObject,'TaskFlag',TaskFlag);   
    %% �洢������Ϊ��ǩ
    BFlag = getappdata(handles.DS_Figure,'BFlag');
    BehaviorFlag = getappdata(hObject,'BehaviorFlag');
    BehaviorFlag = [BehaviorFlag,BFlag];
    setappdata(hObject,'BehaviorFlag',BehaviorFlag);
    %% �洢ѡ��ķ���
    Direct = getappdata(hObject,'Direct');
    Direct = [Direct;O];
    setappdata(hObject,'Direct',Direct);
    %% �洢ѡ����ĸ���
    Vertex2d = getappdata(hObject,'Vertex2d');
    Vertex2d = [Vertex2d;Y];
    setappdata(hObject,'Vertex2d',Vertex2d);
    %% �������������С���߶Ȳ��洢,������ʾ�ڵײ��߶ȺͶ����߶ȵ����ֿ���
    H_D = min(pcData(in,3));
    H_T = max(pcData(in,3));
    for ii = 1:7
        if ii<6
        L(ii).ZData = [H_T+0.5,H_T+0.5];
        else
        L(ii).ZData = H_T+0.5;
        end
    end
    H_Dtemp = getappdata(hObject,'H_D');
    H_Dtemp = [H_Dtemp,H_D];
    setappdata(hObject,'H_D',H_Dtemp);
    H_Ttemp = getappdata(hObject,'H_T');
    H_Ttemp = [H_Ttemp,H_T];
    setappdata(hObject,'H_T',H_Ttemp);
    set(handles.H_D,'String',num2str(H_D));
    set(handles.H_T,'String',num2str(H_T));
    %% �ڷ��򸽽���ע��Ϊ��ID���洢
    AStr = getappdata(handles.DS_Figure,'AStr');
    IStr = getappdata(handles.DS_Figure,'IStr');
    AStrPlot = text(L(1).XData(2),L(1).YData(2),L(1).ZData(2),['\leftarrow',IStr,AStr]);
    ActionStrPlot = getappdata(hObject,'ActionStrPlot');
    ActionStrPlot = [ActionStrPlot,AStrPlot];
    setappdata(hObject,'ActionStrPlot',ActionStrPlot);
    %% ������С���߶������������岢�洢
    Pt3 = [Y,repmat(H_D,4,1);Y,repmat(H_T,4,1)];
    Pt3_Draw = [Pt3(1:4,:);Pt3(1,:);Pt3(5:8,:);Pt3(5:6,:);Pt3(2:3,:);Pt3(7:8,:);Pt3(4,:)];
    Cb(1) = line(Pt3_Draw(:,1),Pt3_Draw(:,2),Pt3_Draw(:,3),'color',clr);
    Cb(2) = plot3(Pt3(:,1),Pt3(:,2),Pt3(:,3),['o',clr]);
    Cb(3) = line(O(:,1),O(:,2),repmat(H_D,2,1),'color',clr);
    %     delete(L);
    delete(Pt);
    Cube = getappdata(hObject,'Cube');
    Cube = [Cube;Cb];
    setappdata(hObject,'Cube',Cube);
    %% ��������ͶӰ�ڶ�άͼ���в��洢
    RT = getappdata(handles.DS_Figure,'RT');
    calib = getappdata(handles.DS_Figure,'Calib_Results');
    I = getappdata(handles.DS_Figure,'Image');
    Pt2_Draw = show_laser_to_image5(I,Pt3_Draw,RT.R,RT.t,calib);
    Pt2_Direct = show_laser_to_image5(I,[O(:,1),O(:,2),repmat(H_D,2,1)],RT.R,RT.t,calib);
    axes(handles.axes_pic);
    Cb2d(1) = line(Pt2_Draw(:,1),Pt2_Draw(:,2),'color',clr);
    Cb2d(2) = line(Pt2_Direct(:,1),Pt2_Direct(:,2),'color',clr);
    Cube2d = getappdata(hObject,'Cube2d');
    Cube2d = [Cube2d;Cb2d];
    setappdata(hObject,'Cube2d',Cube2d);
    %% ��������ֱ��L(1:7)�洢������������ʹ��
    AdjLine = getappdata(handles.axes_laser,'AdjLine');
    AdjLine = [AdjLine;L];
    setappdata(handles.axes_laser,'AdjLine',AdjLine);
    %% ����H_D, H_T, DEL��SV
    set(handles.H_D,'Enable','on');
    set(handles.H_T,'Enable','on');
    set(handles.DEL,'Enable','on');
    set(handles.SV,'Enable','on');
    %% ����H_D��H_T�����ö���
    A = [num+1,1]; 
    setappdata(handles.DS_Figure,'ActionObject',A);
    %% ���ô洢��־
    setappdata(handles.DS_Figure,'SVflag',0);
end
if strcmp(get(handles.DS_Figure,'SelectionType'),'alt')
    %% ɾ��ClassFlag,Vertex2d,H_D,H_T,Direct,SlcPoint,Cube,Cube2d,AdjLine,ActionFlag,ActionStrPlot,TaskFlag,BehaviorFlag,IDFlag 
    CFtemp = getappdata(hObject,'ClassFlag');
    Vt2dtemp = getappdata(hObject,'Vertex2d');
    HDtemp = getappdata(hObject,'H_D');
    HTtemp = getappdata(hObject,'H_T');
    Otemp = getappdata(hObject,'Direct');
    SPttemp = getappdata(hObject,'SlcPoint');
    CBtemp = getappdata(hObject,'Cube');
    CB2dtemp = getappdata(hObject,'Cube2d');
    ALtemp = getappdata(hObject,'AdjLine');
    AFtemp = getappdata(hObject,'ActionFlag');
    ASPtemp = getappdata(hObject,'ActionStrPlot');
    TFtemp = getappdata(hObject,'TaskFlag');
    BFtemp = getappdata(hObject,'BehaviorFlag');
    IFtemp = getappdata(hObject,'IDFlag');
    if ~isempty(CFtemp)
        CFtemp(end) = [];
        setappdata(hObject,'ClassFlag',CFtemp);
    end
    if ~isempty(Vt2dtemp)
        Vt2dtemp(end-3:end,:) = [];
        setappdata(hObject,'Vertex2d',Vt2dtemp);
    end
    if ~isempty(HDtemp)
        HDtemp(end) = [];
        setappdata(hObject,'H_D',HDtemp);
        if ~isempty(HDtemp)
            set(handles.H_D,'String',num2str(HDtemp(end)));
        else
            set(handles.H_D,'String','');
        end;
    end
    if ~isempty(HTtemp)
        HTtemp(end) = [];
        setappdata(hObject,'H_T',HTtemp);
        if ~isempty(HTtemp)
            set(handles.H_T,'String',num2str(HTtemp(end)));
        else
            set(handles.H_T,'String','');
        end
    end
    if ~isempty(Otemp)
        Otemp(end-1:end,:) = [];
        setappdata(hObject,'Direct',Otemp);
    end
    if ~isempty(SPttemp)
        delete(SPttemp(end));
        SPttemp(end) = [];
        setappdata(hObject,'SlcPoint',SPttemp);
    end
    if ~isempty(CBtemp)
        delete(CBtemp(end,:));
        CBtemp(end,:) = [];
        if isempty(CBtemp)
            set(handles.H_D,'Enable','off');
            set(handles.H_T,'Enable','off');
            set(handles.DEL,'Enable','off');
            set(handles.SV,'Enable','off');
        end
        setappdata(hObject,'Cube',CBtemp);
    end
    if ~isempty(CB2dtemp)
        delete(CB2dtemp(end,:));
        CB2dtemp(end,:) = [];
        setappdata(hObject,'Cube2d',CB2dtemp);
    end
    if ~isempty(ALtemp)
        delete(ALtemp(end,:));
        ALtemp(end,:) = [];
        setappdata(hObject,'AdjLine',ALtemp);
    end
    if ~isempty(AFtemp)
        AFtemp(end) = [];
        setappdata(hObject,'ActionFlag',AFtemp);
    end
    if ~isempty(ASPtemp)
        delete(ASPtemp(end));
        ASPtemp(end) = [];
        setappdata(hObject,'ActionStrPlot',ASPtemp);
    end
    if ~isempty(TFtemp)
        TFtemp(end) = [];
        setappdata(hObject,'TaskFlag',TFtemp);
    end
    if ~isempty(BFtemp)
        BFtemp(end) = [];
        setappdata(hObject,'BehaviorFlag',BFtemp);
    end
    if ~isempty(IFtemp)
        IFtemp(end) = [];
        setappdata(hObject,'IDFlag',IFtemp);
    end
    %% ��������ActionObject���ı�H_D��H_T�����ö���
    A = getappdata(handles.DS_Figure,'ActionObject');
    A(1) = length(CFtemp);
    setappdata(handles.DS_Figure,'ActionObject',A);
    if ~isempty(HTtemp)
    set(handles.H_T,'String',num2str(HTtemp(end)));
    set(handles.H_D,'String',num2str(HDtemp(end)));
    else
    set(handles.H_T,'String','');
    set(handles.H_D,'String','');
    end
    %% ���ô洢��־
    setappdata(handles.DS_Figure,'SVflag',0);
end
% --- Executes on button press in DIR.
function DIR_Callback(hObject, eventdata, handles)
% hObject    handle to DIR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~exist('folder.txt','file')
    folder_name  = uigetdir('','ѡ�������ļ���');
    if isequal(folder_name,0)
        return
    end
    folder_laser = uigetdir(folder_name,'ѡ�񼤹������ļ���');
    folder_pic = uigetdir(folder_name,'ѡ��ͼ�������ļ���');
    if isequal(folder_name,0) || isequal(folder_laser,0) || isequal(folder_pic,0)
        return
    end
    fid = fopen('folder.txt','w');
    fprintf(fid,'%s\n',folder_name);
    fprintf(fid,'%s\n',folder_laser);
    fprintf(fid,'%s\n',folder_pic);
else
    btnName = questdlg('�Ƿ�ʹ����һ�ε�ͼ�񼤹������ļ��У�','��ʾ','ʹ��','��ʹ��','ʹ��');
    switch btnName
        case 'ʹ��'
            fid = fopen('folder.txt');
            folder_name = fgetl(fid);
            folder_laser = fgetl(fid);
            folder_pic = fgetl(fid);
        case '��ʹ��'
            folder_name  = uigetdir('','ѡ�������ļ���');
            if isequal(folder_name,0)
                return
            end
            folder_laser = uigetdir(folder_name,'ѡ�񼤹������ļ���');
            folder_pic = uigetdir(folder_name,'ѡ��ͼ�������ļ���');
            if isequal(folder_name,0) || isequal(folder_laser,0) || isequal(folder_pic,0)
                return
            end
            fid = fopen('folder.txt','w');
            fprintf(fid,'%s\n',folder_name);
            fprintf(fid,'%s\n',folder_laser);
            fprintf(fid,'%s\n',folder_pic);
        otherwise
            return
    end
end
setappdata(handles.DS_Figure,'LaserRoot',[folder_laser,'\']);
setappdata(handles.DS_Figure,'PicRoot',[folder_pic,'\']);
setappdata(handles.DS_Figure,'DataRoot',[folder_name,'\']);

PoseDataRoot = [folder_laser,'\SimplePose.txt'];
if ~exist(PoseDataRoot,'file')
    CvtPoseFun(laserRoot)
end
labelRoot = [folder_name,'\Label'];
if ~exist(labelRoot,'dir')
    mkdir(labelRoot);
end
setappdata(handles.DS_Figure,'labelRoot',[labelRoot,'\']);
L = load(PoseDataRoot);
setappdata(handles.DS_Figure,'SimPose',L);
txtnumberRoot = [folder_name,'\txtnumber.txt'];
AA = load(txtnumberRoot);
setappdata(handles.DS_Figure,'txtnumber',AA);
RT = load([folder_name,'\Rt.mat']);
setappdata(handles.DS_Figure,'RT',RT);
Calib = load([folder_name,'\Calib_Results.mat']);
setappdata(handles.DS_Figure,'Calib_Results',Calib);
set(handles.FRM,'Enable','on');
function FRM_Callback(hObject, eventdata, handles)
% hObject    handle to FRM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FRM as text
%        str2double(get(hObject,'String')) returns contents of FRM as a double
setappdata(handles.DS_Figure,'NEXflag',1);
DEL_Callback(handles.DEL, eventdata, handles);
setappdata(handles.DS_Figure,'NEXflag',0);
Ind = str2double(get(hObject,'String'));
setappdata(handles.DS_Figure,'Index',Ind);
DataRoot = getappdata(handles.DS_Figure,'DataRoot');
LaserRoot = getappdata(handles.DS_Figure,'LaserRoot');
LL = getappdata(handles.DS_Figure,'SimPose');
AA = getappdata(handles.DS_Figure,'txtnumber');
PicRoot = getappdata(handles.DS_Figure,'PicRoot');
if ~isnan(Ind)
    axes(handles.axes_laser);
    hold on;
    cla;
    pcData = show3d(DataRoot,LaserRoot,AA(Ind,1),LL);
    setappdata(handles.DS_Figure,'pcData',pcData);
    view(2);
    axes(handles.axes_pic);
    cla;
    I = imread([PicRoot,num2str(AA(Ind,1)),'.jpg']);
    setappdata(handles.DS_Figure,'Image',I);
    imshow(I);
end
labelRoot = getappdata(handles.DS_Figure,'labelRoot');
Ind1 = sprintf('%06d',Ind);
txtRoot = [labelRoot,Ind1,'.txt'];
if exist(txtRoot,'file')
fid = fopen(txtRoot,'r');
IDFlag = [];
TaskFlag = [];
BehaviorFlag = [];
ClassFlag = [];
ActionFlag = [];
Vertex2d = [];
Direct = [];
SlcPoint = [];
H_Dtemp = [];
H_Ttemp = [];
ActionStrPlot = [];
Cube = [];
Cube2d = [];
AdjLine = [];
num = -1;
while ~feof(fid)
    num = num+1;
    tline = fgetl(fid);    
    A = strsplit(tline);
    IFlag = str2double(A{1});
    TFlag = str2double(A{2});
    BFlag = str2double(A{3});
    CFlag = str2double(A{4});
    if CFlag == 1
        clr = 'r';
    else
        clr = 'g';
    end
    AFlag = str2double(A{5});
    O(1,:) = [str2double(A{6}),str2double(A{7})];
    O(2,:) = [str2double(A{10}),str2double(A{11})] + O(1,:);
    L1 = str2double(A{8});
    L2 = str2double(A{9});
    D1 = (O(2,:)-O(1,:))/sqrt((O(2,:)-O(1,:))*(O(2,:)-O(1,:))');
    D2 = [D1(2),-D1(1)];
    Y(1,:) = O(1,:)+L1*D1+L2*D2;
    Y(2,:) = O(1,:)+L1*D1-L2*D2;
    Y(3,:) = O(1,:)-L1*D1-L2*D2;
    Y(4,:) = O(1,:)-L1*D1+L2*D2;
    axes(handles.axes_laser);
    L(1) = line(Y(1:2,1),Y(1:2,2),'color',clr,'tag',[num2str(num+1),'.1'],'ButtondownFcn',{@Recfun,handles});
    L(2) = line(Y(2:3,1),Y(2:3,2),'color',clr,'tag',[num2str(num+1),'.2'],'ButtondownFcn',{@Recfun,handles});
    L(3) = line(Y([4,3],1),Y([4,3],2),'color',clr,'tag',[num2str(num+1),'.3'],'ButtondownFcn',{@Recfun,handles});
    L(4) = line(Y([1,4],1),Y([1,4],2),'color',clr,'tag',[num2str(num+1),'.4'],'ButtondownFcn',{@Recfun,handles});
    L(5) = line(O(:,1),O(:,2),'color',clr);
    L(6) = plot(O(1,1),O(1,2),['o',clr],'tag',[num2str(num+1),'.6'],'ButtondownFcn',{@Recfun,handles});
    L(7) = plot(O(2,1),O(2,2),['o',clr],'tag',[num2str(num+1),'.7'],'ButtondownFcn',{@Recfun,handles});
    H_D = str2double(A{12});
    H_T = str2double(A{13});
    %% �ָ���������ǩ
    ClassFlag = [ClassFlag,CFlag];
    %% �ָ�������Ϊ��ǩ
    ActionFlag = [ActionFlag,AFlag];
    %% �ָ���ʻ�����ǩ
    TaskFlag = [TaskFlag,TFlag];
    %% �ָ�������Ϊ��ǩ
    BehaviorFlag = [BehaviorFlag,BFlag];
    %% �ָ�ѡ��ķ���
    Direct = [Direct;O];
    %% �ָ�ѡ����ĸ���
    Vertex2d = [Vertex2d;Y];
    %% �ָ�ID��ǩ
    IDFlag = [IDFlag,IFlag];
    %% �ָ�����ھ��ο��еĵ�
    pcData = getappdata(handles.DS_Figure,'pcData');
    in = inpolygon(pcData(:,1),pcData(:,2),Y(:,1),Y(:,2));
    pcData = pcData(in,:);
    in = find(pcData(:,3)>H_D&pcData(:,3)<H_T);
    SPt = plot3(pcData(in,1),pcData(in,2),pcData(in,3),['d',clr]);
    SlcPoint = [SlcPoint,SPt];
    %% �ָ���С���߶�
    for ii = 1:7
        if ii<6
            L(ii).ZData = [H_T+0.5,H_T+0.5];
        else
            L(ii).ZData = H_T+0.5;
        end
    end
    H_Dtemp = [H_Dtemp,H_D];
    H_Ttemp = [H_Ttemp,H_T];
    set(handles.H_D,'String',num2str(H_D));
    set(handles.H_T,'String',num2str(H_T));
    %% �ָ����򸽽���ע����Ϊ
    handles.DriveTask.Value = TFlag;
    DriveTask_Callback(handles.DriveTask,eventdata,handles);
    if CFlag == 1
        handles.PedAction.Value = AFlag;
        contents = cellstr(get(handles.PedAction,'String'));
        AStr = contents(AFlag);
    else
        handles.CarAction.Value = AFlag;
        contents = cellstr(get(handles.CarAction,'String'));
        AStr = contents(AFlag);
    end
    IStr = num2str(IFlag);
    AStrPlot = text(L(1).XData(2),L(1).YData(2),L(1).ZData(2),['\leftarrow',IStr,AStr]);
    ActionStrPlot = [ActionStrPlot,AStrPlot];
    %% �ָ������岢�洢
    Pt3 = [Y,repmat(H_D,4,1);Y,repmat(H_T,4,1)];
    Pt3_Draw = [Pt3(1:4,:);Pt3(1,:);Pt3(5:8,:);Pt3(5:6,:);Pt3(2:3,:);Pt3(7:8,:);Pt3(4,:)];
    Cb(1) = line(Pt3_Draw(:,1),Pt3_Draw(:,2),Pt3_Draw(:,3),'color',clr);
    Cb(2) = plot3(Pt3(:,1),Pt3(:,2),Pt3(:,3),['o',clr]);
    Cb(3) = line(O(:,1),O(:,2),repmat(H_D,2,1),'color',clr);
    Cube = [Cube;Cb];
    %% �ָ���άͼ���е�������
    RT = getappdata(handles.DS_Figure,'RT');
    calib = getappdata(handles.DS_Figure,'Calib_Results');
    I = getappdata(handles.DS_Figure,'Image');
    Pt2_Draw = show_laser_to_image5(I,Pt3_Draw,RT.R,RT.t,calib);
    Pt2_Direct = show_laser_to_image5(I,[O(:,1),O(:,2),repmat(H_D,2,1)],RT.R,RT.t,calib);
    axes(handles.axes_pic);
    Cb2d(1) = line(Pt2_Draw(:,1),Pt2_Draw(:,2),'color',clr);
    Cb2d(2) = line(Pt2_Direct(:,1),Pt2_Direct(:,2),'color',clr);
    Cube2d = [Cube2d;Cb2d];
    %% �洢������ֱ��L(1:7)
    AdjLine = [AdjLine;L];
end
setappdata(handles.axes_laser,'ClassFlag',ClassFlag);
setappdata(handles.axes_laser,'ActionFlag',ActionFlag);
setappdata(handles.axes_laser,'TaskFlag',TaskFlag);
setappdata(handles.axes_laser,'BehaviorFlag',BehaviorFlag);
setappdata(handles.axes_laser,'Direct',Direct);
setappdata(handles.axes_laser,'Vertex2d',Vertex2d);
setappdata(handles.axes_laser,'SlcPoint',SlcPoint);
setappdata(handles.axes_laser,'H_D',H_Dtemp);
setappdata(handles.axes_laser,'H_T',H_Ttemp);
setappdata(handles.axes_laser,'ActionStrPlot',ActionStrPlot);
setappdata(handles.axes_laser,'Cube',Cube);
setappdata(handles.axes_laser,'Cube2d',Cube2d);
setappdata(handles.axes_laser,'AdjLine',AdjLine);
setappdata(handles.axes_laser,'IDFlag',IDFlag);
A = [num+1,1];
setappdata(handles.DS_Figure,'ActionObject',A);
set(handles.SV,'Enable','on');
set(handles.DEL,'Enable','on');
set(handles.H_D,'Enable','on');
set(handles.H_T,'Enable','on');
fclose(fid);
end
ClueStr = getappdata(handles.DS_Figure,'ClueStr');
if ~isempty(ClueStr)
    delete(ClueStr);
    ClueStr = [];
end
Ind1 = sprintf('%06d',Ind-1);
txtRoot = [labelRoot,Ind1,'.txt'];
if exist(txtRoot,'file')
    ClueStr = [];
    fid = fopen(txtRoot,'r');
    ID = [];
    axes(handles.axes_laser);
    while ~feof(fid)
        tline = fgetl(fid);
        A = strsplit(tline);
        IFlag = str2double(A{1});
        ID = [ID,IFlag];
        H_T = str2double(A{13});
        O = [str2double(A{6}),str2double(A{7})];
        CStr = text(O(1),O(2),H_T+0.5,num2str(IFlag),'Color','red','FontSize',10);
        ClueStr = [ClueStr,CStr];
    end
    ID = sort(ID);
    IDStr = {'���ID'};
    for i =1:length(ID)
        IDStr = [IDStr,num2str(ID(i))];
    end
    handles.idBox.String = IDStr;
    setappdata(handles.DS_Figure,'ClueStr',ClueStr);
    fclose(fid);
end
set(handles.PDE,'Enable','on');
set(handles.VEC,'Enable','on');
set(handles.PRE,'Enable','on');
set(handles.NEX,'Enable','on');
set(handles.DriveTask,'Enable','on');
% --- Executes during object creation, after setting all properties.
function FRM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FRM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in VIEW.
function VIEW_Callback(hObject, eventdata, handles)
% hObject    handle to VIEW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_laser);
view(2);


% --- Executes on button press in SV.
function SV_Callback(hObject, eventdata, handles)
% hObject    handle to SV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
labelRoot = getappdata(handles.DS_Figure,'labelRoot');
ind = str2double(get(handles.FRM,'String'));
ind = sprintf('%06d',ind);
txtRoot = [labelRoot,ind,'.txt'];
fid = fopen(txtRoot,'w');
TF = getappdata(handles.axes_laser,'TaskFlag');
BF = getappdata(handles.axes_laser,'BehaviorFlag');
CF = getappdata(handles.axes_laser,'ClassFlag');
AF = getappdata(handles.axes_laser,'ActionFlag');
Vt2d = getappdata(handles.axes_laser,'Vertex2d');
O = getappdata(handles.axes_laser,'Direct');
HD = getappdata(handles.axes_laser,'H_D');
HT = getappdata(handles.axes_laser,'H_T');
IF = getappdata(handles.axes_laser,'IDFlag');
%order number(1),TaskFlag(1),BehaviorFlag(1),ClassFlag(1),ActionFlag(1),Center(2),L1(parallel to direct 1),L2(vertical to direct 1),direct(2),H_D(1),H_T(1)
if isempty(CF)
    return
end
for i = 1:length(CF)
    fprintf(fid,'%d ',IF(i));
    fprintf(fid,'%d ',TF(i));
    fprintf(fid,'%d ',BF(i));
    fprintf(fid,'%d ',CF(i));
    fprintf(fid,'%d ',AF(i));
    Lflag = (Vt2d(4*i-3,:)-Vt2d(4*i-2,:))*(O(2*i-1,:)-O(2*i,:))';
    if abs(Lflag)<1e-10
        L1 = norm(Vt2d(4*i-1,:)-Vt2d(4*i-2,:))/2;
        L2 = norm(Vt2d(4*i-3,:)-Vt2d(4*i-2,:))/2;
    else
        L2 = norm(Vt2d(4*i-1,:)-Vt2d(4*i-2,:))/2;
        L1 = norm(Vt2d(4*i-3,:)-Vt2d(4*i-2,:))/2;
    end
    fprintf(fid,'%f %f %f %f ',O(2*i-1,:),L1,L2);
    fprintf(fid,'%f %f ',O(2*i,:)-O(2*i-1,:));
    fprintf(fid,'%f %f\n',HD(i),HT(i));
end
setappdata(handles.DS_Figure,'SVflag',1);



function H_D_Callback(hObject, eventdata, handles)
% hObject    handle to H_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ���»�ȡ��ػ�ͼ����
A = getappdata(handles.DS_Figure,'ActionObject');
HTtemp = getappdata(handles.axes_laser,'H_T');
Vt2dtemp = getappdata(handles.axes_laser,'Vertex2d');
Otemp= getappdata(handles.axes_laser,'Direct');
Y = Vt2dtemp(4*A(1)-3:4*A(1),:);
O = Otemp(2*A(1)-1:2*A(1),:);
calib = getappdata(handles.DS_Figure,'Calib_Results');
%% �ж������Ƿ���ȷ
H_T = HTtemp(A(1));
H_D = str2double(get(hObject,'String'));
if H_T<H_D
    HDtemp = getappdata(handles.axes_laser,'H_D');
    set(handles.H_D,'String',num2str(HDtemp(A(1))));
    return
end
%% ���»�����ά���ο򲢴洢
Pt3 = [Y,repmat(H_D,4,1);Y,repmat(H_T,4,1)];
Pt3_Draw = [Pt3(1:4,:);Pt3(1,:);Pt3(5:8,:);Pt3(5:6,:);Pt3(2:3,:);Pt3(7:8,:);Pt3(4,:)];
Cube = getappdata(handles.axes_laser,'Cube');
Cube(A(1),1).XData = Pt3_Draw(:,1);Cube(A(1),1).YData = Pt3_Draw(:,2);Cube(A(1),1).ZData = Pt3_Draw(:,3);
Cube(A(1),2).XData = Pt3(:,1);Cube(A(1),2).YData = Pt3(:,2);Cube(A(1),2).ZData = Pt3(:,3);
Cube(A(1),3).XData = O(:,1);Cube(A(1),3).YData = O(:,2);Cube(A(1),3).ZData = repmat(H_D,2,1);
%% ���»���������ͶӰ���洢
RT = getappdata(handles.DS_Figure,'RT');
I = getappdata(handles.DS_Figure,'Image');
Pt2_Draw = show_laser_to_image5(I,Pt3_Draw,RT.R,RT.t,calib);
Pt2_Direct = show_laser_to_image5(I,[O(:,1),O(:,2),repmat(H_D,2,1)],RT.R,RT.t,calib);
Cube2d = getappdata(handles.axes_laser,'Cube2d');
Cube2d(A(1),1).XData = Pt2_Draw(:,1);Cube2d(A(1),1).YData = Pt2_Draw(:,2);
Cube2d(A(1),2).XData = Pt2_Direct(:,1);Cube2d(A(1),2).YData = Pt2_Direct(:,2);
%% ���±�Ǿ��ο��еĵ㲢�洢
pcData = getappdata(handles.DS_Figure,'pcData');
in = inpolygon(pcData(:,1),pcData(:,2),Y(:,1),Y(:,2));
pcData = pcData(in,:);
in = find(pcData(:,3)>H_D&pcData(:,3)<H_T);
SlcPoint = getappdata(handles.axes_laser,'SlcPoint');
SlcPoint(A(1)).XData = pcData(in,1);SlcPoint(A(1)).YData = pcData(in,2);SlcPoint(A(1)).ZData = pcData(in,3);
%% ���´洢�ײ��߶�H_D
HDtemp = getappdata(handles.axes_laser,'H_D');
HDtemp(A(1)) = H_D;
setappdata(handles.axes_laser,'H_D',HDtemp);
%% ���ô洢��־
setappdata(handles.DS_Figure,'SVflag',0);
% --- Executes during object creation, after setting all properties.
function H_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to H_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function H_T_Callback(hObject, eventdata, handles)
% hObject    handle to H_T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ���»�ȡ��ػ�ͼ����
A = getappdata(handles.DS_Figure,'ActionObject');
HDtemp = getappdata(handles.axes_laser,'H_D');
Vt2dtemp = getappdata(handles.axes_laser,'Vertex2d');
Otemp= getappdata(handles.axes_laser,'Direct');
Y = Vt2dtemp(4*A(1)-3:4*A(1),:);
O = Otemp(2*A(1)-1:2*A(1),:);
calib = getappdata(handles.DS_Figure,'Calib_Results');
%% �ж������Ƿ���ȷ
H_T = str2double(get(hObject,'String'));
H_D = HDtemp(A(1));
if H_T<H_D
    H_Ttemp = getappdata(handles.axes_laser,'H_T');
    set(handles.H_T,'String',num2str(H_Ttemp(A(1))));
    return
end
%% �ı�����ߵĸ߶�
L = getappdata(handles.axes_laser,'AdjLine');
for ii = 1:7
    if ii<6
    L(A(1),ii).ZData = [H_T+0.5,H_T+0.5];
    else
    L(A(1),ii).ZData = H_T+0.5;
    end
end                             
%% ������������λ��
ActionStrPlot = getappdata(handles.axes_laser,'ActionStrPlot');
ActionStrPlot(A(1)).Position = [L(A(1),1).XData(2),L(A(1),1).YData(2),L(A(1),1).ZData(2)];
%% ���»�����ά���ο�
Pt3 = [Y,repmat(H_D,4,1);Y,repmat(H_T,4,1)];
Pt3_Draw = [Pt3(1:4,:);Pt3(1,:);Pt3(5:8,:);Pt3(5:6,:);Pt3(2:3,:);Pt3(7:8,:);Pt3(4,:)];
Cube = getappdata(handles.axes_laser,'Cube');
Cube(A(1),1).XData = Pt3_Draw(:,1);Cube(A(1),1).YData = Pt3_Draw(:,2);Cube(A(1),1).ZData = Pt3_Draw(:,3);
Cube(A(1),2).XData = Pt3(:,1);Cube(A(1),2).YData = Pt3(:,2);Cube(A(1),2).ZData = Pt3(:,3);
Cube(A(1),3).XData = O(:,1);Cube(A(1),3).YData = O(:,2);Cube(A(1),3).ZData = repmat(H_D,2,1);
%% ���»���������ͶӰ���洢
RT = getappdata(handles.DS_Figure,'RT');
I = getappdata(handles.DS_Figure,'Image');
Pt2_Draw = show_laser_to_image5(I,Pt3_Draw,RT.R,RT.t,calib);
Pt2_Direct = show_laser_to_image5(I,[O(:,1),O(:,2),repmat(H_D,2,1)],RT.R,RT.t,calib);
Cube2d = getappdata(handles.axes_laser,'Cube2d');
Cube2d(A(1),1).XData = Pt2_Draw(:,1);Cube2d(A(1),1).YData = Pt2_Draw(:,2);
Cube2d(A(1),2).XData = Pt2_Direct(:,1);Cube2d(A(1),2).YData = Pt2_Direct(:,2);
%% ���±�Ǿ��ο��еĵ㲢�洢
pcData = getappdata(handles.DS_Figure,'pcData');
in = inpolygon(pcData(:,1),pcData(:,2),Y(:,1),Y(:,2));
pcData = pcData(in,:);
in = find(pcData(:,3)>H_D&pcData(:,3)<H_T);
SlcPoint = getappdata(handles.axes_laser,'SlcPoint');
SlcPoint(A(1)).XData = pcData(in,1);SlcPoint(A(1)).YData = pcData(in,2);SlcPoint(A(1)).ZData = pcData(in,3);
%% ���´洢�ײ��߶�H_T
HTtemp = getappdata(handles.axes_laser,'H_T');
HTtemp(A(1)) = H_T;
setappdata(handles.axes_laser,'H_T',HTtemp);
%% ���ô洢��־
setappdata(handles.DS_Figure,'SVflag',0);

% --- Executes during object creation, after setting all properties.
function H_T_CreateFcn(hObject, eventdata, handles)
% hObject    handle to H_T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Recfun(hObject,eventdata,handles)
hObject.Selected = 'on';
tmp = strsplit(hObject.Tag,'.');
A(1) = str2double(tmp{1});
A(2) = str2double(tmp{2});
%% ɾ��֮ǰ������SlcPoint,Cube,Cube2d
Slctmp = getappdata(handles.axes_laser,'SlcPoint');
Slctmp(A(1)).XData= []; Slctmp(A(1)).YData= [];Slctmp(A(1)).ZData= []; %ɾ��֮ǰѡ�еĵ�
Cbtmp = getappdata(handles.axes_laser,'Cube');
for i = 1:3
Cbtmp(A(1),i).XData=[];Cbtmp(A(1),i).YData=[];Cbtmp(A(1),i).ZData=[];  %ɾ��������Cube
end 
Cb2dtmp = getappdata(handles.axes_laser,'Cube2d'); 
for i = 1:2
Cb2dtmp(A(1),i).XData=[];Cb2dtmp(A(1),i).YData=[];Cb2dtmp(A(1),i).ZData=[]; %ɾ��ͼ���е�������Cube2d
end
%% ����Tag����H_D��H_T�Ĵ����е�ֵ�����ı�H_D��H_T�����ö���
setappdata(handles.DS_Figure,'ActionObject',A);
H_D = getappdata(handles.axes_laser,'H_D');
H_T = getappdata(handles.axes_laser,'H_T');
set(handles.H_D,'String',H_D(A(1)));
set(handles.H_T,'String',H_T(A(1)));
%% ���ûص�����
L = getappdata(handles.axes_laser,'AdjLine');
if A(2)<5
set(handles.DS_Figure,'WindowButtonMotionFcn',{@AdjRectangleFun,hObject,handles,A,L})
end
if A(2)==6
set(handles.DS_Figure,'windowbuttonmotionfcn',{@MovRectanglefun,hObject,handles,A,L});    
end
if A(2)==7
flag1 = ([L(A(1),1).XData(1),L(A(1),1).YData(1)]-[L(A(1),1).XData(2),L(A(1),1).YData(2)])*([L(A(1),5).XData(1),L(A(1),5).YData(1)]-[L(A(1),5).XData(2),L(A(1),5).YData(2)])';
if abs(flag1)<1e-5
    norm = [cal_norm(L(A(1),1)), cal_norm(L(A(1),2))];  % [ƽ�У���ֱ]
else
    norm = [cal_norm(L(A(1),2)),cal_norm(L(A(1),1))];   % [ƽ�У���ֱ]
end
set(handles.DS_Figure,'windowbuttonmotionfcn',{@RotRectanglefun,hObject,handles,A,L,norm/2});    
end
% --- Executes on key press with focus on DS_Figure or any of its controls.

function  AdjRectangleFun(hObject,eventdata,lineobject,handles,A,L)
h_axes = handles.axes_laser;
global line_table;
L_ind = line_table(A(2),:);
offset = cal_vert([lineobject.XData(1),lineobject.YData(1)],[lineobject.XData(2),lineobject.YData(2)],h_axes.CurrentPoint(1,1:2));
lineobject.XData = lineobject.XData+offset(1);
lineobject.YData = lineobject.YData+offset(2);
L(A(1),L_ind(1)).XData(L_ind(3)) = L(A(1),L_ind(1)).XData(L_ind(3))+offset(1);
L(A(1),L_ind(1)).YData(L_ind(3)) = L(A(1),L_ind(1)).YData(L_ind(3))+offset(2);
L(A(1),L_ind(2)).XData(L_ind(3)) = L(A(1),L_ind(2)).XData(L_ind(3))+offset(1);
L(A(1),L_ind(2)).YData(L_ind(3)) = L(A(1),L_ind(2)).YData(L_ind(3))+offset(2);
for i=5:7
    L(A(1),i).XData = L(A(1),i).XData+offset(1)/2;
    L(A(1),i).YData = L(A(1),i).YData+offset(2)/2;
end
offset2 =  cal_off(offset,[L(A(1),5).XData(1),L(A(1),5).YData(1)],[L(A(1),5).XData(2),L(A(1),5).YData(2)],h_axes.CurrentPoint(1,1:2));
L(A(1),5).XData(2) = L(A(1),5).XData(2)+offset2(1)/2;
L(A(1),5).YData(2) = L(A(1),5).YData(2)+offset2(2)/2;
L(A(1),7).XData = L(A(1),7).XData+offset2(1)/2;
L(A(1),7).YData = L(A(1),7).YData+offset2(2)/2;
set(hObject,'WindowButtonUpFcn',{@wbufcn,lineobject,A,handles})

function MovRectanglefun(hObject,event,lineobject,handles,A,L)
h_axes = handles.axes_laser;
offset = h_axes.CurrentPoint(1,1:2)-[lineobject.XData,lineobject.YData];
% lineobject.XData = lineobject.XData+offset(1);
% lineobject.YData = lineobject.YData+offset(2);
for i = 1:7
    L(A(1),i).XData = L(A(1),i).XData+offset(1);
    L(A(1),i).YData = L(A(1),i).YData+offset(2);
end
set(hObject,'WindowButtonUpFcn',{@wbufcn,lineobject,A,handles})

function RotRectanglefun(hObject,event,lineobject,handles,A,L,norm)
h_axes = handles.axes_laser;
normL5 = cal_norm(L(A(1),5));
% ([L(A(1),1).XData(1),L(A(1),1).YData(1)]-[L(A(1),1).XData(2),L(A(1),1).YData(2)])
% ([L(A(1),5).XData(2),L(A(1),5).YData(2)]-[L(A(1),5).XData(1),L(A(1),5).YData(1)])
flag = ([L(A(1),1).XData(1),L(A(1),1).YData(1)]-[L(A(1),1).XData(2),L(A(1),1).YData(2)])*([L(A(1),5).XData(2),L(A(1),5).YData(2)]-[L(A(1),5).XData(1),L(A(1),5).YData(1)])';
B = h_axes.CurrentPoint(1,1:2)-[L(A(1),5).XData(1),L(A(1),5).YData(1)];
B = B*normL5/sqrt(B*B');
L(A(1),5).XData(2) = B(1)+L(A(1),5).XData(1);
L(A(1),5).YData(2) = B(2)+L(A(1),5).YData(1);
lineobject.XData = L(A(1),5).XData(2);
lineobject.YData = L(A(1),5).YData(2);
off = cal_vert1([L(A(1),5).XData(1),L(A(1),5).YData(1)],[L(A(1),5).XData(2),L(A(1),5).YData(2)],[L(A(1),1).XData(1),L(A(1),1).YData(1)],norm(1));
if abs(flag)>1e-5
if flag > 0
    off1 = B*norm(2)/sqrt(B*B')+off;
    off2 = -B*norm(2)/sqrt(B*B')+off;
    off3 = B*norm(2)/sqrt(B*B')-off;
    off4 = -B*norm(2)/sqrt(B*B')-off;
else
    off1 = -B*norm(2)/sqrt(B*B')+off;
    off2 = B*norm(2)/sqrt(B*B')+off;
    off3 = -B*norm(2)/sqrt(B*B')-off;
    off4 = B*norm(2)/sqrt(B*B')-off;
end
else
    off1 = -B*norm(2)/sqrt(B*B')+off;
    off2 = -B*norm(2)/sqrt(B*B')-off;
    off3 = B*norm(2)/sqrt(B*B')+off;
    off4 = B*norm(2)/sqrt(B*B')-off;
end
L(A(1),1).XData(1) = L(A(1),6).XData+off1(1);
L(A(1),1).YData(1) = L(A(1),6).YData+off1(2);
L(A(1),1).XData(2) = L(A(1),6).XData+off2(1);
L(A(1),1).YData(2) = L(A(1),6).YData+off2(2);
L(A(1),3).XData(1) = L(A(1),6).XData+off3(1);
L(A(1),3).YData(1) = L(A(1),6).YData+off3(2);
L(A(1),3).XData(2) = L(A(1),6).XData+off4(1);
L(A(1),3).YData(2) = L(A(1),6).YData+off4(2);
L(A(1),2).XData(1) = L(A(1),1).XData(2); 
L(A(1),2).YData(1) = L(A(1),1).YData(2);
L(A(1),2).XData(2) = L(A(1),3).XData(2); 
L(A(1),2).YData(2) = L(A(1),3).YData(2);
L(A(1),4).XData(1) = L(A(1),1).XData(1); 
L(A(1),4).YData(1) = L(A(1),1).YData(1);
L(A(1),4).XData(2) = L(A(1),3).XData(1); 
L(A(1),4).YData(2) = L(A(1),3).YData(1);
set(hObject,'WindowButtonUpFcn',{@wbufcn,lineobject,A,handles})

function wbufcn(hObject,event,lineobject,A,handles)
L = getappdata(handles.axes_laser,'AdjLine');
H_Dtmp = getappdata(handles.axes_laser,'H_D');
H_Ttmp = getappdata(handles.axes_laser,'H_T');
calib = getappdata(handles.DS_Figure,'Calib_Results');
%% �ָ�SlcPoint��Cube��Cube2d
Y(1,:) = [L(A(1),1).XData(1),L(A(1),1).YData(1)];
Y(2,:) = [L(A(1),1).XData(2),L(A(1),1).YData(2)];
Y(3,:) = [L(A(1),3).XData(2),L(A(1),3).YData(2)];
Y(4,:) = [L(A(1),3).XData(1),L(A(1),3).YData(1)];
O(1,:) = [L(A(1),5).XData(1),L(A(1),5).YData(1)];
O(2,:) = [L(A(1),5).XData(2),L(A(1),5).YData(2)];
pcData = getappdata(handles.DS_Figure,'pcData');
in = inpolygon(pcData(:,1),pcData(:,2),Y(:,1),Y(:,2));
axes(handles.axes_laser);
SlcPoint = getappdata(handles.axes_laser,'SlcPoint');                           
SlcPoint(A(1)).XData = pcData(in,1);SlcPoint(A(1)).YData = pcData(in,2);SlcPoint(A(1)).ZData = pcData(in,3);  % �ػ汻ѡ�еĵ�
H_D = min([pcData(in,3);H_Dtmp(A(1))]);
H_T = max([pcData(in,3);H_Ttmp(A(1))]);
for ii = 1:7
    if ii<6
    L(A(1),ii).ZData = [H_T+0.5,H_T+0.5];
    else
    L(A(1),ii).ZData = H_T+0.5;
    end
end                               % ���õ����ߵĸ߶�
ActionStrPlot = getappdata(handles.axes_laser,'ActionStrPlot');
ActionStrPlot(A(1)).Position = [L(A(1),1).XData(2),L(A(1),1).YData(2),L(A(1),1).ZData(2)]; %��������λ��
Cube = getappdata(handles.axes_laser,'Cube');
Pt3 = [Y,repmat(H_D,4,1);Y,repmat(H_T,4,1)];
Pt3_Draw = [Pt3(1:4,:);Pt3(1,:);Pt3(5:8,:);Pt3(5:6,:);Pt3(2:3,:);Pt3(7:8,:);Pt3(4,:)];           
Cube(A(1),1).XData = Pt3_Draw(:,1);Cube(A(1),1).YData = Pt3_Draw(:,2);Cube(A(1),1).ZData = Pt3_Draw(:,3);  %�ػ�������Cube�е���
Cube(A(1),2).XData = Pt3(:,1);Cube(A(1),2).YData = Pt3(:,2);Cube(A(1),2).ZData = Pt3(:,3);       %�ػ�������Cube�еĶ���
Cube(A(1),3).XData = O(:,1);Cube(A(1),3).YData = O(:,2);Cube(A(1),3).ZData = repmat(H_D,2,1);    %�ػ�������Cube�еķ�����
RT = getappdata(handles.DS_Figure,'RT');
I = getappdata(handles.DS_Figure,'Image');
Pt2_Draw = show_laser_to_image5(I,Pt3_Draw,RT.R,RT.t,calib);
Pt2_Direct = show_laser_to_image5(I,[O(:,1),O(:,2),repmat(H_D,2,1)],RT.R,RT.t,calib);
axes(handles.axes_pic);
Cube2d = getappdata(handles.axes_laser,'Cube2d');
Cube2d(A(1),1).XData = Pt2_Draw(:,1);Cube2d(A(1),1).YData = Pt2_Draw(:,2);       %�ػ�ͼ���е�������Cube2d
Cube2d(A(1),2).XData = Pt2_Direct(:,1);Cube2d(A(1),2).YData = Pt2_Direct(:,2);     %�ػ�ͼ����������Cube2d�ķ�����
%% ����Direct��Vertex2d��H_D��H_T��SVflag
Direct = getappdata(handles.axes_laser,'Direct');Direct(2*A(1)-1:2*A(1),:) = O;setappdata(handles.axes_laser,'Direct',Direct); %����Direct
Vertex2d = getappdata(handles.axes_laser,'Vertex2d');Vertex2d(4*A(1)-3:4*A(1),:) = Y;setappdata(handles.axes_laser,'Vertex2d',Vertex2d); %����Vertex2d
H_Dtmp(A(1)) = H_D;setappdata(handles.axes_laser,'H_D',H_Dtmp); %����H_D
H_Ttmp(A(1)) = H_T;setappdata(handles.axes_laser,'H_T',H_Ttmp);  %����H_T
setappdata(handles.DS_Figure,'SVflag',0); %���ô洢��־
%% ��ɵ���
lineobject.Selected = 'off';
set(hObject,'WindowButtonMotionFcn','');
set(hObject,'WindowButtonUpFcn','');
function DS_Figure_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to DS_Figure (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.DS_Figure,'CurrentCharacter'),' ')
    pFlag = getappdata(handles.DS_Figure,'PressFlag');
    if isempty(pFlag) || pFlag==1
        setappdata(handles.DS_Figure,'PressFlag',0);
    elseif pFlag==0
        setappdata(handles.DS_Figure,'PressFlag',1);
    end
end

function [vertical] = cal_vert(A,B,C)
% A,BΪ�߶��ϵĵ㣬CΪ�߶���ĵ㣬verticalΪ��ֱ����
vertical = (C-B)-(C-B)*(A-B)'*(A-B)/((A-B)*(A-B)');

function [vertical] = cal_vert1(A,B,C,norm)
% A,BΪ�߶��ϵĵ㣬CΪ�߶���ĵ㣬verticalΪ��ֱ����,normΪ������Ĵ�ֱ������ģ
vertical = (C-B)-(C-B)*(A-B)'*(A-B)/((A-B)*(A-B)');
vertical = vertical*norm/sqrt(vertical*vertical');

function [offset] = cal_off(off,O1,O2,C)
% ���㷽���߶˵��������룬offΪƫ��������O1,O2Ϊ�����߶˵㣬CΪ��ǰ�������λ��
offset = [0,0];
flag1 = (C-O1)*(O2-O1)';
flag2 = abs(off*(O2-O1)');
if flag1>0
    B = O2-O1;
    offset = (off*B')*B/(B*B');
end
if  flag2 >1e-5 && flag1<0
    offset = -off;
end

function [norm] = cal_norm(L)
norm = sqrt(([L.XData(1),L.YData(1)]-[L.XData(2), L.YData(2)])*([L.XData(1),L.YData(1)]-[L.XData(2),L.YData(2)])');



