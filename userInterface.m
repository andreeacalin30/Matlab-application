function varargout = userInterface(varargin)
% USERINTERFACE MATLAB code for userInterface.fig
%      USERINTERFACE, by itself, creates a new USERINTERFACE or raises the existing
%      singleton*.
%
%      H = USERINTERFACE returns the handle to a new USERINTERFACE or the handle to
%      the existing singleton*.
%
%      USERINTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USERINTERFACE.M with the given input arguments.
%
%      USERINTERFACE('Property','Value',...) creates a new USERINTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before userInterface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to userInterface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help userInterface

% Last Modified by GUIDE v2.5 07-May-2019 21:57:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @userInterface_OpeningFcn, ...
                   'gui_OutputFcn',  @userInterface_OutputFcn, ...
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


% --- Executes just before userInterface is made visible.
function userInterface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to userInterface (see VARARGIN)

% Choose default command line output for userInterface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes userInterface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = userInterface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
nrOptim=load('cereriProduse.txt');
set(handles.textAboutQuantity ,'String',sprintf('%s %d %s %d %s',  'Quantity of production per shift for delivering the required quantities: ',nrOptim(1),' units of product 1 and ', nrOptim(2), ' units of product 2')); 



% --- Executes on button press in readNumberEmp.
function readNumberEmp_Callback(hObject, eventdata, handles)
% hObject    handle to readNumberEmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generatia_urmatoare('multiplier.txt','payment.txt', 20,50,0.8,0.5,1e-5,10);
%outputResult = dlmread('C:\Users\Andreea\Documents\ANULII\semestrul II\PEAG\licenta\problema muncitori\numarMuncitori.txt', ',');
%s = strcat(s1,...,sN)
outputResult=load('numarMuncitori.txt');

set(handles.textEmpSolution1,'String',sprintf('%s %d %d %d %d', '1st shift:',outputResult(1),outputResult(4),outputResult(7),outputResult(10)));
set(handles.textEmpSolution2,'String',sprintf('%s %d %d %d %d', '2nd shift:',outputResult(2),outputResult(5),outputResult(8),outputResult(11)));
set(handles.textEmpSolution3,'String',sprintf('%s %d %d %d %d', '3rd shift:',outputResult(3),outputResult(6),outputResult(9),outputResult(12)));

% --- Executes on button press in generateTranpSolution.
function generateTranpSolution_Callback(hObject, eventdata, handles)
% hObject    handle to generateTranpSolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button1.
function button1_Callback(hObject, eventdata, handles)
% hObject    handle to button1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=load('numarMuncitori.txt');
nr_pers=n(1)+n(4)+n(7)+n(10);
generatia_urmatoare_produse( 20,50,0.8,0.5,1e-5,10,nr_pers);
productionOutput=load('numarOptimProductie.txt');
 dlmwrite('numarOptimProductieTura1.txt',productionOutput*nr_pers); 
set(handles.text1,'String',sprintf('%s %d %d %s %d ', 'Optim production 1st shift:',productionOutput(1)*nr_pers,productionOutput(2)*nr_pers,' with maximum cost:',productionOutput(3)));

% --- Executes on button press in button2.
function button2_Callback(hObject, eventdata, handles)
% hObject    handle to button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=load('numarMuncitori.txt');
nr_pers=n(2)+n(5)+n(8)+n(11);
generatia_urmatoare_produse( 20,50,0.8,0.5,1e-5,10,nr_pers);
productionOutput=load('numarOptimProductie.txt');
 dlmwrite('numarOptimProductieTura2.txt',productionOutput*nr_pers); 
set(handles.text2,'String',sprintf('%s %d %d %s %d ', 'Optim production 2nd shift:',productionOutput(1)*nr_pers,productionOutput(2)*nr_pers,' with maximum cost:',productionOutput(3)));


% --- Executes on button press in button3.
function button3_Callback(hObject, eventdata, handles)
% hObject    handle to button3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=load('numarMuncitori.txt');
nr_pers=n(3)+n(6)+n(9)+n(12);
generatia_urmatoare_produse( 20,50,0.8,0.5,1e-5,10,nr_pers);
productionOutput=load('numarOptimProductie.txt');
 dlmwrite('numarOptimProductieTura3.txt',productionOutput*nr_pers); 
set(handles.text3,'String',sprintf('%s %d %d %s %d ', 'Optim production 3rd shift:',productionOutput(1)*nr_pers,productionOutput(2)*nr_pers,' with maximum cost:',productionOutput(3)));


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

run graphics;
