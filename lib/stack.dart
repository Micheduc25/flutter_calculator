class MyStack{
  var stackList=[];
  int top=0;


  push(element){
    this.stackList.insert(top,element );
    this.top++;

  }

  pop(){
    var popped=null;
    if (top>=0){
      popped=this.stackList[top];
      top--;
    }

    return popped;
  }

  clear(){
    this.stackList.clear();
  }

  calculate(List expList){



  }
}