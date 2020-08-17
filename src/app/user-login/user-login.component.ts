import { Component, OnInit } from '@angular/core';
import{ User } from '../models/User';
import { UserService } from '../services/UserService';
import { FormsModule, FormGroup,FormControl,Validators } from '@angular/forms';
import { stringify } from '@angular/compiler/src/util';


@Component({
  selector: 'app-user-login',
  templateUrl: './user-login.component.html',
  styleUrls: ['./user-login.component.css']
})
export class UserLoginComponent implements OnInit {
  username;
  password;
  logins;
  e;
  p;
  myForm:FormGroup;
  result;
  user:User;

  constructor(private service:UserService) {
    this.e=new String();
    this.p=new String();
    this.logins=[];
    this.user=new User();
      //this.login=new User();
      this.myForm=new FormGroup({
        
        email:new FormControl(null,[Validators.required,Validators.pattern("^[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$")]),
        pass:new FormControl(null,[Validators.required])      
  
      });

  }
  public get email(){
    return this.myForm.get('email');
  }

  public get pass(){
    return this.myForm.get('pass');
  }
  login(){
    if(this.myForm.valid){
      this.user.Email=this.email.value;
      this.user.Password=this.pass.value;
      console.log(this.user.Password,this.user.Email);
    this.service.getUserLogin(this.user).subscribe((data)=>{
      console.log(data);
      console.log("success");
      this.result="Logged In";
      this.e=null;
      this.p=null;
     
      this.user=new User();
    
    })
  }
  else
  {
  this.result="Incorrect User or password";
 this.p=null;
  }
   
    
  }
  ngOnInit(): void {
  }

}
