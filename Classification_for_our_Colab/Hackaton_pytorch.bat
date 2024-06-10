rem you should change the root with your own environment path root.
rem and you could change the ENV_NAME with your one vitual environment.
set root=C:\Users\Seo\anaconda3
set ENV_NAME=Dron_Pytorch

if not exist "%root%" (
    echo check the root please: %root%
    pause
    exit
)

call %root%\Scripts\activate.bat %root%

echo make the virtual environment '%ENV_NAME%'
call conda create -y -n %ENV_NAME% python=3.10

echo enter the virtual environment.
call conda activate %ENV_NAME%

echo start downloading environment for %ENV_NAME%.
call conda install -y pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
call conda install -y conda-forge::pandas conda-forge::tqdm conda-forge::matplotlib conda-forge::torchinfo conda-forge::scikit-plot anaconda::scikit-learn conda-forge::seaborn conda-forge::accelerate
call pip install ema-pytorch
call pip install pytorch-fid
call pip install wandb
call pip install ipywidgets

call conda deactivate

echo complete. 