//Exercicio 04 - contador compartilhado
public class Exercicio03 extends Thread{
	static int contador;//var compartilhada entre as threads
	int limite ;
	int id;

	public Exercicio03(int id){
		this.contador = 0;
		this.limite = 100;
		this.id = id;
	}

	public synchronized void run (){
		while(contador < limite){
			this.contador++;
			System.out.println("THREAD -- "+ this.id +" CONTA >>"+contador);
		}
	}

	public static void main(String[] args){
		Thread []thread = new Exercicio03[5];

		for(int i = 0; i < thread.length; i++){
			thread[i] = new Exercicio03(i);
			thread[i].start();
		}
		for(int i = 0; i < thread.length; i++){
			try{
				thread[i].join();
			}catch(InterruptedException e){

			}
		}

	}
}