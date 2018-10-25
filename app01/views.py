from django.shortcuts import render ,HttpResponse
from app01.models import *
# Create your views here.
import json
def index(request):
    return  render(request,"indexs.html")
def test(request):
    print (request.GET)

    return  HttpResponse("mazhen")
def tests(request):
    n1=int(request.POST.get("n1"))
    n2 = int(request.POST.get("n2"))
    n3= n1+n2
    print (n3)
    return HttpResponse(n3)
def  denglu(request):
    user = request.POST.get("n1")
    pwd = request.POST.get("n2")
    user = Xinxi.objects.filter(user=user,pwd=pwd).first()
    res={"user":None,"mgs":None}
    if user:
        res["user"]=user.user
    else:
        res["mgs"] = "账号或密码错误"

    return HttpResponse(json.dumps(res))
def filedata(request):
    if request.method =="POST":
        user= request.POST.get("user")
        print (user)
        file=request.FILES.get("avatar")
        with open(file.name ,"wb") as f:
            for line in file:
                f.write(line)
        return HttpResponse("OK")

    return render(request ,"filedata.html")