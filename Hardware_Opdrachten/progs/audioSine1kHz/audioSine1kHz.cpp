#include <stdint.h>
#include <process.h>

// Demo programma DIS10 2020 Hogeschool Rotterdam BroJZ

static const int N = 48;

// Vooraf gegenereerde sinus data (eerste kwadrant),
// 16-bit signed fixed point samples Q0.15
static const uint16_t sinetable[N/4+1] = {
        0,  4277,  8481, 12539, 16384, 19947,
    23170, 25996, 28377, 30273, 31650, 32487, 32767
};

int16_t get_sine_sample(size_t index)
{
    if (index <= N/4) return sinetable[index];
    if (index <= N/2) return sinetable[N/2-index];
    if (index <= 3*N/4) return -sinetable[index-N/2];
    return -sinetable[N-index];
}

int16_t process_left_sample(int16_t sample)
{
    static size_t i = 0;
    sample = get_sine_sample(i);
    if (++i == N) i = 0;
    return sample;
}

int16_t process_right_sample(int16_t sample)
{
    sample = 0;
    return sample;
}
