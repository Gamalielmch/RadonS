function varargout = models(varargin)
% MODELS MATLAB code for models.fig
%      MODELS, by itself, creates a new MODELS or raises the existing
%      singleton*.
%
%      H = MODELS returns the handle to a new MODELS or the handle to
%      the existing singleton*.
%
%      MODELS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODELS.M with the given input arguments.
%
%      MODELS('Property','Value',...) creates a new MODELS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before models_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to models_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help models

% Last Modified by GUIDE v2.5 15-Jan-2020 11:22:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @models_OpeningFcn, ...
                   'gui_OutputFcn',  @models_OutputFcn, ...
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


% --- Executes just before models is made visible.
function models_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to models (see VARARGIN)

% Choose default command line output for models
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes borrar wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% UIWAIT makes models wait for user response (see UIRESUME)
%uiwait(handles.figure1);
global medias cova mediast covat ya
ya=0;
medias(:,1)=[7.0559   29.6];
medias(:,2)=[8.0772  16.8];
medias(:,3)=[5.3542    4.8];
medias(:,4)=[2.649    1];
medias(:,5)=[ 0.4569        0];
cova(:,:,1)=[0.303   0.51; 0.51   58.8];
cova(:,:,2)=[2.0521    2.8049;  2.8049    9.700];
cova(:,:,3)=[2.552   2.4250; 2.4250   5.700];
cova(:,:,4)=[0.1043   -0.1462; -0.1462    1.5];
cova(:,:,5)=[0.4293   2e-11; 2e-11    0.31];
covat=cova;
mediast=medias;
% --- Outputs from this function are returned to the command line.
function varargout= models_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function co21_Callback(hObject, eventdata, handles)
% hObject    handle to co21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co21 as text
%        str2double(get(hObject,'String')) returns contents of co21 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(1,2,1)));
    warndlg('Input must be numerical');
else
    covat(1,2,1)=str2double(str);
end
handles.covat={covat,mediast};

function co41_Callback(hObject, eventdata, handles)
% hObject    handle to co41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co41 as text
%        str2double(get(hObject,'String')) returns contents of co41 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(2,2,1)));
    warndlg('Input must be numerical');
else
    covat(2,2,1)=str2double(str);
end
handles.covat={covat,mediast};

function co11_Callback(hObject, eventdata, handles)
% hObject    handle to co11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co11 as text
%        str2double(get(hObject,'String')) returns contents of co11 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(1,1,1)));
    warndlg('Input must be numerical');
else
    covat(1,1,1)=str2double(str);
end
handles.covat={covat,mediast};

function co31_Callback(hObject, eventdata, handles)
% hObject    handle to co31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co31 as text
%        str2double(get(hObject,'String')) returns contents of co31 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(2,1,1)));
    warndlg('Input must be numerical');
else
    covat(2,1,1)=str2double(str);
end
handles.covat={covat,mediast};



function m11_Callback(hObject, eventdata, handles)
% hObject    handle to m11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m11 as text
%        str2double(get(hObject,'String')) returns contents of m11 as a double
global mediast covat
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(mediast(1,1)));
    warndlg('Input must be numerical');
else
    mediast(1,1)=str2double(str);
end
handles.covat={covat,mediast};

function m21_Callback(hObject, eventdata, handles)
% hObject    handle to m21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m21 as text
%        str2double(get(hObject,'String')) returns contents of m21 as a double
global mediast covat
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(mediast(2,1)));
    warndlg('Input must be numerical');
else
    mediast(2,1)=str2double(str);
end
handles.covat={covat,mediast};

function cov25_Callback(hObject, eventdata, handles)
% hObject    handle to cov25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cov25 as text
%        str2double(get(hObject,'String')) returns contents of cov25 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(1,2,5)));
    warndlg('Input must be numerical');
else
    covat(1,2,5)=str2double(str);
end
handles.covat={covat,mediast};


function co45_Callback(hObject, eventdata, handles)
% hObject    handle to co45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co45 as text
%        str2double(get(hObject,'String')) returns contents of co45 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(2,2,5)));
    warndlg('Input must be numerical');
else
    covat(2,2,5)=str2double(str);
end
handles.covat={covat,mediast};


function co15_Callback(hObject, eventdata, handles)
% hObject    handle to co15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co15 as text
%        str2double(get(hObject,'String')) returns contents of co15 as a double
global covat medist
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(1,1,5)));
    warndlg('Input must be numerical');
else
    covat(1,1,5)=str2double(str);
end
handles.covat={covat,mediast};
function co35_Callback(hObject, eventdata, handles)
% hObject    handle to co35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co35 as text
%        str2double(get(hObject,'String')) returns contents of co35 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(2,1,5)));
    warndlg('Input must be numerical');
else
    covat(2,1,5)=str2double(str);
end
handles.covat={covat,mediast};


function m15_Callback(hObject, eventdata, handles)
% hObject    handle to m15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m15 as text
%        str2double(get(hObject,'String')) returns contents of m15 as a double
global mediast covat
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(mediast(1,5)));
    warndlg('Input must be numerical');
else
    mediast(1,5)=str2double(str);
end

handles.covat={covat,mediast};

function m25_Callback(hObject, eventdata, handles)
% hObject    handle to m25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m25 as text
%        str2double(get(hObject,'String')) returns contents of m25 as a double
global mediast covat
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(mediast(2,5)));
    warndlg('Input must be numerical');
else
    mediast(2,5)=str2double(str);
end
handles.covat={covat,mediast};

function co24_Callback(hObject, eventdata, handles)
% hObject    handle to co24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co24 as text
%        str2double(get(hObject,'String')) returns contents of co24 as a double

global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(1,2,4)));
    warndlg('Input must be numerical');
else
    covat(1,2,4)=str2double(str);
end
handles.covat={covat,mediast};

function co44_Callback(hObject, eventdata, handles)
% hObject    handle to co44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co44 as text
%        str2double(get(hObject,'String')) returns contents of co44 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(2,2,4)));
    warndlg('Input must be numerical');
else
    covat(2,2,4)=str2double(str);
end
handles.covat={covat,mediast};


function co14_Callback(hObject, eventdata, handles)
% hObject    handle to co14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co14 as text
%        str2double(get(hObject,'String')) returns contents of co14 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(1,1,4)));
    warndlg('Input must be numerical');
else
    covat(1,1,4)=str2double(str);
end
handles.covat={covat,mediast};


function co34_Callback(hObject, eventdata, handles)
% hObject    handle to co34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co34 as text
%        str2double(get(hObject,'String')) returns contents of co34 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(2,1,4)));
    warndlg('Input must be numerical');
else
    covat(2,1,4)=str2double(str);
end
handles.covat={covat,mediast};



function m14_Callback(hObject, eventdata, handles)
% hObject    handle to m14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m14 as text
%        str2double(get(hObject,'String')) returns contents of m14 as a double
global mediast covat
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(mediast(1,4)));
    warndlg('Input must be numerical');
else
    mediast(1,4)=str2double(str);
end
handles.covat={covat,mediast};


function m24_Callback(hObject, eventdata, handles)
% hObject    handle to m24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m24 as text
%        str2double(get(hObject,'String')) returns contents of m24 as a double
global mediast covat
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(mediast(2,4)));
    warndlg('Input must be numerical');
else
    mediast(2,4)=str2double(str);
end

handles.covat={covat,mediast};


function co23_Callback(hObject, eventdata, handles)
% hObject    handle to co23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co23 as text
%        str2double(get(hObject,'String')) returns contents of co23 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(1,2,3)));
    warndlg('Input must be numerical');
else
    covat(1,2,3)=str2double(str);
end
handles.covat={covat,mediast};


function co43_Callback(hObject, eventdata, handles)
% hObject    handle to co43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co43 as text
%        str2double(get(hObject,'String')) returns contents of co43 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(2,2,3)));
    warndlg('Input must be numerical');
else
    covat(2,2,3)=str2double(str);
end
handles.covat={covat,mediast};



function co13_Callback(hObject, eventdata, handles)
% hObject    handle to co13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co13 as text
%        str2double(get(hObject,'String')) returns contents of co13 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(1,1,3)));
    warndlg('Input must be numerical');
else
    covat(1,1,3)=str2double(str);
end
handles.covat={covat,mediast};


function cov33_Callback(hObject, eventdata, handles)
% hObject    handle to cov33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cov33 as text
%        str2double(get(hObject,'String')) returns contents of cov33 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(2,1,3)));
    warndlg('Input must be numerical');
else
    covat(2,1,3)=str2double(str);
end
handles.covat={covat,mediast};



function m13_Callback(hObject, eventdata, handles)
% hObject    handle to m13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m13 as text
%        str2double(get(hObject,'String')) returns contents of m13 as a double
global mediast covat
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(mediast(1,3)));
    warndlg('Input must be numerical');
else
    mediast(1,3)=str2double(str);
end

handles.covat={covat,mediast};


function m23_Callback(hObject, eventdata, handles)
% hObject    handle to m23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m23 as text
%        str2double(get(hObject,'String')) returns contents of m23 as a double
global mediast covat
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(mediast(2,3)));
    warndlg('Input must be numerical');
else
    mediast(2,3)=str2double(str);
end
handles.covat={covat,mediast};




function co22_Callback(hObject, eventdata, handles)
% hObject    handle to co22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co22 as text
%        str2double(get(hObject,'String')) returns contents of co22 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(1,2,2)));
    warndlg('Input must be numerical');
else
    covat(1,2,2)=str2double(str);
end
handles.covat={covat,mediast};


function co42_Callback(hObject, eventdata, handles)
% hObject    handle to co42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of co42 as text
%        str2double(get(hObject,'String')) returns contents of co42 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(2,2,2)));
    warndlg('Input must be numerical');
else
    covat(2,2,2)=str2double(str);
end
handles.covat={covat,mediast};




function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(1,1,2)));
    warndlg('Input must be numerical');
else
    covat(1,1,2)=str2double(str);
end
handles.covat={covat,mediast};

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cov32_Callback(hObject, eventdata, handles)
% hObject    handle to cov32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cov32 as text
%        str2double(get(hObject,'String')) returns contents of cov32 as a double
global covat mediast
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(covat(2,1,2)));
    warndlg('Input must be numerical');
else
    covat(2,1,2)=str2double(str);
end
handles.covat={covat,mediast};

function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to m21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m21 as text
%        str2double(get(hObject,'String')) returns contents of m21 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m22_Callback(hObject, eventdata, handles)
% hObject    handle to m22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m22 as text
%        str2double(get(hObject,'String')) returns contents of m22 as a double
global mediast covat
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(mediast(2,2)));
    warndlg('Input must be numerical');
else
    mediast(2,2)=str2double(str);
end
handles.covat={covat,mediast};

% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mediast covat ya new_cova new_mean
flag = 0;
tf=0;
for j=1:5
eig_A = eig(covat(:,:,j));
tf(j) = 1-issymmetric(covat(:,:,j));
for i = 1:length(eig_A)
  if eig_A(i) <= 0 
  flag(j) = 1;
  break
  else
  flag(j) = 0;
  end
end
end
if sum(flag)==0 && sum(tf)==0
new_cova=covat;
handles.covat={covat, mediast};
new_mean=mediast;
ya=1;
close(models)
else
    warndlg('The matrix must be symmetric and positive definite')
end





function m12_Callback(hObject, eventdata, handles)
% hObject    handle to m12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m12 as text
%        str2double(get(hObject,'String')) returns contents of m12 as a double
global mediast covat
str=get(hObject,'String');
if isnan(str2double(str))
    set(src,'string',num2str(mediast(1,2)));
    warndlg('Input must be numerical');
else
    mediast(1,2)=str2double(str);
end
handles.covat={covat,mediast};


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
