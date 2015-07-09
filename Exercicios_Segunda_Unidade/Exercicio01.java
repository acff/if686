//Exercicio 01 - Slide 11
//Exercicio 02 (com join()) -Slide 11
public class Exercicio01 extends Thread{

	int a, b;

	public Exercicio01 (int a, int b){
		this.a = a;
		this.b = b;
	}

	public void run(){
		for (int i = a; i <= b; i++){
			System.out.println(i);
		}
	}

	public static void main(String args[]){

		Long timeStart = System.currentTimeMillis();

		Thread thread1 = new Exercicio01(0,200);
		thread1.start();
		try{
			thread1.join();
		}catch(InterruptedException e){

		}

		Thread thread2 = new Exercicio01(201,400);
		thread2.start();
		try{
			thread2.join();
		}catch(InterruptedException e){

		}

		Thread thread3 = new Exercicio01(401, 700);
		thread3.start();
		try{
			thread3.join();
		}catch(InterruptedException e){

		}
		
		System.out.println("Tempo total de execucao:.:.: "+ (System.currentTimeMillis() - timeStart));
	}
}
