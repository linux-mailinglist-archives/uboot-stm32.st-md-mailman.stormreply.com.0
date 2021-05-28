Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD523942FB
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 May 2021 14:53:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96F11C5718D;
	Fri, 28 May 2021 12:53:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCC72C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 12:53:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SCqLN8013195; Fri, 28 May 2021 14:53:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PEUGQ+AeL3sz+2p46S1Bl4/Wi4omeHL0Fb/nLmlgDL0=;
 b=cztfg7eW0nA3e8UnGLG65aKgrR/f471T7cAlIw6CqVaH7RJ0KEegTlnBgFICEz4chPI1
 8PkMoKmNP1iZjZMS6tfrD/vD434eT6ZYNCqAvrV2Z2liRjT9qLXl71m+2LVjOuMDsAVf
 kh77T+G+nUubQh3P+jXG0Yqtn//qFsVKyrAWc23DnMUjPGquzRx7slzxaeXg9peO/nPr
 VhG2y6GLdWbLOrI2lqDRPuYNKkyqLwSyLY5qlA03ZPu/tUnGqkBDbFCX8Gd21hdCRlf4
 UamED7B5KK1zXphwyT6rOj9/P3kyiEYbdBjMe6g5M205qFMT+qF/pbJRVNJn7xvfoVlY ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38tsq0jhn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 14:53:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 104BD10002A;
 Fri, 28 May 2021 14:53:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 03FA52291B2;
 Fri, 28 May 2021 14:53:10 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 14:53:09 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.1.Idc6a3beb93aa6eeee965d3d12d45fa8b834c4e02@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <aeace188-8096-5942-0b01-2e0e8cb7c7f6@foss.st.com>
Date: Fri, 28 May 2021 14:53:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518151206.1.Idc6a3beb93aa6eeee965d3d12d45fa8b834c4e02@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 01/10] stm32mp: stm32prog: remove all the
 header check for UART download
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

Hi Patrick

On 5/18/21 3:12 PM, Patrick Delaunay wrote:
> This patch removes the header check for UART download;
> the check of checksum is not mandatory with even parity and chuck
> checksum for each 256 received bytes and it is only done for
> STM32 image (FSBL = TF-A BL2), not for FIT image.
> 
> This patch solve issue of duplicated 0x100 byte written with FIP header.
> 
> Fixes: 4fb7b3e10891 ("stm32mp: stm32prog: add FIP header support")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |  14 +-
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   5 -
>  .../cmd_stm32prog/stm32prog_serial.c          | 151 ++----------------
>  3 files changed, 22 insertions(+), 148 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 4c4d8a7a69..84b880261a 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -369,23 +369,24 @@ static int parse_flash_layout(struct stm32prog_data *data,
>  	bool end_of_line, eof;
>  	char *p, *start, *last, *col;
>  	struct stm32prog_part_t *part;
> +	struct image_header_s header;
>  	int part_list_size;
>  	int i;
>  
>  	data->part_nb = 0;
>  
>  	/* check if STM32image is detected */
> -	stm32prog_header_check((struct raw_header_s *)addr, &data->header);
> -	if (data->header.type == HEADER_STM32IMAGE) {
> +	stm32prog_header_check((struct raw_header_s *)addr, &header);
> +	if (header.type == HEADER_STM32IMAGE) {
>  		u32 checksum;
>  
>  		addr = addr + BL_HEADER_SIZE;
> -		size = data->header.image_length;
> +		size = header.image_length;
>  
> -		checksum = stm32prog_header_checksum(addr, &data->header);
> -		if (checksum != data->header.image_checksum) {
> +		checksum = stm32prog_header_checksum(addr, &header);
> +		if (checksum != header.image_checksum) {
>  			stm32prog_err("Layout: invalid checksum : 0x%x expected 0x%x",
> -				      checksum, data->header.image_checksum);
> +				      checksum, header.image_checksum);
>  			return -EIO;
>  		}
>  	}
> @@ -1727,7 +1728,6 @@ void stm32prog_clean(struct stm32prog_data *data)
>  	free(data->part_array);
>  	free(data->otp_part);
>  	free(data->buffer);
> -	free(data->header_data);
>  }
>  
>  /* DFU callback: used after serial and direct DFU USB access */
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 581b10d0ac..ad404879a7 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -132,14 +132,9 @@ struct stm32prog_data {
>  	u32			*otp_part;
>  	u8			pmic_part[PMIC_SIZE];
>  
> -	/* STM32 header information */
> -	struct raw_header_s	*header_data;
> -	struct image_header_s	header;
> -
>  	/* SERIAL information */
>  	u32	cursor;
>  	u32	packet_number;
> -	u32	checksum;
>  	u8	*buffer; /* size = USART_RAM_BUFFER_SIZE*/
>  	int	dfu_seq;
>  	u8	read_phase;
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> index 2b92e3b149..7eca86c11b 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> @@ -292,56 +292,6 @@ static void stm32prog_serial_putc(u8 w_byte)
>  }
>  
>  /* Helper function ************************************************/
> -
> -static u8 stm32prog_header(struct stm32prog_data *data)
> -{
> -	u8 ret;
> -	u8 boot = 0;
> -	struct dfu_entity *dfu_entity;
> -	u64 size = 0;
> -
> -	dfu_entity = stm32prog_get_entity(data);
> -	if (!dfu_entity)
> -		return -ENODEV;
> -
> -	printf("\nSTM32 download write %s\n", dfu_entity->name);
> -
> -	/* force cleanup to avoid issue with previous read */
> -	dfu_transaction_cleanup(dfu_entity);
> -
> -	stm32prog_header_check(data->header_data, &data->header);
> -
> -	/* no stm32 image header : max size is partition size */
> -	if (data->header.type != HEADER_STM32IMAGE) {
> -		dfu_entity->get_medium_size(dfu_entity, &size);
> -		data->header.image_length = size;
> -	}
> -
> -	/**** Flash the header if necessary for boot partition */
> -	if (data->phase < PHASE_FIRST_USER)
> -		boot = 1;
> -
> -	/* write header if boot partition */
> -	if (boot) {
> -		if (ret) {
> -			stm32prog_err("invalid header (error %d)", ret);
> -		} else {
> -			ret = stm32prog_write(data,
> -					      (u8 *)data->header_data,
> -					      BL_HEADER_SIZE);
> -		}
> -	} else {
> -		if (ret)
> -			printf("  partition without checksum\n");
> -		ret = 0;
> -	}
> -
> -	free(data->header_data);
> -	data->header_data = NULL;
> -
> -	return ret;
> -}
> -
>  static u8 stm32prog_start(struct stm32prog_data *data, u32 address)
>  {
>  	u8 ret = 0;
> @@ -388,23 +338,6 @@ static u8 stm32prog_start(struct stm32prog_data *data, u32 address)
>  		data->dfu_seq = 0;
>  
>  		printf("\n  received length = 0x%x\n", data->cursor);
> -		if (data->header.type == HEADER_STM32IMAGE) {
> -			if (data->cursor !=
> -			    (data->header.image_length + BL_HEADER_SIZE)) {
> -				stm32prog_err("transmission interrupted (length=0x%x expected=0x%x)",
> -					      data->cursor,
> -					      data->header.image_length +
> -					      BL_HEADER_SIZE);
> -				return -EIO;
> -			}
> -			if (data->header.image_checksum != data->checksum) {
> -				stm32prog_err("invalid checksum received (0x%x expected 0x%x)",
> -					      data->checksum,
> -					      data->header.image_checksum);
> -				return -EIO;
> -			}
> -			printf("\n  checksum OK (0x%x)\n", data->checksum);
> -		}
>  
>  		/* update DFU with received flashlayout */
>  		if (data->phase == PHASE_FLASHLAYOUT)
> @@ -627,14 +560,12 @@ static void download_command(struct stm32prog_data *data)
>  	u32 counter = 0x0, codesize = 0x0;
>  	u8 *ramaddress = 0;
>  	u8 rcv_data = 0x0;
> -	struct image_header_s *image_header = &data->header;
>  	u32 cursor = data->cursor;
>  	long size = 0;
>  	u8 operation;
>  	u32 packet_number;
>  	u32 result = ACK_BYTE;
>  	u8 ret;
> -	unsigned int i;
>  	bool error;
>  	int rcv;
>  
> @@ -668,13 +599,8 @@ static void download_command(struct stm32prog_data *data)
>  	if (packet_number == 0) {
>  		/* erase: re-initialize the image_header struct */
>  		data->packet_number = 0;
> -		if (data->header_data)
> -			memset(data->header_data, 0, BL_HEADER_SIZE);
> -		else
> -			data->header_data = calloc(1, BL_HEADER_SIZE);
>  		cursor = 0;
>  		data->cursor = 0;
> -		data->checksum = 0;
>  		/*idx = cursor;*/
>  	} else {
>  		data->packet_number++;
> @@ -746,74 +672,27 @@ static void download_command(struct stm32prog_data *data)
>  		goto end;
>  	}
>  
> -	/* Update current position in buffer */
> -	data->cursor += codesize;
> -
> -	if (operation == PHASE_OTP) {
> -		size = data->cursor - cursor;
> -		/* no header for OTP */
> -		if (stm32prog_otp_write(data, cursor,
> -					data->buffer, &size))
> -			result = ABORT_BYTE;
> -		goto end;
> -	}
> +	switch (operation) {
> +	case PHASE_OTP:
> +		size = codesize;
> +		ret = stm32prog_otp_write(data, cursor, data->buffer, &size);
> +		break;
>  
> -	if (operation == PHASE_PMIC) {
> -		size = data->cursor - cursor;
> -		/* no header for PMIC */
> -		if (stm32prog_pmic_write(data, cursor,
> -					 data->buffer, &size))
> -			result = ABORT_BYTE;
> -		goto end;
> -	}
> +	case PHASE_PMIC:
> +		size = codesize;
> +		ret = stm32prog_pmic_write(data, cursor, data->buffer, &size);
> +		break;
>  
> -	if (cursor < BL_HEADER_SIZE) {
> -		/* size = portion of header in this chunck */
> -		if (data->cursor >= BL_HEADER_SIZE)
> -			size = BL_HEADER_SIZE - cursor;
> -		else
> -			size = data->cursor - cursor;
> -		memcpy((void *)((u32)(data->header_data) + cursor),
> -		       data->buffer, size);
> -		cursor += size;
> -
> -		if (cursor == BL_HEADER_SIZE) {
> -			/* Check and Write the header */
> -			if (stm32prog_header(data)) {
> -				result = ABORT_BYTE;
> -				goto end;
> -			}
> -		} else {
> -			goto end;
> -		}
> +	default:
> +		ret = stm32prog_write(data, data->buffer, codesize);
> +		break;
>  	}
>  
> -	if (data->header.type == HEADER_STM32IMAGE) {
> -		if (data->cursor <= BL_HEADER_SIZE)
> -			goto end;
> -		/* compute checksum on payload */
> -		for (i = (unsigned long)size; i < codesize; i++)
> -			data->checksum += data->buffer[i];
> -
> -		if (data->cursor >
> -		    image_header->image_length + BL_HEADER_SIZE) {
> -			log_err("expected size exceeded\n");
> -			result = ABORT_BYTE;
> -			goto end;
> -		}
> -
> -		/* write data (payload) */
> -		ret = stm32prog_write(data,
> -				      &data->buffer[size],
> -				      codesize - size);
> -	} else {
> -		/* write all */
> -		ret = stm32prog_write(data,
> -				      data->buffer,
> -				      codesize);
> -	}
>  	if (ret)
>  		result = ABORT_BYTE;
> +	else
> +		/* Update current position in buffer */
> +		data->cursor += codesize;
>  
>  end:
>  	stm32prog_serial_result(result);
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
