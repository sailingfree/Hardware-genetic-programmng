/****************************************************************
*                                                               *
* Copyright 1991-2001 Celoxica Ltd.                             *
* All Rights Reserved                                           *
*                                                               *
* This is "Unpublished Proprietary Source Code" of Celoxica     *
* Ltd ("Celoxica").  The contents of this file may not          *
* be disclosed to third parties not covered by a Celoxica       *
* NDA (Non-Disclosure Agreement) or a Celoxica End User Licence *
* Agreement or other agreement.                                 *
*                                                               *
* In addition, the source code of this file may not be          *
* copied or duplicated in any form without the prior written    *
* authorization of Celoxica.                                    *
*                                                               *
* This code is protected by English and International           *
* copyright laws.  All use of this code is subject to the       *
* End User License Agreement, Non-Disclosure Agreement,         *
* or other agreement in effect with Celoxica.  If a             *
* licence document or agreement is not included with this       *
* source code please contact Celoxica immediately for a copy of *
* the applicable licence agreement.                             *
*                                                               *
* Any other use of this code other than as expressly agreed     *
* to by Celoxica including decompilation,                       *
* disassembly, or reverse engineering is unauthorised.          *
*                                                               *
* Rights of confidence, trademark rights, and other             *
* intellectual property rights reserved under the laws of       *
* England, the United States, and the International             *
* Community.                                                    *
*                                                               *
* World Wide Headquarters:                                      *
* Celoxica Limited                                              *
* 20 Park Gate                                                  *
* Abingdon                                                      *
* Oxfordshire                                                   *
* United Kingdom                                                *
* OX14 4SH                                                      *
* Tel:   +44 1235 863656                                        *
* Fax:   +44 1235 863648                                        *
*                                                               *
* US Headquarters:                                              *
* Celoxica Inc                                                  *
* 900 East Hamilton Ave.                                        *
* Suite 150                                                     *
* Campbell, CA 95008                                            *
* Tel: 1-408-626-9070                                           *
* Fax: 1-408-626-9079                                           *
*                                                               *
* Email     :   support@celoxica.com                            *
*                                                               *
*****************************************************************
* Project   :   RC1000-PP                                       *
* Date      :   05/11/98                                        *
* File      :   pp1000.h                                        *
* Author    :   Matthew Bowen                                   *
*                                                               *
* Date      Version     Author      Reason for change           *
* 05/11/98  0.98        MB          Created                     *
* 11/06/99  1.00        MB          First full release          *
* 16/08/99  1.02        MB          Virtex device support added *
* 01/11/99  1.10        MB          SelectMap support added     *
* 01/06/00  1.11        JN          Virtex E device support     *
*                                                               *
* Description                                                   *
* Main file for static library to support RC1000-PP PCI/FPGA    *
* accelerator card.                                             *
*                                                               *
****************************************************************/


#ifndef PP1000_H
#define PP1000_H

/*
 * Base value for error status codes
 */
#define PP1000_STATUS_ERROR_CODE  (0x1000)

/*
 * Status and error codes
 */
typedef enum 
{
    PP1000_SUCCESS              = 0,

    PP1000_NO_DRIVER            = PP1000_STATUS_ERROR_CODE,
    PP1000_INTERNAL_ERROR,
    PP1000_NO_MEMORY,
    PP1000_NULL_POINTER,
    PP1000_INVALID_CARDID,
    PP1000_NO_FREE_CARDS,
    PP1000_INVALID_HANDLE,
    PP1000_FILE_NOT_FOUND,
    PP1000_FILE_ACCESS_ERROR,
    PP1000_INVALID_FILE,
    PP1000_INVALID_PART_TYPE,
    PP1000_INVALID_CLOCK_RATE,
    PP1000_FPGA_MISMATCH,
    PP1000_INVALID_IMAGE,
    PP1000_TIMEOUT,
    PP1000_INVALID_CLOCK,
    PP1000_CARD_BUSY,
    PP1000_INVALID_ALIGNMENT,
    PP1000_INVALID_ADDRESS_SPACE,
    PP1000_INVALID_DIRECTION,
    PP1000_INVALID_CHANNEL,
    PP1000_LOCK_FAILED,
    PP1000_INVALID_ARGUMENT,
    PP1000_CANCELLED,
    PP1000_INVALID_BOARD_REVISION,
    PP1000_INTERNAL_ERROR_1,
    PP1000_INTERNAL_ERROR_2,
    PP1000_INTERNAL_ERROR_3,
    PP1000_INTERNAL_ERROR_4
} PP1000_STATUS;

#define PP1000_IS_ERROR(Status) ((Status) >= PP1000_STATUS_ERROR_CODE)

/*
 * A value to indicate which card
 */
typedef unsigned long PP1000_DEVICE_NUM;

/*
 * Handle of a card
 */
typedef void *PP1000_HANDLE;

/*
 * Masks for memory bank request and grant lines
 */
#define PP1000_RAM_REQ0    (1<<0)
#define PP1000_RAM_REQ1    (1<<1)
#define PP1000_RAM_REQ2    (1<<2)
#define PP1000_RAM_REQ3    (1<<3)
#define PP1000_RAM_GNT0    (1<<4)
#define PP1000_RAM_GNT1    (1<<5)
#define PP1000_RAM_GNT2    (1<<6)
#define PP1000_RAM_GNT3    (1<<7)

/*
 * DMA channel handle
 */
typedef void *PP1000_CHANNEL;

/*
 * DMA memory space options
 */
typedef enum
{
    PP1000_VIRTUAL,
    PP1000_PHYSICAL
} PP1000_MEMORY_SPACE;

/*
 * DMA direction options
 */
typedef enum
{
    PP1000_PCI2LOCAL,
    PP1000_LOCAL2PCI
} PP1000_DMA_DIRECTION;

/*
 * Clock selections
 */
typedef enum
{
  PP1000_MCLK,
  PP1000_VCLK
} PP1000_CLOCK;

/*
 * Error handler function type
 */
typedef void (*PP1000_HANDLER_FUNCTION)(char *FnName, PP1000_STATUS Status);

/*
 * FPGA Image file
 */
typedef void * PP1000_IMAGE;

/*
 * FPGA Type
 */
typedef enum
{
    PP1000_FPGA_4085XL,     // 0
    PP1000_FPGA_40150XV,    // 1    
    PP1000_FPGA_40200XV,    // 2
    PP1000_FPGA_40250XV,    // 3
    PP1000_FPGA_V1000,      // 4
    PP1000_FPGA_V400,       // 5
    PP1000_FPGA_V600,       // 6
    PP1000_FPGA_V800,       // 7
    PP1000_FPGA_V1000E,     // 8
    PP1000_FPGA_V1600E,     // 9
	PP1000_FPGA_V2000E,     // 10
    PP1000_FPGA_V405E,     // 11
    PP1000_FPGA_V812E,     // 12
    PP1000_FPGA_UNKNOWN
} PP1000_FPGA_TYPE;

/*
 * Card information structure
 */
typedef struct
{
    PP1000_DEVICE_NUM   CardID;
    unsigned long       PMC1Fitted;
    unsigned long       PMC2Fitted;
    unsigned long       RAMBankFitted[4];
    unsigned long       RAMBankSpace[4];
    PP1000_FPGA_TYPE    FPGAType;
    unsigned long       PhysicalMemoryBase;
    unsigned long      *MemoryBase;
    unsigned long       BoardRevision;
    unsigned long       LogicRevision;
    unsigned long       SerialNum;
    unsigned long       Timeout;
} PP1000_CARD_INFO;

/*
 * Structure for counting number of cards
 */
typedef struct
{
    PP1000_DEVICE_NUM   CardID;
    unsigned long       Count;
} PP1000_DEVICE_COUNT;

/*
 * Infinite timeout length
 */
#define PP1000_TIMEOUT_INFINITE 0xffffffff

/*
 * Function prototypes
 */
#ifdef __cplusplus
extern "C"{
#endif

PP1000_STATUS PP1000GetCards( unsigned long *NumCards,
                              PP1000_DEVICE_COUNT **CardIDs );

PP1000_STATUS PP1000OpenCard( PP1000_DEVICE_NUM CardID,
                              PP1000_HANDLE *Card );
PP1000_STATUS PP1000OpenFirstCard( PP1000_HANDLE *Card );
PP1000_STATUS PP1000CloseCard( PP1000_HANDLE Card );

PP1000_STATUS PP1000GetCardInfo( PP1000_HANDLE Card,
                                 PP1000_CARD_INFO *Info );

PP1000_STATUS PP1000RequestMemoryBank( PP1000_HANDLE Card,
                                       short Mask );
PP1000_STATUS PP1000ReleaseMemoryBank( PP1000_HANDLE Card,
                                       short Mask );
PP1000_STATUS PP1000GetBankStatus( PP1000_HANDLE Card,
                                   short *MaskHost,
                                   short *MaskFPGA );

PP1000_STATUS PP1000SetClockRate( PP1000_HANDLE Card,
                                  PP1000_CLOCK Clock,
                                  double Rate );  
PP1000_STATUS PP1000StopVClock( PP1000_HANDLE Card );
PP1000_STATUS PP1000StepVClock( PP1000_HANDLE Card );
PP1000_STATUS PP1000StartVClock( PP1000_HANDLE Card );
PP1000_STATUS PP1000ReadBack( PP1000_HANDLE Card,
                              void *Buffer,
                              unsigned long BufferLength );

PP1000_STATUS PP1000SetTimeout( PP1000_HANDLE Card,
                                unsigned long Time );

PP1000_STATUS PP1000ResetFPGA( PP1000_HANDLE Card );

PP1000_STATUS PP1000ConfigureFromFile( PP1000_HANDLE Card,
                                       char *FileName );
PP1000_STATUS PP1000LoadFile( char *FileName,
                              PP1000_IMAGE *Image );
PP1000_STATUS PP1000RegisterImage( unsigned char *Buffer,
                                   unsigned long BufferLength,
                                   PP1000_IMAGE *Image );
PP1000_STATUS PP1000LockImage( PP1000_HANDLE Card,
                               PP1000_IMAGE Image,
                               PP1000_CHANNEL *Channel );
PP1000_STATUS PP1000ConfigureFPGA( PP1000_HANDLE Card,
                                   PP1000_IMAGE Image );
PP1000_STATUS PP1000FreeImage( PP1000_IMAGE Image );

PP1000_STATUS PP1000SetGPO( PP1000_HANDLE Card,
                            unsigned long Value );
PP1000_STATUS PP1000ReadGPI( PP1000_HANDLE Card,
                             unsigned long *Value );

PP1000_STATUS PP1000WriteControl( PP1000_HANDLE Card,
                                  unsigned char Control );
PP1000_STATUS PP1000ReadStatus( PP1000_HANDLE Card,
                                unsigned char *Status );

PP1000_STATUS PP1000SetupDMAChannel( PP1000_HANDLE Card,
                                     void *HostAddress,
                                     unsigned long CardOffset,
                                     unsigned long Length,
                                     PP1000_DMA_DIRECTION Direction,
                                     PP1000_CHANNEL *Channel );
PP1000_STATUS PP1000Setup2DDMAChannel( PP1000_HANDLE Card,
                                       void *HostAddress,
                                       unsigned long HostPitch,
                                       PP1000_MEMORY_SPACE HostSpace,
                                       unsigned long CardOffset,
                                       unsigned long CardPitch,
                                       unsigned long Width,
                                       unsigned long Height,
                                       PP1000_DMA_DIRECTION Direction,
                                       PP1000_CHANNEL *Channel );
PP1000_STATUS PP1000SetupSelectMapChannel( PP1000_HANDLE Card,
                                           void *HostAddress,
                                           unsigned long Length,
                                           PP1000_DMA_DIRECTION Direction,
                                           PP1000_CHANNEL *Channel );
PP1000_STATUS PP1000DoDMA( PP1000_CHANNEL Channel );
PP1000_STATUS PP1000CloseDMAChannel( PP1000_CHANNEL Channel );

PP1000_STATUS PP1000InstallErrorHandler(PP1000_HANDLER_FUNCTION Handler);
PP1000_STATUS PP1000StatusToString( PP1000_STATUS Status,
                                    char *String,
                                    unsigned long Length );

#ifdef __cplusplus
} 
#endif

#endif /* PP1000_H */
 
