mkdir package
pip install -r requirements.txt -t package/
cd package
zip -r ../lambda_function.zip .
cd ..
zip lambda_function.zip lambda_function.py