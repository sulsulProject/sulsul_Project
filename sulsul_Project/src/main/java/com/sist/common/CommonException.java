package com.sist.common;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.web.bind.annotation.ControllerAdvice;

import org.springframework.web.bind.annotation.ExceptionHandler;
@ControllerAdvice

public class CommonException {
	@ExceptionHandler(RuntimeException.class)
	public void runtimeException(RuntimeException ex)
	{
		System.out.println("========== RuntimeException ==========");
		System.out.println(ex.getMessage());
		System.out.println("======================================");
	}
	@ExceptionHandler(SQLException.class)
	public void sqlException(SQLException ex)
	{
		System.out.println("========== SQLException ==========");
		System.out.println(ex.getMessage());
		System.out.println("======================================");
	}
	@ExceptionHandler(IOException.class)
	public void ioException(IOException ex)
	{
		System.out.println("========== IOException ==========");
		System.out.println(ex.getMessage());
		System.out.println("======================================");
	}
	@ExceptionHandler(Exception.class)
	public void exception(Exception ex)
	{
		System.out.println("========== Exception ==========");
		System.out.println(ex.getMessage());
		System.out.println("======================================");
	}
}
