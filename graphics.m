function varargout = graphics(varargin)
% GRAPHICS MATLAB code for graphics.fig
%      GRAPHICS, by itself, creates a new GRAPHICS or raises the existing
%      singleton*.
%
%      H = GRAPHICS returns the handle to a new GRAPHICS or the handle to
%      the existing singleton*.
%
%      GRAPHICS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAPHICS.M with the given input arguments.
%
%      GRAPHICS('Property','Value',...) creates a new GRAPHICS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before graphics_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to graphics_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help graphics

% Last Modified by GUIDE v2.5 13-May-2019 10:53:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @graphics_OpeningFcn, ...
                   'gui_OutputFcn',  @graphics_OutputFcn, ...
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


% --- Executes just before graphics is made visible.
function graphics_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to graphics (see VARARGIN)

% Choose default command line output for graphics
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes graphics wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = graphics_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nr_muncitori=load('numarMuncitori.txt');
distrib_muncitori=zeros(1,4);
distrib_muncitori(1)=nr_muncitori(1)+nr_muncitori(5)+nr_muncitori(9);
distrib_muncitori(2)=nr_muncitori(2)+nr_muncitori(6)+nr_muncitori(10);
distrib_muncitori(3)=nr_muncitori(3)+nr_muncitori(7)+nr_muncitori(11);
distrib_muncitori(4)=nr_muncitori(4)+nr_muncitori(8)+nr_muncitori(12);
disp(distrib_muncitori);
 grafic1=figure;
pie3(distrib_muncitori);
 labels = {'employees paid with $8','employees paid with $11','employees paid with $13','employees paid with $16'};
legend(labels,'Location','southoutside','Orientation','horizontal');
x0=200;
y0=300;
width=900;
height=400;
set(grafic1,'position',[x0,y0,width,height]);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nr_muncitori=load('numarMuncitori.txt');
distrib_muncitori=zeros(1,3);
distrib_muncitori(1)=nr_muncitori(1)+nr_muncitori(2)+nr_muncitori(3)+nr_muncitori(4);
distrib_muncitori(2)=nr_muncitori(5)+nr_muncitori(6)+nr_muncitori(7)+nr_muncitori(8);
distrib_muncitori(3)=nr_muncitori(9)+nr_muncitori(10)+nr_muncitori(11)+nr_muncitori(12);

disp(distrib_muncitori);
 grafic2=figure;
 pie3(distrib_muncitori);
 %bar(distrib_muncitori,'DisplayName','ans')
 labels = {'Employees in first shift','Employees in second shift','Employees in third shift'};
legend(labels,'Location','southoutside','Orientation','horizontal');
x0=200;
y0=300;
width=900;
height=400;
set(grafic2,'position',[x0,y0,width,height])



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nr_muncitori=load('numarMuncitori.txt');
muncitori=zeros(3,4);
muncitori(1,1)=nr_muncitori(1);
muncitori(1,2)=nr_muncitori(4);
muncitori(1,3)=nr_muncitori(7);
muncitori(1,4)=nr_muncitori(10);

muncitori(2,1)=nr_muncitori(2);
muncitori(2,2)=nr_muncitori(5);
muncitori(2,3)=nr_muncitori(8);
muncitori(2,4)=nr_muncitori(11);

muncitori(3,1)=nr_muncitori(3);
muncitori(3,2)=nr_muncitori(6);
muncitori(3,3)=nr_muncitori(9);
muncitori(3,4)=nr_muncitori(12);


disp(muncitori);
 grafic3=figure
 bar(muncitori,'DisplayName','ans')
  labels = {'employees paid with $8','employees paid with $11','employees paid with $13','employees paid with $16'};
legend(labels,'Location','southoutside','Orientation','horizontal');
x0=200;
y0=300;
width=900;
height=400;
set(grafic3,'position',[x0,y0,width,height])


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p1=load('numarOptimProductieTura1.txt');
p2=load('numarOptimProductieTura2.txt');
p3=load('numarOptimProductieTura3.txt');
distrib_productie=zeros(1,3);
distrib_productie(1)=p1(3);
distrib_productie(2)=p2(3);
distrib_productie(3)=p3(3);
grafic4=figure
pie3(distrib_productie);
labels = {'quantity produced in shift 1','quantity produced in shift 2','quantity produced in shift 3'};
legend(labels,'Location','southoutside','Orientation','horizontal');
x0=200;
y0=300;
width=900;
height=400;
set(grafic4,'position',[x0,y0,width,height]);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p1=load('numarOptimProductieTura1.txt');
p2=load('numarOptimProductieTura2.txt');
p3=load('numarOptimProductieTura3.txt');
distrib_productie=zeros(3,2);
distrib_productie(1,1)=p1(1);
distrib_productie(1,2)=p1(2);
distrib_productie(2,1)=p2(1);
distrib_productie(2,2)=p2(2);
distrib_productie(3,1)=p3(1);
distrib_productie(3,2)=p3(2);
grafic5=figure
bar(distrib_productie,'DisplayName','ans')
%title('Productivity per shift');
labels1 = {'product 1 quantity ','product 2 quantity'};
legend(labels1,'Location','northoutside','Orientation','horizontal');
x0=200;
y0=300;
width=900;
height=400;
set(grafic5,'position',[x0,y0,width,height]);





% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
