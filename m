Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A41FC1A7BDC
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:09:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D44FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:09:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7349BC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:09:22 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED2t4a023881; Tue, 14 Apr 2020 15:09:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=dJ3mB/cFOu5NpNd0MIzWlFt80KLxjjxtYsJXvRxJ1Sk=;
 b=g+qLwIZu3ib5b+psoF7bHNO9zPsL3gHdGBem6SqAOlw8Lqss30DQKfR6g8Dzcfh4WgiY
 pfewNw0816vocPbrwIQ6u2NcDYA5WOjQT8xMQ9CZQvVEW7L9Gsmxl5WEPSnD4n76yo8K
 H/AfHFMIPXM9T5yl570dr61aTWpbz0MerrRP42W/U5I39tGEhY9CisDjW4IBUY2tYCBw
 lWdadW6eMhkvhsT/nsZAzSvTESAaHhBzVZ2wi0NPl5/RTWqarZT/7csP8MLVjbd5EmiU
 1hrsFRQfbPmYBBVjkMmb1OgvCq2NzW82zZs+6eSoQ7oIWbi/PY3HcAv1ORhetsjSiezV Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b66a5pt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:09:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CEDA10002A;
 Tue, 14 Apr 2020 15:09:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 11B642BC7A6;
 Tue, 14 Apr 2020 15:09:20 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:09:19 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:09:19 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 13/18] stm32mp: stm32prog: add otp update support
Thread-Index: AQHV/P7CDT32JEGBRkCXllxCuo8BTah4oEuA
Date: Tue, 14 Apr 2020 13:09:19 +0000
Message-ID: <87635c2f-0ac5-f73b-f7e4-931f08126f7b@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-14-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-14-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <4E14672D0F1E2C4B93C2EEC2A3EE7E32@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 13/18] stm32mp: stm32prog: add otp update
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

On 3/18/20 9:24 AM, Patrick Delaunay wrote:
> Add a virtual partition to update the STM32MP15x OTP based
> on SMC service provided by TF-A.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 130 +++++++++++++++++-
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  11 ++
>  .../cmd_stm32prog/stm32prog_usb.c             |  11 ++
>  3 files changed, 151 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 3573c04d16..cd826dbb9c 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -9,6 +9,7 @@
>  #include <malloc.h>
>  #include <mmc.h>
>  #include <part.h>
> +#include <asm/arch/stm32mp1_smc.h>
>  #include <dm/uclass.h>
>  #include <jffs2/load_kernel.h>
>  #include <linux/list.h>
> @@ -1106,7 +1107,7 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  	struct dfu_entity *dfu;
>  	int alt_nb;
>  
> -	alt_nb = 1; /* number of virtual = CMD */
> +	alt_nb = 2; /* number of virtual = CMD, OTP*/
>  	if (data->part_nb == 0)
>  		alt_nb++;  /* +1 for FlashLayout */
>  	else
> @@ -1154,6 +1155,9 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  	if (!ret)
>  		ret = stm32prog_alt_add_virt(dfu, "virtual", PHASE_CMD, 512);
>  
> +	if (!ret)
> +		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP, 512);
> +
>  	if (ret)
>  		stm32prog_err("dfu init failed: %d", ret);
>  	puts("done\n");
> @@ -1164,6 +1168,123 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  	return ret;
>  }
>  
> +int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
> +			long *size)
> +{
> +	pr_debug("%s: %x %lx\n", __func__, offset, *size);
> +
> +	if (!data->otp_part) {
> +		data->otp_part = memalign(CONFIG_SYS_CACHELINE_SIZE, OTP_SIZE);
> +		if (!data->otp_part)
> +			return -ENOMEM;
> +	}
> +
> +	if (!offset)
> +		memset(data->otp_part, 0, OTP_SIZE);
> +
> +	if (offset + *size > OTP_SIZE)
> +		*size = OTP_SIZE - offset;
> +
> +	memcpy((void *)((u32)data->otp_part + offset), buffer, *size);
> +
> +	return 0;
> +}
> +
> +int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
> +		       long *size)
> +{
> +#ifndef CONFIG_ARM_SMCCC
> +	stm32prog_err("OTP update not supported");
> +
> +	return -1;
> +#else
> +	int result = 0;
> +
> +	pr_debug("%s: %x %lx\n", __func__, offset, *size);
> +	/* alway read for first packet */
> +	if (!offset) {
> +		if (!data->otp_part)
> +			data->otp_part =
> +				memalign(CONFIG_SYS_CACHELINE_SIZE, OTP_SIZE);
> +
> +		if (!data->otp_part) {
> +			result = -ENOMEM;
> +			goto end_otp_read;
> +		}
> +
> +		/* init struct with 0 */
> +		memset(data->otp_part, 0, OTP_SIZE);
> +
> +		/* call the service */
> +		result = stm32_smc_exec(STM32_SMC_BSEC, STM32_SMC_READ_ALL,
> +					(u32)data->otp_part, 0);
> +		if (result)
> +			goto end_otp_read;
> +	}
> +
> +	if (!data->otp_part) {
> +		result = -ENOMEM;
> +		goto end_otp_read;
> +	}
> +
> +	if (offset + *size > OTP_SIZE)
> +		*size = OTP_SIZE - offset;
> +	memcpy(buffer, (void *)((u32)data->otp_part + offset), *size);
> +
> +end_otp_read:
> +	pr_debug("%s: result %i\n", __func__, result);
> +
> +	return result;
> +#endif
> +}
> +
> +int stm32prog_otp_start(struct stm32prog_data *data)
> +{
> +#ifndef CONFIG_ARM_SMCCC
> +	stm32prog_err("OTP update not supported");
> +
> +	return -1;
> +#else
> +	int result = 0;
> +	struct arm_smccc_res res;
> +
> +	if (!data->otp_part) {
> +		stm32prog_err("start OTP without data");
> +		return -1;
> +	}
> +
> +	arm_smccc_smc(STM32_SMC_BSEC, STM32_SMC_WRITE_ALL,
> +		      (u32)data->otp_part, 0, 0, 0, 0, 0, &res);
> +
> +	if (!res.a0) {
> +		switch (res.a1) {
> +		case 0:
> +			result = 0;
> +			break;
> +		case 1:
> +			stm32prog_err("Provisioning");
> +			result = 0;
> +			break;
> +		default:
> +			pr_err("%s: OTP incorrect value (err = %ld)\n",
> +			       __func__, res.a1);
> +			result = -EINVAL;
> +			break;
> +		}
> +	} else {
> +		pr_err("%s: Failed to exec svc=%x op=%x in secure mode (err = %ld)\n",
> +		       __func__, STM32_SMC_BSEC, STM32_SMC_WRITE_ALL, res.a0);
> +		result = -EINVAL;
> +	}
> +
> +	free(data->otp_part);
> +	data->otp_part = NULL;
> +	pr_debug("%s: result %i\n", __func__, result);
> +
> +	return result;
> +#endif
> +}
> +
>  /* copy FSBL on NAND to improve reliability on NAND */
>  static int stm32prog_copy_fsbl(struct stm32prog_part_t *part)
>  {
> @@ -1451,6 +1572,7 @@ void stm32prog_clean(struct stm32prog_data *data)
>  	/* clean */
>  	dfu_free_entities();
>  	free(data->part_array);
> +	free(data->otp_part);
>  	free(data->header_data);
>  }
>  
> @@ -1460,6 +1582,12 @@ void dfu_flush_callback(struct dfu_entity *dfu)
>  	if (!stm32prog_data)
>  		return;
>  
> +	if (dfu->dev_type == DFU_DEV_VIRT) {
> +		if (dfu->data.virt.dev_num == PHASE_OTP)
> +			stm32prog_otp_start(stm32prog_data);
> +		return;
> +	}
> +
>  	if (dfu->dev_type == DFU_DEV_RAM) {
>  		if (dfu->alt == 0 &&
>  		    stm32prog_data->phase == PHASE_FLASHLAYOUT) {
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 1880b163d7..6024657433 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -11,12 +11,15 @@
>  #define PHASE_FIRST_USER	0x10
>  #define PHASE_LAST_USER		0xF0
>  #define PHASE_CMD		0xF1
> +#define PHASE_OTP		0xF2
>  #define PHASE_END		0xFE
>  #define PHASE_RESET		0xFF
>  #define PHASE_DO_RESET		0x1FF
>  
>  #define DEFAULT_ADDRESS		0xFFFFFFFF
>  
> +#define OTP_SIZE		1024
> +
>  enum stm32prog_target {
>  	STM32PROG_NONE,
>  	STM32PROG_MMC,
> @@ -116,6 +119,7 @@ struct stm32prog_data {
>  	u32			offset;
>  	char			error[255];
>  	struct stm32prog_part_t	*cur_part;
> +	u32			*otp_part;
>  
>  	/* STM32 header information */
>  	struct raw_header_s	*header_data;
> @@ -124,6 +128,13 @@ struct stm32prog_data {
>  
>  extern struct stm32prog_data *stm32prog_data;
>  
> +/* OTP access */
> +int stm32prog_otp_write(struct stm32prog_data *data, u32 offset,
> +			u8 *buffer, long *size);
> +int stm32prog_otp_read(struct stm32prog_data *data, u32 offset,
> +		       u8 *buffer, long *size);
> +int stm32prog_otp_start(struct stm32prog_data *data);
> +
>  /* generic part*/
>  u8 stm32prog_header_check(struct raw_header_s *raw_header,
>  			  struct image_header_s *header);
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> index ed2cdbc66f..4a4b4d326b 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> @@ -130,6 +130,10 @@ int stm32prog_write_medium_virt(struct dfu_entity *dfu, u64 offset,
>  	switch (dfu->data.virt.dev_num) {
>  	case PHASE_CMD:
>  		return stm32prog_cmd_write(offset, buf, len);
> +
> +	case PHASE_OTP:
> +		return stm32prog_otp_write(stm32prog_data, (u32)offset,
> +					   buf, len);
>  	}
>  	*len = 0;
>  	return 0;
> @@ -144,6 +148,10 @@ int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
>  	switch (dfu->data.virt.dev_num) {
>  	case PHASE_CMD:
>  		return stm32prog_cmd_read(offset, buf, len);
> +
> +	case PHASE_OTP:
> +		return stm32prog_otp_read(stm32prog_data, (u32)offset,
> +					  buf, len);
>  	}
>  	*len = 0;
>  	return 0;
> @@ -162,6 +170,9 @@ int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
>  	case PHASE_CMD:
>  		*size = 512;
>  		break;
> +	case PHASE_OTP:
> +		*size = OTP_SIZE;
> +		break;
>  	}
>  
>  	return 0;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
