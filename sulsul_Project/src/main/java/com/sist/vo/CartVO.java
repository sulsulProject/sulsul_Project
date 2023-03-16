package com.sist.vo;
import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CartVO{

   private int bno,ino,account,total_price;
   private String id,buy_ok,dbday;
   private Date regdate;
   private WineVO wvo=new WineVO();
}