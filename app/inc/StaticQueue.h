#ifndef STATIC_QUEUE_H
#define STATIC_QUEUE_H

#include <stdint.h>

typedef struct
{
	uint8_t* data;
	uint32_t front; 
	uint32_t rear;
	uint32_t type_size;
	uint32_t size;
}StaticQueue;

uint8_t static_queue_init(StaticQueue* psq, uint8_t* buf, uint32_t type_size, uint32_t size);

uint8_t static_queue_insert(StaticQueue* psq, const void* data);

uint32_t static_queue_inserts(StaticQueue* psq, const void* data, uint32_t len);

void* static_queue_read(StaticQueue* psq, void* data);

uint32_t static_queue_reads(StaticQueue* psq, void* data, uint32_t len);

uint8_t static_queue_is_full(StaticQueue* psq);

uint8_t static_queue_is_empty(StaticQueue* psq);

uint32_t static_queue_len(StaticQueue* psq);

#endif
