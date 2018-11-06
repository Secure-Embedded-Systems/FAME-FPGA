void main() {
  static volatile int *pio;
  pio = (int *) 0x80000500;
  volatile long long cnt,cnt2;
  
  pio[3] = 0; // diable interrupt
  pio[2] = 0xffffffff; // set to output direction
  // pio[2] = 0;//read
  //pio[1] = 0xffffffff; // set output data to 0;
  while(1) {
    pio[1] = 0x1; // set the output register to 0
    for(cnt2=0; cnt2<8; cnt2++)
      {	 
	for(cnt=0;cnt<1000000;cnt++);
	pio[1] = pio[1] << 1;
      }
    
  }
}
