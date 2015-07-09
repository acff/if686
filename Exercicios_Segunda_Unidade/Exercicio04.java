//Exercicio 01 (Aula 12)

import java.util.Vector;

public class Exercicio04{
	
	Vector<Integer> fila;
	int contador;	

	public Exercicio04(){
		this.fila = new Vector<Integer>();
		this.contador = 1;
	}

	public synchronized int inserir(int i, int id){
		fila.add(i);
		System.out.println("THread "+ id+ " Inserindo >>>"+ i + " ---");
		for (int j = 0; j < fila.size(); j++){
			System.out.print(" " + fila.get(j));
		}
		return i;
	}

	public synchronized void remover(int id){
		fila.remove(0);

		if(fila.size() != 0){
			System.out.println("THread "+ id+ " Removendo <<< ---");
			for (int j = 0; j < fila.size(); j++){
				System.out.print(" " + fila.get(j));
			}
		}else{
			System.out.print(" fila vazia");
		}
		
	}

	public synchronized void incrementar(){
		contador++;
	}

	public static void main(String [] args){
		Exercicio04 ex = new Exercicio04();

		Thread thread []= new ThreadExer[4];

		for(int i = 0; i < thread.length; i++){
			thread[i] = new ThreadExer(ex, i);
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

class ThreadExer extends Thread{
	Exercicio04 ex;
	int id;

	public ThreadExer(Exercicio04 ex, int id){
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