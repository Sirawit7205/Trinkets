#include "mcc_generated_files/mcc.h"
#include <avr/io.h>
#include <util/delay.h>

//message storing variable
//buffer for writing to/from EEPROM
uint8_t messageLength = 0;
uint8_t message[128] = {};

uint8_t mapCharacter(char input);
void changeMessageViaUart();
void delay(unsigned int t);

int main(void) {
    
    //init MCC codes
    SYSTEM_Initialize();
    
    //init ports
    //port A as outputs except PA0
    PORTA.DIR = 0xFE;
    PORTA.PIN0CTRL |= PORT_PULLUPEN_bm;
    //port B0 as input with pullup
    PORTB.DIR &= ~(1 << 0);
    PORTB.PIN0CTRL |= PORT_PULLUPEN_bm;
    
    //check for message input mode
    //and update the message
    if((PORTB.IN & (1 << 0)) == 0)
    {
        changeMessageViaUart();
    }

    //read the message from EEPROM
    NVMCTRL_ReadEepromBlock(0, message, EEPROM_SIZE);
    
    //read the message length
    messageLength = message[0];
    
    while (1) {
        //just loop the message forever
        for(int i = 1; i <= messageLength; i++) {
            PORTA.OUT = message[i];
            delay(500);
            PORTA.OUT = 0xFF;
            delay(100);
        }
    }
}

//character mapping function for 7 segment display
//physical connections: A1-G, A2-F, A3-A, A4-B, A5-C, A6-D, A7-E
//note that K, M, Q, V, W, X are impossible and will just blank the display
uint8_t mapCharacter(char input) {
    switch(input) {
        //numbers
        case '0': return 0x03;
        case '1': return 0xCF;
        case '2': return 0x25;
        case '3': return 0x85;
        case '4': return 0xC9;
        case '5': return 0x91;
        case '6': return 0x11;
        case '7': return 0xC7;
        case '8': return 0x01;
        case '9': return 0x81;
        
        //alphabets A-H
        case 'A': return 0x41;
        case 'a': return 0x41;
        case 'B': return 0x19;
        case 'b': return 0x19;
        case 'C': return 0x33;
        case 'c': return 0x3D;
        case 'D': return 0x0D;
        case 'd': return 0x0D;
        case 'E': return 0x31;
        case 'e': return 0x31;
        case 'F': return 0x71;
        case 'f': return 0x71;
        case 'G': return 0x81;
        case 'g': return 0x81;
        case 'H': return 0x49;
        case 'h': return 0x59;
        
        //alphabets I-S
        case 'I': return 0x7B;
        case 'i': return 0x7B;
        case 'J': return 0x8F;
        case 'j': return 0x8F;
        case 'L': return 0x3B;
        case 'l': return 0x3B;
        case 'N': return 0x5D;
        case 'n': return 0x5D;
        case 'O': return 0x03;
        case 'o': return 0x1D;
        case 'P': return 0x61;
        case 'p': return 0x61;
        case 'R': return 0x7D;
        case 'r': return 0x7D;
        case 'S': return 0x91;
        case 's': return 0x91;
        
        //alphabets T-Z
        case 'T': return 0x39;
        case 't': return 0x39;
        case 'U': return 0x0B;
        case 'u': return 0x1F;
        case 'Y': return 0x89;
        case 'y': return 0x89;
        case 'Z': return 0x25;
        case 'z': return 0x25;
        
        //other characters
        case '-': return 0xFD;
        
        //blank the rest (invalid, whitespace)
        default: return 0xFF;
    }
}

//receive new input message via UART
void changeMessageViaUart() {
    printf("Trinkets v.2 new message input prompt.\n");
    printf("www.sleepyponylabs.com 2020\n\n");
    
    printf("Enter new message below, up to %d characters.\n", MAPPED_EEPROM_SIZE - 1);
    printf("Valid characters are: 0-9, A-Z (except K M Q V W X), -, space\n");
    printf("Other invalid characters will blank the display.\n");
    printf("Tips: Copy/Paste into the terminal instead of typing.\n");
    printf("Tips: Add spaces to the end for blank period before looping.\n\n");
    printf("New Message> ");
    
    //wait for user input
    while(!USART0_IsRxReady());
    
    //put the input message into buffer
    int timeout = 0;
    messageLength = 0;
    while(USART0_IsRxReady()) {
        message[++messageLength] = mapCharacter(USART0_Read());
        
        //wait for next byte
        timeout = 0;
        while(!USART0_IsRxReady())
        {
            timeout++;
            _delay_ms(1);
            if(timeout > 5)
                break;
        }
    }
    
    //put the message length into the first byte
    message[0] = messageLength;
    printf("\nTotal of %d characters received.\n", messageLength);
    
    //write EEPROM block
    uint8_t result = NVMCTRL_WriteEepromBlock(0, message, messageLength);
    
    //done
    if(result == 0) {
        printf("Done! You can now disconnect.\n");
    }
    else {
        printf("EEPROM write error. Please try again.\n");
    }

}

//delay routine based on _delay_ms
void delay(unsigned int t) {
    unsigned int i, ten, rem;
    
    ten = t / 10;
    rem = t - (t / 10);
    
    for(i = 0; i < ten; i++) {
        _delay_ms(10);
    }
    
    for(i = 0; i < rem; i++) {
        _delay_ms(1);
    }   
}
