/*
 * Copyright (C) 2023, Hogeschool Rotterdam, Harry Broeders
 * All rights reserved.
 */

#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <NoRTOS.h>

#include <ti/devices/cc32xx/inc/hw_memmap.h>
#include <ti/devices/cc32xx/inc/hw_types.h>
#include <ti/devices/cc32xx/driverlib/prcm.h>
#include <ti/devices/cc32xx/driverlib/i2s.h>
#include <ti/drivers/I2C.h>

#include "ti_drivers_config.h"
#include "config.h"

// You can select the sample rate here
#define SAMPLINGFREQUENCY 48000
#if SAMPLINGFREQUENCY < 8000 || SAMPLINGFREQUENCY > 48000 || SAMPLINGFREQUENCY % 4000 != 0
#error Sampling Frequency must be between 8 kHz and 48 kHz (included) and must be a multiple of 4 kHz.
#endif

int main(void)
{
    // Init CC3220S LAUNCHXL board.
    Board_initGeneral();
    // Prepare to use TI drivers without operating system
    NoRTOS_start();

    printf("1 kHz sine wave ==> Left HP LINE OUT.\n");

    // Configure an I2C connection which is used to configure the audio codec.
    I2C_Handle i2cHandle = ConfigureI2C(CONFIG_I2C_0, I2C_400kHz);
    // Configure the audio codec.
    ConfigureAudioCodec(i2cHandle, SAMPLINGFREQUENCY);

    // Configure an I2S connection which is use to send/receive samples to/from the codec.
    ConfigureI2S(CONFIG_I2S_0, I2S_BASE, SAMPLINGFREQUENCY);

    /* Pre-generated sine wave data, 16-bit signed fixed point samples Q0.15 */
    int16_t sinetable[48] = {
        0x0000, 0x10B5, 0x2121, 0x30FB, 0x4000, 0x4DEB,
        0x5A82, 0x658C, 0x6ED9, 0x7641, 0x7BA2, 0x7EE7,
        0x7FFF, 0x7EE7, 0x7BA2, 0x7641, 0x6ED9, 0x658C,
        0x5A82, 0x4DEB, 0x4000, 0x30FB, 0x2121, 0x10B5,
        0x0000, 0xEF4B, 0xDEDF, 0xCF05, 0xC000, 0xB215,
        0xA57E, 0x9A74, 0x9127, 0x89BF, 0x845E, 0x8119,
        0x8001, 0x8119, 0x845E, 0x89BF, 0x9127, 0x9A74,
        0xA57E, 0xB215, 0xC000, 0xCF05, 0xDEDF, 0xEF4B
    };

    /* Pre-generated sawtooth wave data low to high, 16-bit signed fixed point samples Q0.15 */
    int16_t sawtoothtable[48] = {
        0x8000, 0x8572, 0x8AE5, 0x9057, 0x95C9, 0x9B3C,
        0xA0AE, 0xA621, 0xAB93, 0xB105, 0xB678, 0xBBEA,
        0xC15C, 0xC6CF, 0xCC41, 0xD1B3, 0xD726, 0xDC98,
        0xE20B, 0xE77D, 0xECEF, 0xF262, 0xF7D4, 0xFD46,
        0x02B9, 0x082B, 0x0D9D, 0x1310, 0x1882, 0x1DF4,
        0x2367, 0x28D9, 0x2E4C, 0x33BE, 0x3930, 0x3EA3,
        0x4415, 0x4987, 0x4EFA, 0x546C, 0x59DE, 0x5F51,
        0x64C3, 0x6A36, 0x6FA8, 0x751A, 0x7A8D, 0x7FFF
    };

    int16_t sec, msec, sampleNum;
    int16_t dataLeft, dataRight;
    size_t n = 0;

    for (sec = 0; sec < 5 * 60; sec++) {
        for (msec = 0; msec < 1000; msec++) {
            for (sampleNum = 0; sampleNum < SAMPLINGFREQUENCY/1000; sampleNum++) {
                dataLeft = sinetable[n];
                I2SDataPut(I2S_BASE, I2S_DATA_LINE_0, (unsigned long)dataLeft);
                dataRight = sawtoothtable[n];
                I2SDataPut(I2S_BASE, I2S_DATA_LINE_0, (unsigned long)dataRight);
                n++;
                if (n == 48) {
                    n = 0;
                }
            }
        }
    }

    printf("\n***Progam ended***\n");

    return 0;
}

