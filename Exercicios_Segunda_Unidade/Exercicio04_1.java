//Exercicio 02 (Aula 12)

import java.util.Vector;
import java.util.concurrent.atomic.AtomicBoolean;

public class Exercicio04_1{
	
	Vector<Integer> fila;
	int contador;	

	AtomicBoolean alterandoFila;
	AtomicBoolean incrementaContador;
	//	compareAndSet(boolean expect, boolean update)

	public Exercicio04_1(){
		alterandoFila = new AtomicBoolean(false);
		incrementaContador = new AtomicBoolean(false);
		this.fila = new Vector<Integer>();
		this.contador = 1;
	}

	public int inserir(int i, int id){
		while(!alterandoFila.compareAndSet(false, true)){

		}

		fila.add(i);
		System.out.println("THread "+ id+ " Inserindo >>>"+ i + " ---");
		for (int j = 0; j < fila.size(); j++){
			System.out.print(" " + fila.get(j));
		}

		alterandoFila.set(false);

		return i;
	}

	public synchronized void remover(int id){
		while(!alterandoFila.compareAndSet(false, true)){

		}

		fila.remove(0);

		if(fila.size() != 0){
			System.out.println("THread "+ id+ " Removendo <<< ---");
			for (int j = 0; j < fila.size(); j++){
				System.out.print(" " + fila.get(j));
			}
		}else{
			System.out.print(" fila vazia");
		}

		alterandoFila.set(false);		
	}

	public synchronized void incrementar(){
		while(!incrementaContador.compareAndSet(false, true)){

		}

		contador++;

		incrementaContador.set(false);
	}

	public static void main(String [] args){
		Exercicio04_1 ex = new Exercicio04_1();

		Thread thread []= new ThreadExer1[4];

		for(int i = 0; i < thread.length; i++){
			thread[i] = new ThreadExer1(ex, i);
			thread[i].start();
		}
		
		for(int i = 0; i < thread.length; i++){
			try{
				thread[i].join();
			}catch(InterruptedException e){
				System.out.println("NOT");
			}
		}
		
	}
}

class ThreadExer1 extends Thread{
	Exercicio04_1 ex;
	int id;

	public ThreadExer1(Exercicio04_1 ex, int id){
		this.ex = ex;
		this.id = id;
	}

	public void run(){
		for(int i =0; i<10; i++){
			ex.incrementar();
			ex.inserir(ex.contador,this.id);
			
			try{
				Thread.sleep(100);
			}catch(InterruptedException e){
				System.out.println("NOT");
			}			
			ex.remover(this.id);
		}	
	}
}