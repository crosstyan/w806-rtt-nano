#include "StaticQueue.h"

uint8_t static_queue_init(StaticQueue* psq, uint8_t* buf, uint32_t type_size, uint32_t size)
{
	psq->data = (uint8_t)buf;
	psq->type_size = type_size;
	psq->size = size;
	psq->front = 0;
	psq->rear = 0;
	return 1;
}

uint8_t static_queue_insert(StaticQueue* psq, const void* data)
{
	if(static_queue_is_full(psq)) return 0;
	
	if(psq->type_size==1)
		psq->data[psq->rear++] = *((uint8_t*)data);
	else
		memcpy(psq->data+((psq->rear++)*psq->type_size), data, psq->type_size);
	psq->rear %= psq->size;
	
	return 1;
}

uint32_t static_queue_inserts(StaticQueue* psq, const void* data, uint32_t len)
{
	uint32_t i;
	uint32_t r = psq->size-static_queue_len(psq)-1;
	const uint8_t* sdata = (const uint8_t*)data;
	len = len>r?r:len;
	for(i=0; i<len; ++i)
	{
		if(psq->type_size==1)
			psq->data[psq->rear++] = sdata[i];
		else
		{
			memcpy(psq->data+((psq->rear++)*psq->type_size), sdata, psq->type_size);
			sdata += psq->type_size;
		}
		psq->rear %= psq->size;
	}
	return len;
}

void* static_queue_read(StaticQueue* psq, void* data)
{
	if(static_queue_is_empty(psq)) return (void*)0;
	
	if(psq->type_size==1)
		*((uint8_t*)data) = psq->data[psq->front++];
	else
		memcpy(data, psq->data+((psq->front++)*psq->type_size), psq->type_size);
	psq->front %= psq->size;
	return (void*)data;
}

uint32_t static_queue_reads(StaticQueue* psq, void* data, uint32_t len)
{
	uint32_t i;
	uint32_t L = static_queue_len(psq);
	uint8_t* sdata = (uint8_t*)data;
	len = len>L?L:len;
	for(i=0; i<len; ++i)
	{
		if(psq->type_size==1)
			sdata[i] = psq->data[psq->front++];
		else
		{
			memcpy(sdata, psq->data+((psq->front++)*psq->type_size), psq->type_size);
			sdata += psq->type_size;
		}
		
		psq->front %= psq->size;
	}
	return len;
}

uint8_t inline static_queue_is_full(StaticQueue* psq)
{
	return (psq->front==((psq->rear+1)%psq->size));
}

uint8_t inline static_queue_is_empty(StaticQueue* psq)
{
	return (psq->front==psq->rear);
}

uint32_t inline static_queue_len(StaticQueue* psq)
{
	if(psq->rear>=psq->front)
		return psq->rear-psq->front;
	else 
		return psq->size-(psq->front-psq->rear);
}