Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F21A7BFA
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:10:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2731C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:10:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76640C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:10:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED3A9f030564; Tue, 14 Apr 2020 15:10:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=C4Zb1FZpTLaHIltHEtNTJInyJg5HmnJyG8eHmCURiGE=;
 b=CI+v3p8raxOMY4FEUQSNGDjA1AKFp9O9DWm5AUjKLu54HBMeIOpWxw/ZRwrGrsQqHG3J
 kcPnrWGJAkrThG1KUEmNq+00SzF9e1lzsuCM66yyYnp1swQBoIAF3ce82G400GsKnYok
 oKwWpDCSXRRboBRIrGDca339/ZmdcI6viJE1FokN3XzrYfWqY5TGnajNcZ7kBcQDjFtL
 rl4QeSXD6TIjjVN8K/Kjq2t6MdDnYkxTxE9qXB1YL7mVdtYcObUKVE/aaz3+756MzIrQ
 GOJMwdh2DMcGKn9kFXDgMf8hsN2Mr4wZl1JYvJ7ehfTD5TyZjl8dSzs3QS+yyAWCD3VW Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5stdu4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:10:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F21E100034;
 Tue, 14 Apr 2020 15:10:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 840102BC7A7;
 Tue, 14 Apr 2020 15:10:25 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:10:25 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:10:25 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 15/18] stm32mp: stm32prog: add serial link support
Thread-Index: AQHV/P7D7W27EnBVpk+oIZNZLSXueah4oJkA
Date: Tue, 14 Apr 2020 13:10:25 +0000
Message-ID: <d61f50be-bb3b-bdcd-c65c-95195779190c@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-16-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-16-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <CC0DE37CF548C341AD6FE9C57CA9BE21@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 15/18] stm32mp: stm32prog: add serial link
	support
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi

On 3/18/20 9:25 AM, Patrick Delaunay wrote:
> Add a support of UART, using the same protocol than MCU STM32.
>
> See "AN5275: USB DFU/USART protocols used in STM32MP1 Series
> bootloaders" for details.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/cmd_stm32prog/Makefile  |   1 +
>  .../cmd_stm32prog/cmd_stm32prog.c             |  11 +-
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |   4 +
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  11 +
>  .../cmd_stm32prog/stm32prog_serial.c          | 993 ++++++++++++++++++
>  .../cmd_stm32prog/stm32prog_usb.c             |   2 +
>  6 files changed, 1021 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/Makefile b/arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
> index 14f722759c..548a378921 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
> @@ -5,4 +5,5 @@
>  
>  obj-y += cmd_stm32prog.o
>  obj-y += stm32prog.o
> +obj-y += stm32prog_serial.o
>  obj-y += stm32prog_usb.o
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index 581f97e0b5..1769ba05f2 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -25,11 +25,14 @@ static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
>  
>  	if (!strcmp(argv[1], "usb"))
>  		link = LINK_USB;
> +	else if (!strcmp(argv[1], "serial"))
> +		link = LINK_SERIAL;
>  
>  	if (link == LINK_UNDEFINED) {
>  		pr_err("not supported link=%s\n", argv[1]);
>  		return CMD_RET_USAGE;
>  	}
> +
>  	dev = (int)simple_strtoul(argv[2], NULL, 10);
>  
>  	addr = STM32_DDR_BASE;
> @@ -60,6 +63,12 @@ static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
>  		goto cleanup;
>  
>  	switch (link) {
> +	case LINK_SERIAL:
> +		ret = stm32prog_serial_init(data, dev);
> +		if (ret)
> +			goto cleanup;
> +		reset = stm32prog_serial_loop(data);
> +		break;
>  	case LINK_USB:
>  		reset = stm32prog_usb_loop(data, dev);
>  		break;
> @@ -90,7 +99,7 @@ cleanup:
>  U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
>  	   "<link> <dev> [<addr>] [<size>]\n"
>  	   "start communication with tools STM32Cubeprogrammer on <link> with Flashlayout at <addr>",
> -	   "<link> = usb\n"
> +	   "<link> = serial|usb\n"
>  	   "<dev>  = device instance\n"
>  	   "<addr> = address of flashlayout\n"
>  	   "<size> = size of flashlayout\n"
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index d127afefaa..0967bbc11a 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -1486,6 +1486,7 @@ void stm32prog_next_phase(struct stm32prog_data *data)
>  	}
>  
>  	/* found next selected partition */
> +	data->dfu_seq = 0;
>  	data->cur_part = NULL;
>  	data->phase = PHASE_END;
>  	found = false;
> @@ -1653,6 +1654,7 @@ int stm32prog_dfu_init(struct stm32prog_data *data)
>  int stm32prog_init(struct stm32prog_data *data, ulong addr, ulong size)
>  {
>  	memset(data, 0x0, sizeof(*data));
> +	data->read_phase = PHASE_RESET;
>  	data->phase = PHASE_FLASHLAYOUT;
>  
>  	return parse_flash_layout(data, addr, size);
> @@ -1664,6 +1666,7 @@ void stm32prog_clean(struct stm32prog_data *data)
>  	dfu_free_entities();
>  	free(data->part_array);
>  	free(data->otp_part);
> +	free(data->buffer);
>  	free(data->header_data);
>  }
>  
> @@ -1709,6 +1712,7 @@ void dfu_initiated_callback(struct dfu_entity *dfu)
>  	/* force the saved offset for the current partition */
>  	if (dfu->alt == stm32prog_data->cur_part->alt_id) {
>  		dfu->offset = stm32prog_data->offset;
> +		stm32prog_data->dfu_seq = 0;
>  		pr_debug("dfu offset = 0x%llx\n", dfu->offset);
>  	}
>  }
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 83b27980f5..c4fdb5b8c3 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -31,6 +31,7 @@ enum stm32prog_target {
>  };
>  
>  enum stm32prog_link_t {
> +	LINK_SERIAL,
>  	LINK_USB,
>  	LINK_UNDEFINED,
>  };
> @@ -127,6 +128,14 @@ struct stm32prog_data {
>  	/* STM32 header information */
>  	struct raw_header_s	*header_data;
>  	struct image_header_s	header;
> +
> +	/* SERIAL information */
> +	u32	cursor;
> +	u32	packet_number;
> +	u32	checksum;
> +	u8	*buffer; /* size = USART_RAM_BUFFER_SIZE*/
> +	int	dfu_seq;
> +	u8	read_phase;
>  };
>  
>  extern struct stm32prog_data *stm32prog_data;
> @@ -163,6 +172,8 @@ char *stm32prog_get_error(struct stm32prog_data *data);
>  
>  /* Main function */
>  int stm32prog_init(struct stm32prog_data *data, ulong addr, ulong size);
> +int stm32prog_serial_init(struct stm32prog_data *data, int link_dev);
> +bool stm32prog_serial_loop(struct stm32prog_data *data);
>  bool stm32prog_usb_loop(struct stm32prog_data *data, int dev);
>  void stm32prog_clean(struct stm32prog_data *data);
>  
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> new file mode 100644
> index 0000000000..5a16979adc
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> @@ -0,0 +1,993 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <common.h>
> +#include <console.h>
> +#include <dfu.h>
> +#include <malloc.h>
> +#include <serial.h>
> +#include <watchdog.h>
> +#include <dm/lists.h>
> +#include <dm/device-internal.h>
> +#include "stm32prog.h"
> +
> +/* - configuration part -----------------------------*/
> +#define USART_BL_VERSION	0x40	/* USART bootloader version V4.0*/
> +#define UBOOT_BL_VERSION	0x03	/* bootloader version V0.3*/
> +#define DEVICE_ID_BYTE1		0x05	/* MSB byte of device ID*/
> +#define DEVICE_ID_BYTE2		0x00	/* LSB byte of device ID*/
> +#define USART_RAM_BUFFER_SIZE	256	/* Size of USART_RAM_Buf buffer*/
> +
> +/* - Commands -----------------------------*/
> +#define GET_CMD_COMMAND		0x00	/* Get CMD command*/
> +#define GET_VER_COMMAND		0x01	/* Get Version command*/
> +#define GET_ID_COMMAND		0x02	/* Get ID command*/
> +#define GET_PHASE_COMMAND	0x03	/* Get Phase command*/
> +#define RM_COMMAND		0x11	/* Read Memory command*/
> +#define READ_PART_COMMAND	0x12	/* Read Partition command*/
> +#define START_COMMAND		0x21	/* START command (Go)*/
> +#define DOWNLOAD_COMMAND	0x31	/* Download command*/
> +/* existing command for other STM32 but not used */
> +/* ERASE			0x43 */
> +/* EXTENDED_ERASE		0x44 */
> +/* WRITE_UNPROTECTED		0x73 */
> +/* READOUT_PROTECT		0x82 */
> +/* READOUT_UNPROTECT		0x92 */
> +
> +/* - miscellaneous defines ----------------------------------------*/
> +#define INIT_BYTE		0x7F	/*Init Byte ID*/
> +#define ACK_BYTE		0x79	/*Acknowlede Byte ID*/
> +#define NACK_BYTE		0x1F	/*No Acknowlede Byte ID*/
> +#define ABORT_BYTE		0x5F	/*ABORT*/
> +
> +struct udevice *down_serial_dev;
> +
> +const u8 cmd_id[] = {
> +	GET_CMD_COMMAND,
> +	GET_VER_COMMAND,
> +	GET_ID_COMMAND,
> +	GET_PHASE_COMMAND,
> +	RM_COMMAND,
> +	READ_PART_COMMAND,
> +	START_COMMAND,
> +	DOWNLOAD_COMMAND
> +};
> +
> +#define NB_CMD sizeof(cmd_id)
> +
> +/* DFU support for serial *********************************************/
> +static struct dfu_entity *stm32prog_get_entity(struct stm32prog_data *data)
> +{
> +	int alt_id;
> +
> +	if (!data->cur_part)
> +		if (data->phase == PHASE_FLASHLAYOUT)
> +			alt_id = 0;
> +		else
> +			return NULL;
> +	else
> +		alt_id = data->cur_part->alt_id;
> +
> +	return dfu_get_entity(alt_id);
> +}
> +
> +static int stm32prog_write(struct stm32prog_data *data, u8 *buffer,
> +			   u32 buffer_size)
> +{
> +	struct dfu_entity *dfu_entity;
> +	u8 ret = 0;
> +
> +	dfu_entity = stm32prog_get_entity(data);
> +	if (!dfu_entity)
> +		return -ENODEV;
> +
> +	ret = dfu_write(dfu_entity,
> +			buffer,
> +			buffer_size,
> +			data->dfu_seq);
> +
> +	if (ret) {
> +		stm32prog_err("DFU write failed [%d] cnt: %d",
> +			      ret, data->dfu_seq);
> +	}
> +	data->dfu_seq++;
> +	/* handle rollover as in driver/dfu/dfu.c */
> +	data->dfu_seq &= 0xffff;
> +	if (buffer_size == 0)
> +		data->dfu_seq = 0; /* flush done */
> +
> +	return ret;
> +}
> +
> +static int stm32prog_read(struct stm32prog_data *data, u8 phase, u32 offset,
> +			  u8 *buffer, u32 buffer_size)
> +{
> +	struct dfu_entity *dfu_entity;
> +	struct stm32prog_part_t *part;
> +	u32 size;
> +	int ret, i;
> +
> +	if (data->dfu_seq) {
> +		stm32prog_err("DFU write pending for phase %d, seq %d",
> +			      data->phase, data->dfu_seq);
> +		return -EINVAL;
> +	}
> +	if (phase == PHASE_FLASHLAYOUT || phase > PHASE_LAST_USER) {
> +		stm32prog_err("read failed : phase %d is invalid", phase);
> +		return -EINVAL;
> +	}
> +	if (data->read_phase <= PHASE_LAST_USER &&
> +	    phase != data->read_phase) {
> +		/* clear previous read session */
> +		dfu_entity = dfu_get_entity(data->read_phase - 1);
> +		if (dfu_entity)
> +			dfu_transaction_cleanup(dfu_entity);
> +	}
> +
> +	dfu_entity = NULL;
> +	/* found partition for the expected phase */
> +	for (i = 0; i < data->part_nb; i++) {
> +		part = &data->part_array[i];
> +		if (part->id == phase)
> +			dfu_entity = dfu_get_entity(part->alt_id);
> +	}
> +	if (!dfu_entity) {
> +		stm32prog_err("read failed : phase %d is unknown", phase);
> +		return -ENODEV;
> +	}
> +
> +	/* clear pending read before to force offset */
> +	if (dfu_entity->inited &&
> +	    (data->read_phase != phase || data->offset != offset))
> +		dfu_transaction_cleanup(dfu_entity);
> +
> +	/* initiate before to force offset */
> +	if (!dfu_entity->inited) {
> +		ret = dfu_transaction_initiate(dfu_entity, true);
> +			if (ret < 0) {
> +				stm32prog_err("DFU read init failed [%d] phase = %d offset = 0x%08x",
> +					      ret, phase, offset);
> +			return ret;
> +		}
> +	}
> +	/* force new offset */
> +	if (dfu_entity->offset != offset)
> +		dfu_entity->offset = offset;
> +	data->offset = offset;
> +	data->read_phase = phase;
> +	pr_debug("\nSTM32 download read %s offset=0x%x\n",
> +		 dfu_entity->name, offset);
> +	ret = dfu_read(dfu_entity, buffer, buffer_size,
> +		       dfu_entity->i_blk_seq_num);
> +	if (ret < 0) {
> +		stm32prog_err("DFU read failed [%d] phase = %d offset = 0x%08x",
> +			      ret, phase, offset);
> +		return ret;
> +	}
> +
> +	size = ret;
> +
> +	if (size < buffer_size) {
> +		data->offset = 0;
> +		data->read_phase = PHASE_END;
> +		memset(buffer + size, 0, buffer_size - size);
> +	} else {
> +		data->offset += size;
> +	}
> +
> +	return ret;
> +}
> +
> +/* UART access ***************************************************/
> +int stm32prog_serial_init(struct stm32prog_data *data, int link_dev)
> +{
> +	struct udevice *dev = NULL;
> +	int node;
> +	char alias[10];
> +	const char *path;
> +	struct dm_serial_ops *ops;
> +	/* no parity, 8 bits, 1 stop */
> +	u32 serial_config = SERIAL_DEFAULT_CONFIG;
> +
> +	down_serial_dev = NULL;
> +
> +	sprintf(alias, "serial%d", link_dev);
> +	path = fdt_get_alias(gd->fdt_blob, alias);
> +	if (!path) {
> +		pr_err("%s alias not found", alias);
> +		return -ENODEV;
> +	}
> +	node = fdt_path_offset(gd->fdt_blob, path);
> +	if (!uclass_get_device_by_of_offset(UCLASS_SERIAL, node,
> +					    &dev)) {
> +		down_serial_dev = dev;
> +	} else if (node > 0 &&
> +		   !lists_bind_fdt(gd->dm_root, offset_to_ofnode(node),
> +				   &dev, false)) {
> +		if (!device_probe(dev))
> +			down_serial_dev = dev;
> +	}
> +	if (!down_serial_dev) {
> +		pr_err("%s = %s device not found", alias, path);
> +		return -ENODEV;
> +	}
> +
> +	/* force silent console on uart only when used */
> +	if (gd->cur_serial_dev == down_serial_dev)
> +		gd->flags |= GD_FLG_DISABLE_CONSOLE | GD_FLG_SILENT;
> +	else
> +		gd->flags &= ~(GD_FLG_DISABLE_CONSOLE | GD_FLG_SILENT);
> +
> +	ops = serial_get_ops(down_serial_dev);
> +
> +	if (!ops) {
> +		pr_err("%s = %s missing ops", alias, path);
> +		return -ENODEV;
> +	}
> +	if (!ops->setconfig) {
> +		pr_err("%s = %s missing setconfig", alias, path);
> +		return -ENODEV;
> +	}
> +
> +	clrsetbits_le32(&serial_config, SERIAL_PAR_MASK, SERIAL_PAR_EVEN);
> +
> +	data->buffer = memalign(CONFIG_SYS_CACHELINE_SIZE,
> +				USART_RAM_BUFFER_SIZE);
> +
> +	return ops->setconfig(down_serial_dev, serial_config);
> +}
> +
> +static void stm32prog_serial_flush(void)
> +{
> +	struct dm_serial_ops *ops = serial_get_ops(down_serial_dev);
> +	int err;
> +
> +	do {
> +		err = ops->getc(down_serial_dev);
> +	} while (err != -EAGAIN);
> +}
> +
> +static int stm32prog_serial_getc_err(void)
> +{
> +	struct dm_serial_ops *ops = serial_get_ops(down_serial_dev);
> +	int err;
> +
> +	do {
> +		err = ops->getc(down_serial_dev);
> +		if (err == -EAGAIN) {
> +			ctrlc();
> +			WATCHDOG_RESET();
> +		}
> +	} while ((err == -EAGAIN) && (!had_ctrlc()));
> +
> +	return err;
> +}
> +
> +static u8 stm32prog_serial_getc(void)
> +{
> +	int err;
> +
> +	err = stm32prog_serial_getc_err();
> +
> +	return err >= 0 ? err : 0;
> +}
> +
> +static bool stm32prog_serial_get_buffer(u8 *buffer, u32 *count)
> +{
> +	struct dm_serial_ops *ops = serial_get_ops(down_serial_dev);
> +	int err;
> +
> +	do {
> +		err = ops->getc(down_serial_dev);
> +		if (err >= 0) {
> +			*buffer++ = err;
> +			*count -= 1;
> +		} else if (err == -EAGAIN) {
> +			ctrlc();
> +			WATCHDOG_RESET();
> +		} else {
> +			break;
> +		}
> +	} while (*count && !had_ctrlc());
> +
> +	return !!(err < 0);
> +}
> +
> +static void stm32prog_serial_putc(u8 w_byte)
> +{
> +	struct dm_serial_ops *ops = serial_get_ops(down_serial_dev);
> +	int err;
> +
> +	do {
> +		err = ops->putc(down_serial_dev, w_byte);
> +	} while (err == -EAGAIN);
> +}
> +
> +/* Helper function ************************************************/
> +
> +static u8 stm32prog_header(struct stm32prog_data *data)
> +{
> +	u8 ret;
> +	u8 boot = 0;
> +	struct dfu_entity *dfu_entity;
> +	u64 size = 0;
> +
> +	dfu_entity = stm32prog_get_entity(data);
> +	if (!dfu_entity)
> +		return -ENODEV;
> +
> +	printf("\nSTM32 download write %s\n", dfu_entity->name);
> +
> +	/* force cleanup to avoid issue with previous read */
> +	dfu_transaction_cleanup(dfu_entity);
> +
> +	ret = stm32prog_header_check(data->header_data,
> +				     &data->header);
> +
> +	/* no header : max size is partition size */
> +	if (ret) {
> +		dfu_entity->get_medium_size(dfu_entity, &size);
> +		data->header.image_length = size;
> +	}
> +
> +	/**** Flash the header if necessary for boot partition */
> +	if (data->phase < PHASE_FIRST_USER)
> +		boot = 1;
> +
> +	/* write header if boot partition */
> +	if (boot) {
> +		if (ret) {
> +			stm32prog_err("invalid header (error %d)", ret);
> +		} else {
> +			ret = stm32prog_write(data,
> +					      (u8 *)data->header_data,
> +					      BL_HEADER_SIZE);
> +		}
> +	} else {
> +		if (ret)
> +			printf("  partition without checksum\n");
> +		ret = 0;
> +	}
> +
> +	free(data->header_data);
> +	data->header_data = NULL;
> +
> +	return ret;
> +}
> +
> +static u8 stm32prog_start(struct stm32prog_data *data, u32 address)
> +{
> +	u8 ret = 0;
> +	struct dfu_entity *dfu_entity;
> +
> +	if (address < 0x100) {
> +		if (address == PHASE_OTP)
> +			return stm32prog_otp_start(data);
> +
> +		if (address == PHASE_PMIC)
> +			return stm32prog_pmic_start(data);
> +
> +		if (address == PHASE_RESET || address == PHASE_END) {
> +			data->cur_part = NULL;
> +			data->dfu_seq = 0;
> +			data->phase = address;
> +			return 0;
> +		}
> +		if (address != data->phase) {
> +			stm32prog_err("invalid received phase id %d, current phase is %d",
> +				      (u8)address, (u8)data->phase);
> +			return -EINVAL;
> +		}
> +	}
> +	/* check the last loaded partition */
> +	if (address == DEFAULT_ADDRESS || address == data->phase) {
> +		switch (data->phase) {
> +		case PHASE_END:
> +		case PHASE_RESET:
> +		case PHASE_DO_RESET:
> +			data->cur_part = NULL;
> +			data->phase = PHASE_DO_RESET;
> +			return 0;
> +		}
> +		dfu_entity = stm32prog_get_entity(data);
> +		if (!dfu_entity)
> +			return -ENODEV;
> +
> +		if (data->dfu_seq) {
> +			ret = dfu_flush(dfu_entity, NULL, 0, data->dfu_seq);
> +			data->dfu_seq = 0;
> +			if (ret) {
> +				stm32prog_err("DFU flush failed [%d]", ret);
> +				return ret;
> +			}
> +		}
> +		printf("\n  received length = 0x%x\n", data->cursor);
> +		if (data->header.present) {
> +			if (data->cursor !=
> +			    (data->header.image_length + BL_HEADER_SIZE)) {
> +				stm32prog_err("transmission interrupted (length=0x%x expected=0x%x)",
> +					      data->cursor,
> +					      data->header.image_length +
> +					      BL_HEADER_SIZE);
> +				return -EIO;
> +			}
> +			if (data->header.image_checksum != data->checksum) {
> +				stm32prog_err("invalid checksum received (0x%x expected 0x%x)",
> +					      data->checksum,
> +					      data->header.image_checksum);
> +				return -EIO;
> +			}
> +			printf("\n  checksum OK (0x%x)\n", data->checksum);
> +		}
> +
> +		/* update DFU with received flashlayout */
> +		if (data->phase == PHASE_FLASHLAYOUT)
> +			stm32prog_dfu_init(data);
> +	} else {
> +		void (*entry)(void) = (void *)address;
> +
> +		printf("## Starting application at 0x%x ...\n", address);
> +		(*entry)();
> +		printf("## Application terminated\n");
> +		ret = -ENOEXEC;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * get_address() - Get address if it is valid
> + *
> + * @tmp_xor:		Current xor value to update
> + * @return The address area
> + */
> +static u32 get_address(u8 *tmp_xor)
> +{
> +	u32 address = 0x0;
> +	u8 data;
> +
> +	data = stm32prog_serial_getc();
> +	*tmp_xor ^= data;
> +	address |= ((u32)data) << 24;
> +
> +	data = stm32prog_serial_getc();
> +	address |= ((u32)data) << 16;
> +	*tmp_xor ^= data;
> +
> +	data = stm32prog_serial_getc();
> +	address |= ((u32)data) << 8;
> +	*tmp_xor ^= data;
> +
> +	data = stm32prog_serial_getc();
> +	address |= ((u32)data);
> +	*tmp_xor ^= data;
> +
> +	return address;
> +}
> +
> +static void stm32prog_serial_result(u8 result)
> +{
> +	/* always flush fifo before to send result */
> +	stm32prog_serial_flush();
> +	stm32prog_serial_putc(result);
> +}
> +
> +/* Command -----------------------------------------------*/
> +/**
> + * get_cmd_command() - Respond to Get command
> + *
> + * @data:		Current command context
> + */
> +static void get_cmd_command(struct stm32prog_data *data)
> +{
> +	u32 counter = 0x0;
> +
> +	stm32prog_serial_putc(NB_CMD);
> +	stm32prog_serial_putc(USART_BL_VERSION);
> +
> +	for (counter = 0; counter < NB_CMD; counter++)
> +		stm32prog_serial_putc(cmd_id[counter]);
> +
> +	stm32prog_serial_result(ACK_BYTE);
> +}
> +
> +/**
> + * get_version_command() - Respond to Get Version command
> + *
> + * @data:		Current command context
> + */
> +static void get_version_command(struct stm32prog_data *data)
> +{
> +	stm32prog_serial_putc(UBOOT_BL_VERSION);
> +	stm32prog_serial_result(ACK_BYTE);
> +}
> +
> +/**
> + * get_id_command() - Respond to Get ID command
> + *
> + * @data:		Current command context
> + */
> +static void get_id_command(struct stm32prog_data *data)
> +{
> +	/* Send Device IDCode */
> +	stm32prog_serial_putc(0x1);
> +	stm32prog_serial_putc(DEVICE_ID_BYTE1);
> +	stm32prog_serial_putc(DEVICE_ID_BYTE2);
> +	stm32prog_serial_result(ACK_BYTE);
> +}
> +
> +/**
> + * get_phase_command() - Respond to Get phase
> + *
> + * @data:		Current command context
> + */
> +static void get_phase_command(struct stm32prog_data *data)
> +{
> +	char *err_msg = NULL;
> +	u8 i, length = 0;
> +	u32 destination = DEFAULT_ADDRESS; /* destination address */
> +	int phase = data->phase;
> +
> +	if (phase == PHASE_RESET || phase == PHASE_DO_RESET) {
> +		err_msg = stm32prog_get_error(data);
> +		length = strlen(err_msg);
> +	}
> +	if (phase == PHASE_FLASHLAYOUT)
> +		destination = STM32_DDR_BASE;
> +
> +	stm32prog_serial_putc(length + 5);           /* Total length */
> +	stm32prog_serial_putc(phase & 0xFF);         /* partition ID */
> +	stm32prog_serial_putc(destination);          /* byte 1 of address */
> +	stm32prog_serial_putc(destination >> 8);     /* byte 2 of address */
> +	stm32prog_serial_putc(destination >> 16);    /* byte 3 of address */
> +	stm32prog_serial_putc(destination >> 24);    /* byte 4 of address */
> +
> +	stm32prog_serial_putc(length);               /* Information length */
> +	for (i = 0; i < length; i++)
> +		stm32prog_serial_putc(err_msg[i]);
> +	stm32prog_serial_result(ACK_BYTE);
> +
> +	if (phase == PHASE_RESET)
> +		stm32prog_do_reset(data);
> +}
> +
> +/**
> + * read_memory_command() - Read data from memory
> + *
> + * @data:		Current command context
> + */
> +static void read_memory_command(struct stm32prog_data *data)
> +{
> +	u32 address = 0x0;
> +	u8 rcv_data = 0x0, tmp_xor = 0x0;
> +	u32 counter = 0x0;
> +
> +	/* Read memory address */
> +	address = get_address(&tmp_xor);
> +
> +	/* If address memory is not received correctly */
> +	rcv_data = stm32prog_serial_getc();
> +	if (rcv_data != tmp_xor) {
> +		stm32prog_serial_result(NACK_BYTE);
> +		return;
> +	}
> +
> +	stm32prog_serial_result(ACK_BYTE);
> +
> +	/* Read the number of bytes to be received:
> +	 * Max NbrOfData = Data + 1 = 256
> +	 */
> +	rcv_data = stm32prog_serial_getc();
> +	tmp_xor = ~rcv_data;
> +	if (stm32prog_serial_getc() != tmp_xor) {
> +		stm32prog_serial_result(NACK_BYTE);
> +		return;
> +	}
> +
> +	/* If checksum is correct send ACK */
> +	stm32prog_serial_result(ACK_BYTE);
> +
> +	/* Send data to the host:
> +	 * Number of data to read = data + 1
> +	 */
> +	for (counter = (rcv_data + 1); counter != 0; counter--)
> +		stm32prog_serial_putc(*(u8 *)(address++));
> +}
> +
> +/**
> + * start_command() - Respond to start command
> + *
> + * Jump to user application in RAM or partition check
> + *
> + * @data:		Current command context
> + */
> +static void start_command(struct stm32prog_data *data)
> +{
> +	u32 address = 0;
> +	u8 tmp_xor = 0x0;
> +	u8 ret, rcv_data;
> +
> +	/* Read memory address */
> +	address = get_address(&tmp_xor);
> +
> +	/* If address memory is not received correctly */
> +	rcv_data = stm32prog_serial_getc();
> +	if (rcv_data != tmp_xor) {
> +		stm32prog_serial_result(NACK_BYTE);
> +		return;
> +	}
> +	/* validate partition */
> +	ret = stm32prog_start(data,
> +			      address);
> +
> +	if (ret)
> +		stm32prog_serial_result(ABORT_BYTE);
> +	else
> +		stm32prog_serial_result(ACK_BYTE);
> +}
> +
> +/**
> + * download_command() - Respond to download command
> + *
> + * Write data to not volatile memory, Flash
> + *
> + * @data:		Current command context
> + */
> +static void download_command(struct stm32prog_data *data)
> +{
> +	u32 address = 0x0;
> +	u8 my_xor = 0x0;
> +	u8 rcv_xor;
> +	u32 counter = 0x0, codesize = 0x0;
> +	u8 *ramaddress = 0;
> +	u8 rcv_data = 0x0;
> +	struct image_header_s *image_header = &data->header;
> +	u32 cursor = data->cursor;
> +	long size = 0;
> +	u8 operation;
> +	u32 packet_number;
> +	u32 result = ACK_BYTE;
> +	u8 ret;
> +	unsigned int i;
> +	bool error;
> +	int rcv;
> +
> +	address = get_address(&my_xor);
> +
> +	/* If address memory is not received correctly */
> +	rcv_xor = stm32prog_serial_getc();
> +	if (rcv_xor != my_xor) {
> +		result = NACK_BYTE;
> +		goto end;
> +	}
> +
> +	/* If address valid send ACK */
> +	stm32prog_serial_result(ACK_BYTE);
> +
> +	/* get packet number and operation type */
> +	operation = (u8)((u32)address >> 24);
> +	packet_number = ((u32)(((u32)address << 8))) >> 8;
> +
> +	switch (operation) {
> +	/* supported operation */
> +	case PHASE_FLASHLAYOUT:
> +	case PHASE_OTP:
> +	case PHASE_PMIC:
> +		break;
> +	default:
> +		result = NACK_BYTE;
> +		goto end;
> +	}
> +	/* check the packet number */
> +	if (packet_number == 0) {
> +		/* erase: re-initialize the image_header struct */
> +		data->packet_number = 0;
> +		if (data->header_data)
> +			memset(data->header_data, 0, BL_HEADER_SIZE);
> +		else
> +			data->header_data = calloc(1, BL_HEADER_SIZE);
> +		cursor = 0;
> +		data->cursor = 0;
> +		data->checksum = 0;
> +		/*idx = cursor;*/
> +	} else {
> +		data->packet_number++;
> +	}
> +
> +	/* Check with the number of current packet if the device receive
> +	 * the true packet
> +	 */
> +	if (packet_number != data->packet_number) {
> +		data->packet_number--;
> +		result = NACK_BYTE;
> +		goto end;
> +	}
> +
> +	/*-- Read number of bytes to be written and data -----------*/
> +
> +	/* Read the number of bytes to be written:
> +	 * Max NbrOfData = data + 1 <= 256
> +	 */
> +	rcv_data = stm32prog_serial_getc();
> +
> +	/* NbrOfData to write = data + 1 */
> +	codesize = rcv_data + 0x01;
> +
> +	if (codesize > USART_RAM_BUFFER_SIZE) {
> +		result = NACK_BYTE;
> +		goto end;
> +	}
> +
> +	/* Checksum Initialization */
> +	my_xor = rcv_data;
> +
> +	/* UART receive data and send to Buffer */
> +	counter = codesize;
> +	error = stm32prog_serial_get_buffer(data->buffer, &counter);
> +
> +	/* read checksum */
> +	if (!error) {
> +		rcv = stm32prog_serial_getc_err();
> +		error = !!(rcv < 0);
> +		rcv_xor = rcv;
> +	}
> +
> +	if (error) {
> +		printf("transmission error on packet %d, byte %d\n",
> +		       packet_number, codesize - counter);
> +		/* waiting end of packet before flush & NACK */
> +		mdelay(30);
> +		data->packet_number--;
> +		result = NACK_BYTE;
> +		goto end;
> +	}
> +
> +	/* Compute Checksum */
> +	ramaddress = data->buffer;
> +	for (counter = codesize; counter != 0; counter--)
> +		my_xor ^= *(ramaddress++);
> +
> +	/* If Checksum is incorrect */
> +	if (rcv_xor != my_xor) {
> +		printf("checksum error on packet %d\n",
> +		       packet_number);
> +		/* wait to be sure that all data are received
> +		 * in the FIFO before flush
> +		 */
> +		mdelay(30);
> +		data->packet_number--;
> +		result = NACK_BYTE;
> +		goto end;
> +	}
> +
> +	/* Update current position in buffer */
> +	data->cursor += codesize;
> +
> +	if (operation == PHASE_OTP) {
> +		size = data->cursor - cursor;
> +		/* no header for OTP */
> +		if (stm32prog_otp_write(data, cursor,
> +					data->buffer, &size))
> +			result = ABORT_BYTE;
> +		goto end;
> +	}
> +
> +	if (operation == PHASE_PMIC) {
> +		size = data->cursor - cursor;
> +		/* no header for PMIC */
> +		if (stm32prog_pmic_write(data, cursor,
> +					 data->buffer, &size))
> +			result = ABORT_BYTE;
> +		goto end;
> +	}
> +
> +	if (cursor < BL_HEADER_SIZE) {
> +		/* size = portion of header in this chunck */
> +		if (data->cursor >= BL_HEADER_SIZE)
> +			size = BL_HEADER_SIZE - cursor;
> +		else
> +			size = data->cursor - cursor;
> +		memcpy((void *)((u32)(data->header_data) + cursor),
> +		       data->buffer, size);
> +		cursor += size;
> +
> +		if (cursor == BL_HEADER_SIZE) {
> +			/* Check and Write the header */
> +			if (stm32prog_header(data)) {
> +				result = ABORT_BYTE;
> +				goto end;
> +			}
> +		} else {
> +			goto end;
> +		}
> +	}
> +
> +	if (image_header->present) {
> +		if (data->cursor <= BL_HEADER_SIZE)
> +			goto end;
> +		/* compute checksum on payload */
> +		for (i = (unsigned long)size; i < codesize; i++)
> +			data->checksum += data->buffer[i];
> +
> +		if (data->cursor >
> +		    image_header->image_length + BL_HEADER_SIZE) {
> +			pr_err("expected size exceeded\n");
> +			result = ABORT_BYTE;
> +			goto end;
> +		}
> +
> +		/* write data (payload) */
> +		ret = stm32prog_write(data,
> +				      &data->buffer[size],
> +				      codesize - size);
> +	} else {
> +		/* write all */
> +		ret = stm32prog_write(data,
> +				      data->buffer,
> +				      codesize);
> +	}
> +	if (ret)
> +		result = ABORT_BYTE;
> +
> +end:
> +	stm32prog_serial_result(result);
> +}
> +
> +/**
> + * read_partition() - Respond to read command
> + *
> + * Read data from not volatile memory, Flash
> + *
> + * @data:		Current command context
> + */
> +static void read_partition_command(struct stm32prog_data *data)
> +{
> +	u32 i, part_id, codesize, offset = 0, rcv_data;
> +	long size;
> +	u8 tmp_xor;
> +	int res;
> +	u8 buffer[256];
> +
> +	part_id = stm32prog_serial_getc();
> +	tmp_xor = part_id;
> +
> +	offset = get_address(&tmp_xor);
> +
> +	rcv_data = stm32prog_serial_getc();
> +	if (rcv_data != tmp_xor) {
> +		pr_debug("1st checksum received = %x, computed %x\n",
> +			 rcv_data, tmp_xor);
> +		goto error;
> +	}
> +	stm32prog_serial_putc(ACK_BYTE);
> +
> +	/* NbrOfData to read = data + 1 */
> +	rcv_data = stm32prog_serial_getc();
> +	codesize = rcv_data + 0x01;
> +	tmp_xor = rcv_data;
> +
> +	rcv_data = stm32prog_serial_getc();
> +	if ((rcv_data ^ tmp_xor) != 0xFF) {
> +		pr_debug("2nd checksum received = %x, computed %x\n",
> +			 rcv_data, tmp_xor);
> +		goto error;
> +	}
> +
> +	pr_debug("%s : %x\n", __func__, part_id);
> +	rcv_data = 0;
> +	switch (part_id) {
> +	case PHASE_OTP:
> +		size = codesize;
> +		if (!stm32prog_otp_read(data, offset, buffer, &size))
> +			rcv_data = size;
> +		break;
> +	case PHASE_PMIC:
> +		size = codesize;
> +		if (!stm32prog_pmic_read(data, offset, buffer, &size))
> +			rcv_data = size;
> +		break;
> +	default:
> +		res = stm32prog_read(data, part_id, offset,
> +				     buffer, codesize);
> +		if (res > 0)
> +			rcv_data = res;
> +		break;
> +	}
> +	if (rcv_data > 0) {
> +		stm32prog_serial_putc(ACK_BYTE);
> +		/*----------- Send data to the host -----------*/
> +		for (i = 0; i < rcv_data; i++)
> +			stm32prog_serial_putc(buffer[i]);
> +		/*----------- Send filler to the host -----------*/
> +		for (; i < codesize; i++)
> +			stm32prog_serial_putc(0x0);
> +		return;
> +	}
> +	stm32prog_serial_result(ABORT_BYTE);
> +	return;
> +
> +error:
> +	stm32prog_serial_result(NACK_BYTE);
> +}
> +
> +/* MAIN function = SERIAL LOOP ***********************************************/
> +
> +/**
> + * stm32prog_serial_loop() - USART bootloader Loop routine
> + *
> + * @data:		Current command context
> + * @return true if reset is needed after loop
> + */
> +bool stm32prog_serial_loop(struct stm32prog_data *data)
> +{
> +	u32 counter = 0x0;
> +	u8 command = 0x0;
> +	u8 found;
> +	int phase = data->phase;
> +
> +	/* element of cmd_func need to aligned with cmd_id[]*/
> +	void (*cmd_func[NB_CMD])(struct stm32prog_data *) = {
> +		/* GET_CMD_COMMAND */	get_cmd_command,
> +		/* GET_VER_COMMAND */	get_version_command,
> +		/* GET_ID_COMMAND */	get_id_command,
> +		/* GET_PHASE_COMMAND */	get_phase_command,
> +		/* RM_COMMAND */	read_memory_command,
> +		/* READ_PART_COMMAND */	read_partition_command,
> +		/* START_COMMAND */	start_command,
> +		/* DOWNLOAD_COMMAND */	download_command
> +	};
> +
> +	/* flush and NACK pending command received during u-boot init
> +	 * request command reemit
> +	 */
> +	stm32prog_serial_result(NACK_BYTE);
> +
> +	clear_ctrlc(); /* forget any previous Control C */
> +	while (!had_ctrlc()) {
> +		phase = data->phase;
> +
> +		if (phase == PHASE_DO_RESET)
> +			return true;
> +
> +		/* Get the user command: read first byte */
> +		command = stm32prog_serial_getc();
> +
> +		if (command == INIT_BYTE) {
> +			puts("\nConnected\n");
> +			stm32prog_serial_result(ACK_BYTE);
> +			continue;
> +		}
> +
> +		found = 0;
> +		for (counter = 0; counter < NB_CMD; counter++)
> +			if (cmd_id[counter] == command) {
> +				found = 1;
> +				break;
> +			}
> +		if (found)
> +			if ((command ^ stm32prog_serial_getc()) != 0xFF)
> +				found = 0;
> +		if (!found) {
> +			/* wait to be sure that all data are received
> +			 * in the FIFO before flush (CMD and XOR)
> +			 */
> +			mdelay(3);
> +			stm32prog_serial_result(NACK_BYTE);
> +		} else {
> +			stm32prog_serial_result(ACK_BYTE);
> +			cmd_func[counter](data);
> +		}
> +		WATCHDOG_RESET();
> +	}
> +
> +	/* clean device */
> +	if (gd->cur_serial_dev == down_serial_dev) {
> +		/* restore console on uart */
> +		gd->flags &= ~(GD_FLG_DISABLE_CONSOLE | GD_FLG_SILENT);
> +	}
> +	down_serial_dev = NULL;
> +
> +	return false; /* no reset after ctrlc */
> +}
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> index 34f27c074f..969245e199 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> @@ -19,6 +19,7 @@ static int stm32prog_set_phase(struct stm32prog_data *data, u8 phase,
>  
>  	if (phase == data->phase) {
>  		data->offset = offset;
> +		data->dfu_seq = 0;
>  		return 0;
>  	}
>  
> @@ -29,6 +30,7 @@ static int stm32prog_set_phase(struct stm32prog_data *data, u8 phase,
>  			data->cur_part = part;
>  			data->phase = phase;
>  			data->offset = offset;
> +			data->dfu_seq = 0;
>  			return 0;
>  		}
>  	}

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
