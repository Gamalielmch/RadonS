function varargout = RadonS(varargin)
% RADONS MATLAB code for RadonS.fig
%      RADONS, by itself, creates a new RADONS or raises the existing
%      singleton*.
%
%      H = RADONS returns the handle to a new RADONS or the handle to
%      the existing singleton*.
%
%      RADONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RADONS.M with the given input arguments.
%
%      RADONS('Property','Value',...) creates a new RADONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RadonS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RadonS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RadonS

% Last Modified by GUIDE v2.5 16-Jan-2020 09:47:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RadonS_OpeningFcn, ...
                   'gui_OutputFcn',  @RadonS_OutputFcn, ...
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
% --- Executes just before RadonS is made visible.
function RadonS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RadonS (see VARARGIN)

% Choose default command line output for RadonS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RadonS wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global  menu Vars_and_flags uicontrols
%%%load Variables and Flags initialization 
variable_initialization();
Vars_and_flags=load('variables_and_flags.mat');

%%%%%% axes visual features
axes('Position',[0.05 0.05 0.9 0.88],'color',[0 0 0]);
axis off

%%%%%%%%%%%%%% Statements to create the menu %%%%%%%%%%%%
m_file = uimenu(hObject,'Label','File','ForegroundColor',[0 0 0]);

%%% File menu
menu.open=uimenu(m_file,'Label','Open binary images',...
    'Callback',{@load_images_Callback,handles});

%%% Radon menu
menu.radon = uimenu(hObject,'Label','Radon','ForegroundColor',[0 0 0]);
menu.apply = uimenu(menu.radon,'Label','Apply',...
    'Enable','off','Callback',{@Radon_Callback,handles});
menu.classify = uimenu(menu.radon,'Label','Classify',...
    'Enable','off','Separator','on','Callback',@classify_Callback);
menu.setup = uimenu(menu.radon,'Label','Setup filters',...
    'Enable','off','Separator','on','Callback',{@setup_filters_Callback,handles});
menu.setup2 = uimenu(menu.radon,'Label','Setup Models',...
    'Enable','off','Separator','on','Callback',@Setup_models_Callback);
menu.setup3 = uimenu(menu.radon,'Label','Plot Models',...
    'Enable','off','Callback',@Plot_models_Callback);

%%% Export menu
menu.expo = uimenu(hObject,'Label','Export','ForegroundColor',[0 0 0]);
menu.expdata = uimenu(menu.expo,'Label','Data',...
    'Enable','off','Callback',{@export_data_Callback,handles});
menu.expima = uimenu(menu.expo,'Label','Images',...
    'Enable','off','Callback',@export_images_Callback);
menu.help = uimenu(hObject,'Label','Help','ForegroundColor',[0 0 0]);
menu.manual= uimenu(menu.help,'Label','Manual',...
    'Enable','on','Callback',@manual_Callback);


%%%%%%%%%%%%%% Creating visual and control elements %%%%%%%%%%%%

%%%%%% Buttons to show filter responses
uicontrols.bt_response = uicontrol('units','norm','pos',[0.735 0.946 0.09125 0.03666],'style','pushbutton','string','Response w1','backgroundcolor',[0 0 0],'visible','on','Enable','off','callback',{@response_Callback,handles});
uicontrols.bt_response2 = uicontrol('units','norm','pos',[0.845 0.946 0.09125 0.03666],'style','pushbutton','string','Response w2','backgroundcolor',[0 0 0],'visible','on','Enable','off','callback',{@response2_Callback,handles});



%%%%%% Navigation buttons
[a,~]=imread('beforei.jpg');
uicontrols.bt_prev = uicontrol('units','norm','pos',[0.025 0.945 0.03375 0.038333],'style','pushbutton','string','','backgroundcolor',[0 0 0],'visible','on','CData',a,'Enable','off','callback',{@previous_Callback,handles});
[a,~]=imread('nexti.jpg');
uicontrols.bt_next = uicontrol('units','norm','pos',[0.06125 0.945 0.03375 0.038333],'style','pushbutton','string','','backgroundcolor',[0 0 0],'visible','on','CData',a,'Enable','off','callback',{@next_Callback,handles});


%%%%%% Edit edit text, static text, and button to assign a new value of cutoff frequencies of the filters
uicontrols.textedit_fw1 = uicontrol('units','norm','pos',[0.2 0.95 0.055 0.035],'style','edit','string','5','backgroundcolor',[1 1 1],'visible','off','Enable','on','callback',@fw1_call);
uicontrols.textedit_fw2 = uicontrol('units','norm','pos',[0.3 0.95 0.05 0.035],'style','edit','string','14','backgroundcolor',[1 1 1],'visible','off','Enable','on','callback',@fw2_call);
uicontrols.text_fw1 = uicontrol('units','norm','pos',[0.165 0.95 0.05 0.035],'style','text','string','w1','ForegroundColor',[0.3 1 0.1]);
set(uicontrols.text_fw1,'BackgroundColor',[0 0 0],'Fontsize',11,'visible','off');
uicontrols.text_fw2 = uicontrol('units','norm','pos',[0.26 0.95 0.05 0.035],'style','text','string','w2','ForegroundColor',[0.3 1 0.1]);
set(uicontrols.text_fw2,'BackgroundColor',[0 0 0],'Fontsize',11,'visible','off');
uicontrols.ok_fw = uicontrol('units','norm','pos',[0.378 0.950 0.05 0.035],'style','pushbutton','string','ok','backgroundcolor',[1 1 1],'visible','off','Enable','on','callback',{@ok_call,handles});

%%% text "Running"
uicontrols.text_running = uicontrol('units','norm','pos',[0.47 0.95 0.1 0.035],'style','text','string','Running...','ForegroundColor',[0.3 1 0.1]);
set(uicontrols.text_running,'BackgroundColor',[0 0 0],'Fontsize',11,'visible','off');


%%% Legends of roundness class
la={'1 = Angular,     2 = Sub-angular,    3 = Sub-rounded,     4 = Rounded,     5 = Well-rounded'};
uicontrols.Legends=annotation('textbox',[0.15,0,0.7,0.05],'String',la,'Color',[0 1 0]);
b = annotation('textbox', get(uicontrols.Legends,'Position'));
set(uicontrols.Legends, 'EdgeColor',[0 0 0] );
set(b, 'BackgroundColor', [0 0 0]);
set(b, 'FaceAlpha', 0.2);
uistack(uicontrols.Legends,'top')
set(uicontrols.Legends,'visible','off')


%%%%%%%%%% Set icon
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
jFrame=get(handle(handles.figure1), 'javaframe');
jicon=javax.swing.ImageIcon('icon.jpg');
jFrame.setFigureIcon(jicon);
% --- Outputs from this function are returned to the command line.
function varargout = RadonS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function load_images_Callback(hObject, eventdata, handles)
global images menu Vars_and_flags  uicontrols

[filenamed, pathd]= uigetfile({'*.png;*.tiff;*.tif;*.jpg;*.jpeg;*.bmp'},'Binary Image','MultiSelect', 'on');
if pathd==0
    warndlg('Image not loaded, try again');
    return
end


if iscell(filenamed)
    Vars_and_flags.number_of_image=length(filenamed);
    images=cell(Vars_and_flags.number_of_image,1);
    for i=1:Vars_and_flags.number_of_image
        I=imread([pathd, filenamed{i}]);
        images{i}=image_segmentation(I);%%% segmentation algorithm
    end
else
    I=imread([pathd, filenamed]);
    images{1}=image_segmentation(I); %%% segmentation algorithm
    Vars_and_flags.number_of_image=1;
end

%%%%%%%% Visual changes 
imshow(images{1})
set(uicontrols.Legends,'visible','off')
set(uicontrols.bt_response,'Enable','off')
set(uicontrols.bt_response2 ,'Enable','off')
set(menu.apply,'Enable','on')
set(menu.setup,'Enable','on')
set(menu.setup2,'Enable','on')
set(menu.setup3,'Enable','on')
set(menu.classify,'Enable','off')
set(menu.expdata,'Enable','off')
set(menu.expima,'Enable','off')

if Vars_and_flags.number_of_image>1
    set(uicontrols.bt_prev,'Enable','on');
    set(uicontrols.bt_next,'Enable','on');
else
    set(uicontrols.bt_prev,'Enable','off');
    set(uicontrols.bt_next,'Enable','off');
end

%%%%%% Change of state of the flags
Vars_and_flags.assignment=nan;
Vars_and_flags.selected_image=1;
Vars_and_flags.applied_Radon=0;
Vars_and_flags.classification_performed=0;



function Radon_Callback(hObject, eventdata, handles)
global menu images results_images Vars_and_flags uicontrols

set(uicontrols.text_running,'visible','on')
pause(0.01)

theta =0:1:180; %%%% Integration angles
Vars_and_flags.area_and_difference=cell(1,Vars_and_flags.number_of_image);

for i=1:Vars_and_flags.number_of_image
    nobj=regionprops(images{i},'Image','Centroid');
    Ip=false(size(images{i},1),size(images{i},2),3);
    vcen = cat(1, nobj.Centroid);
    nrt=zeros(length(nobj),2);
    
    for iobj=1:length(nobj)
        I=nobj(iobj).Image;
        I=area_normalization(I,50000); %% normalization
        max_side=max(size(I));
        R=Radon_transform(I,theta);%Radon transform 
        Iref=inverse_Radon_transform(R,theta,max_side,0.5); %Refernece Image 
        for j=1:2 
            Rf=filtering(R,Vars_and_flags.cutoff_frequency(j), Vars_and_flags.filter_order(j)); 
            If=inverse_Radon_transform(Rf,theta,max_side,0.45);
            Id=differences_image(Iref,If,Vars_and_flags.area_threshold(j));
            
            if j==1
                nrt(iobj,j)=(sum(Id(:))/sum(Iref(:)))*100; % percentage difference
            else
                nrt(iobj,j)=length(regionprops(Id,'Image')); %number of non-overlapping regions 
            end
            
            %add filtered particle to image
            If=regionprops(If,'Image');
            If=If.Image;
            ncen=regionprops(If,'Centroid');
            ncen= ncen(:).Centroid;
            xi=ceil(vcen(iobj,1)-ncen(1));
            yi=ceil(vcen(iobj,2)-ncen(2));
            xi(xi<=0)=1;
            yi(yi<=0)=1;
            Ip(yi:yi+size(If,1)-1,xi:xi+size(If,2)-1,j)=If;

        end
        %add original particle to image
        Iref=regionprops(Iref,'Image');
        Iref=Iref.Image;
        ncen=regionprops(Iref,'Centroid');
        ncen= ncen(:).Centroid;
        xi=ceil(vcen(iobj,1)-ncen(1));
        xi(xi<=0)=1;
        yi=ceil(vcen(iobj,2)-ncen(2));
        yi(yi<=0)=1;
        Ip(yi:yi+size(Iref,1)-1,xi:xi+size(Iref,2)-1,j+1)=Iref;
    end
    Vars_and_flags.area_and_difference(i)={nrt};
    results_images{i}=Ip;
end

%%%%%%%% Visual changes
set(uicontrols.Legends,'visible','off')
set(uicontrols.bt_response2,'Enable','on', 'ForegroundColor',[0,0.6,0])
set(uicontrols.bt_response,'Enable','on', 'ForegroundColor',[0,1,0])
set(menu.expdata,'Enable','on')
set(menu.expima,'Enable','on')
set(menu.classify,'Enable','on')
set(uicontrols.text_running,'visible','off')
I=results_images{Vars_and_flags.selected_image};
imshowpair(I(:,:,3),I(:,:,1))

%%%%%% Change of state of the flags
Vars_and_flags.display_response=1;
Vars_and_flags.applied_Radon=1;
Vars_and_flags.classification_performed=0;

function classify_Callback(hObject, eventdata, handles)
global results_images images Vars_and_flags uicontrols

Vars_and_flags.classification_performed=1;
nrt=Vars_and_flags.area_and_difference{Vars_and_flags.selected_image};
Vars_and_flags.assignment=uint8(zeros(size(nrt,1),1));
Vars_and_flags=assignment(nrt,Vars_and_flags);
%%% Showing the results
Ip=results_images{Vars_and_flags.selected_image};
if Vars_and_flags.display_response==2
    imshowpair(Ip(:,:,3),Ip(:,:,2))
else
    imshowpair(Ip(:,:,3),Ip(:,:,1))
end

%%% Labeling the particles
It=images{Vars_and_flags.selected_image};
cent=regionprops(It,'Centroid');
cent = cat(1, cent.Centroid);
for i=1:size(nrt,1)
    hnd1=text(cent(i,1),cent(i,2),num2str(Vars_and_flags.assignment(i)));
    set(hnd1,'FontUnits','pixels','FontSize',12,'Color',[1 0 0])
end
set(uicontrols.Legends,'visible','on')

function setup_filters_Callback(hObject, eventdata, handles)
global uicontrols
set (uicontrols.textedit_fw1,'visible','on')
set (uicontrols.textedit_fw2,'visible','on')
set (uicontrols.text_fw1,'visible','on')
set (uicontrols.text_fw2,'visible','on')
set (uicontrols.ok_fw,'visible','on')

function Setup_models_Callback(hObject, eventdata, handles)
global  Vars_and_flags new_cova new_mean

sal=models();
uiwait(sal)

Vars_and_flags.classification_performed=0;
if ~isempty(new_cova)
Vars_and_flags.covariance_of_models=new_cova;
end
if ~isempty(new_mean)
Vars_and_flags.means_of_models=new_mean;
end

function Plot_models_Callback(hObject, eventdata, handles)
global Vars_and_flags
x1max=max(Vars_and_flags.means_of_models(2,:)+4.*sqrt(squeeze(Vars_and_flags.covariance_of_models(2,2,:)))');
x1min=min(Vars_and_flags.means_of_models(2,:)-4.*sqrt(squeeze(Vars_and_flags.covariance_of_models(2,2,:)))');
x2=x1min:0.05:x1max;
x1max=max(Vars_and_flags.means_of_models(1,:)+4.*sqrt(squeeze(Vars_and_flags.covariance_of_models(1,1,:)))');
x1min=min(Vars_and_flags.means_of_models(1,:)-4.*sqrt(squeeze(Vars_and_flags.covariance_of_models(1,1,:)))');
x1=x1min:0.05:x1max;
[X1,X2] = meshgrid(x1,x2);
F=zeros(size(X1,1),size(X1,2),5);
figure('color',[1,1,1]), hold on
xlim([x1(1),x1(end)])
ylim([x2(1),x2(end)])
zlim([0,1])

ylabel({'Regions (units)'},'FontSize',10);
xlabel({'difference (%)'},'FontSize',10);
zlabel({'Density'},'FontSize',10);
grid(gca,'on');

for i=1:5
Ft = mvnpdf([X1(:) X2(:)],Vars_and_flags.means_of_models(:,i)',Vars_and_flags.covariance_of_models(:,:,i));
Ft = reshape(Ft,length(x2),length(x1));
F(:,:,i)=Ft;
surf(x1,x2,Ft/(max(max(Ft))))
end
view(gca,[-54.8 68.6])
M = view(gca); 
R = M(1:3,1:3); 
x = R*[1;0;0]; 
y = R*[0;1;0]; 
z = R*[0;0;1]; 
set(get(gca,'XLabel'),'rotation',360/(2*pi)*atan(x(2)/x(1))) 
set(get(gca,'YLabel'),'rotation',360/(2*pi)*atan(y(2)/y(1))) 
set(get(gca,'ZLabel'),'rotation',360/(2*pi)*atan(z(2)/z(1)))
shading interp
colormap jet
% lightangle(-45,30)
set(gcf,'Renderer','zbuffer')
set(findobj(gca,'type','surface'),...
    'FaceLighting','phong',...
    'AmbientStrength',.3,'DiffuseStrength',.8,...
    'SpecularStrength',.9,'SpecularExponent',25,...
    'BackFaceLighting','unlit')
light('Position',[-1 0 0],'Style','local')
light('Position',[-0 2 10],'Style','local')
grid(gca,'on');



function fw1_call(src,eventdata)
global  Vars_and_flags
str=get(src,'String');
if isnan(str2double(str))
    set(src,'string',num2str( Vars_and_flags.cutoff_frequency(1)));
    warndlg('Input must be numerical');
end

function fw2_call(src,eventdata)
global  Vars_and_flags
str=get(src,'String');
if isnan(str2double(str))
    set(src,'string',num2str( Vars_and_flags.cutoff_frequency(2)));
    warndlg('Input must be numerical');
end

function ok_call(hObject, eventdata, handles)
global  Vars_and_flags  menu  uicontrols
set(uicontrols.text_running,'visible','on')
set(menu.classify,'Enable','on')
pause(0.1)
Vars_and_flags.cutoff_frequency(1)=str2double(get(uicontrols.textedit_fw1,'String'));
Vars_and_flags.cutoff_frequency(2)=str2double(get(uicontrols.textedit_fw2,'String'));


set(uicontrols.bt_response,'visible','on', 'ForegroundColor',[0,1,0])
set(uicontrols.bt_response2 ,'visible','on', 'ForegroundColor',[0,0.6,0])
set(uicontrols.text_running,'visible','off')
set(menu.expdata,'Enable','on')
set(menu.expima,'Enable','on')
set (uicontrols.textedit_fw1,'visible','off')
set (uicontrols.textedit_fw2,'visible','off')
set (uicontrols.text_fw1,'visible','off')
set (uicontrols.text_fw2,'visible','off')
set (uicontrols.ok_fw,'visible','off')
Radon_Callback(@Radon_Callback, eventdata, handles)



function next_Callback(hObject, eventdata, handles)
% hObject    handle to nextb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global images results_images Vars_and_flags uicontrols
if Vars_and_flags.selected_image+1<=Vars_and_flags.number_of_image
    Vars_and_flags.selected_image=Vars_and_flags.selected_image+1;
end

if Vars_and_flags.applied_Radon==0
    imshow(images{Vars_and_flags.selected_image})
elseif Vars_and_flags.classification_performed==1
    classify_Callback(@classify_Callback, eventdata, handles)
else
    Ip=results_images{Vars_and_flags.selected_image};
    if Vars_and_flags.display_response==2
        imshowpair(Ip(:,:,3),Ip(:,:,2))
        set(hObject, 'ForegroundColor',[0,1,0])
        set(uicontrols.bt_response, 'ForegroundColor',[0,0.6,0])
    else
        imshowpair(Ip(:,:,3),Ip(:,:,1))
        set(hObject, 'ForegroundColor',[0,1,0])
        set(uicontrols.bt_response2, 'ForegroundColor',[0,0.6,0])
    end
end

function previous_Callback(hObject, eventdata, handles)
% hObject    handle to beforeb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global images results_images Vars_and_flags uicontrols

if Vars_and_flags.selected_image-1>0
    Vars_and_flags.selected_image=Vars_and_flags.selected_image-1;
end
if Vars_and_flags.applied_Radon==0
    imshow(images{Vars_and_flags.selected_image})
elseif Vars_and_flags.classification_performed==1
    classify_Callback(@classify_Callback, eventdata, handles)
else
    Ip=results_images{Vars_and_flags.selected_image};
    if Vars_and_flags.display_response==2
        imshowpair(Ip(:,:,3),Ip(:,:,2))
        set(hObject, 'ForegroundColor',[0,1,0])
        set(uicontrols.bt_response, 'ForegroundColor',[0,0.6,0])
    else
        imshowpair(Ip(:,:,3),Ip(:,:,1))
        set(hObject, 'ForegroundColor',[0,1,0])
        set(uicontrols.bt_response2, 'ForegroundColor',[0,0.6,0])
    end
    
end

function response_Callback(hObject, eventdata, handles)
% hObject    handle to response (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global results_images Vars_and_flags uicontrols
Ip=results_images{Vars_and_flags.selected_image};
Vars_and_flags.display_response=1;
if Vars_and_flags.classification_performed==1
    classify_Callback(@classify_Callback, eventdata, handles)
else
imshowpair(Ip(:,:,3),Ip(:,:,1))
end
set(hObject, 'ForegroundColor',[0,1,0])
set(uicontrols.bt_response2, 'ForegroundColor',[0,0.6,0])

function response2_Callback(hObject, eventdata, handles)
% hObject    handle to response2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global results_images Vars_and_flags  uicontrols
Ip=results_images{Vars_and_flags.selected_image}; 
Vars_and_flags.display_response=2;
if Vars_and_flags.classification_performed==1
    classify_Callback(@classify_Callback, eventdata, handles)
else
imshowpair(Ip(:,:,3),Ip(:,:,2))
end
set(hObject, 'ForegroundColor',[0,1,0])
set(uicontrols.bt_response, 'ForegroundColor',[0,0.6,0])



function export_images_Callback(hObject, eventdata, handles)
global  results_images uicontrols Vars_and_flags
[file, path] = uiputfile({'*.jpg';'*.png';'*.bmp';'*.tiff'});
if path==0
    return
end
set(uicontrols.text_running,'visible','on')
pause(0.01)
for j=1:Vars_and_flags.number_of_image
    Ip=results_images{j};
    nobj=regionprops(Ip(:,:,1),'Centroid');
    if file~=0
        p=strfind(file,'.');
        p=p(end);
        Ic1=uint8(zeros(size(Ip,1),size(Ip,2)));
        Ic1(Ip(:,:,3)==1)=255;
        Ic2=Ic1;
        Ic3=Ic1;
        Idep=(Ip(:,:,1)-Ip(:,:,3));
        Idep=find(Idep==1);
        Ic1(Idep)=255;
        Ic2(Idep)=0;
        Ic3(Idep)=255;
        Idep=(Ip(:,:,3)-Ip(:,:,1));
        Idep=find(Idep==1);
        Ic1(Idep)=255;
        Ic2(Idep)=0;
        Ic3(Idep)=255;
        Ic1(Idep)=0;
        Ic2(Idep)=255;
        Ic3(Idep)=0;
        Ic1(:,:,2)=Ic2;
        Ic1(:,:,3)=Ic3;
        
        
        cen=reshape([nobj(:).Centroid],2,length(nobj));
        imgOut = insertInImage(uint8(Ic1), @()text(cen(1,:),cen(2,:), num2str([1:length(nobj)]')),...
            {'fontweight','bold','color','w','fontsize',26,...
            'linewidth',3,'margin',5,'edgecolor',[1 0 0],'backgroundcolor',[0.05 0.05 0.05]});
        
        
        
        file1=[file(1:p-1), '_image_', num2str(j),'_Resp1', file(p:end)];
        imwrite(imgOut,[path,file1]);
        Ic1=uint8(zeros(size(Ip,1),size(Ip,2)));
        Ic1(Ip(:,:,3)==1)=255;
        Ic2=Ic1;
        Ic3=Ic1;
        Idep=(Ip(:,:,2)-Ip(:,:,3));
        Idep=find(Idep==1);
        Ic1(Idep)=255;
        Ic2(Idep)=0;
        Ic3(Idep)=255;
        Idep=(Ip(:,:,3)-Ip(:,:,2));
        Idep=find(Idep==1);
        Ic1(Idep)=255;
        Ic2(Idep)=0;
        Ic3(Idep)=255;
        Ic1(Idep)=0;
        Ic2(Idep)=255;
        Ic3(Idep)=0;
        Ic1(:,:,2)=Ic2;
        Ic1(:,:,3)=Ic3;
        
        
        
        cen=reshape([nobj(:).Centroid],2,length(nobj));
        imgOut = insertInImage(uint8(Ic1), @()text(cen(1,:),cen(2,:), num2str([1:length(nobj)]')),...
            {'fontweight','bold','color','w','fontsize',26,...
            'linewidth',3,'margin',5,'edgecolor',[1 0 0],'backgroundcolor',[0.05 0.05 0.05]});
        
        file1=[file(1:p-1), '_image_', num2str(j),'_Resp2', file(p:end)];
        imwrite(imgOut,[path,file1]);
        
        
        
    end
end
set(uicontrols.text_running,'visible','off')

function export_data_Callback(hObject, eventdata, handles)
global  images Vars_and_flags uicontrols
set(uicontrols.text_running,'visible','on')
pause(0.01)

eti={'Angular';'Sub-angular';'Sub-rounded';'Rounded';'Well-rounded'};
dire = {'*.xls'};
[file, path] = uiputfile(dire);
if path==0
    set(ru,'visible','off')
    return
end
FileName=[path, file];
fileID = fopen(FileName,'w');
fprintf(fileID, ['Shape Analysis using RadonS ', date,'  \n \n']);
for j=1:Vars_and_flags.number_of_image
nobj=regionprops(images{j},'Centroid');
cen=reshape([nobj(:).Centroid],2,length(nobj));
imgOut = insertInImage(uint8(images{j}*255), @()text(cen(1,:),cen(2,:), num2str([1:length(nobj)]')),...
    {'fontweight','bold','color','w','fontsize',26,...
'linewidth',3,'margin',5,'edgecolor',[1 0 0],'backgroundcolor',[0.05 0.05 0.05]});
 imwrite(imgOut,[FileName(1:end-4),'_label_image_',num2str(j),'.jpg']);
Vars_and_flags.selected_image=j;
classify_Callback(@classify_Callback, eventdata, handles)

fprintf(fileID,['Image  ', num2str(j)]);
fprintf(fileID,'\n \n');
fprintf(fileID,['Particle','\t','difference (percent)','\t','Regions','\t', 'Class']);
fprintf(fileID,'\n');
nt=Vars_and_flags.area_and_difference{j};
nt=[(1:size(nt,1))' nt];
for ji=1:size(nt,1)
    fprintf(fileID,'%d \t %f \t %f \t %s \n',nt(ji,1),nt(ji,2),nt(ji,3),eti{Vars_and_flags.assignment(ji)});
end
fprintf(fileID,'\n \n');
end
fclose(fileID);
set(uicontrols.text_running,'visible','off')


function manual_Callback (hObject, eventdata, handles)

open('userguide.pdf')

