Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2AF50B1DE
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:42:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 046ECC60496;
	Fri, 22 Apr 2022 07:42:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAE05C60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:42:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M0SxWk019975;
 Fri, 22 Apr 2022 09:42:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ooVig8CGjAEuFPmC4q20ocQeIKClo9fU66H6raapD5E=;
 b=WNwW8b62JRaKZrkkWZnnTJwPPOZYBmathf7xANCtLDA+6dDMIe7ad1wGKOokkepDgpF0
 C42em9N6kaMTBQbHiZXSMyZovw5zsjMeXrGNWy+G6/axMju4jmDubR2IRqqSQcNdJtAp
 wE/36e1F03CrYak942nEQhbjhKXjyKCTdrcs0+28HsgYLD/B2A8ZsSFxyAOscQQTYTMY
 1uoOX+TSe1x2HXkKgVtvI+3iz/ouBKy8ckZWDfC44Bo2mxyBTh/P0Vz7Oq45a1zv3FIa
 p7RUja0yOOXGnPtnSjZJ/C4ZVbvzMEeeD+b0Gz3oyZTaI1PsbyUCeIDVmC7LjnkE7f2N nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fh09m91t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:42:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B16B3100038;
 Fri, 22 Apr 2022 09:42:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8793216840;
 Fri, 22 Apr 2022 09:42:02 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:42:02 +0200
Message-ID: <4544c27f-c016-542b-2801-5e2899f41c44@foss.st.com>
Date: Fri, 22 Apr 2022 09:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
 <20220328192520.3.Ic62ab0b22b898fc5dfae530e3560849cd33d5902@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220328192520.3.Ic62ab0b22b898fc5dfae530e3560849cd33d5902@changeid>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, William Grant <wgrant@ubuntu.com>
Subject: Re: [Uboot-stm32] [PATCH 3/8] stm32mp: stm32prog: add TEE support
 in stm32prog command
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

HI Patrick

On 3/28/22 19:25, Patrick Delaunay wrote:
> When OP-TEE is used, the SMC for BSEC management are not
> available and the PTA provisioning for OTP must be used.
> 
> U-Boot opens the session to this PTA and use it for OTP
> access.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig   |   2 +-
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 145 ++++++++++++++++--
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   7 +-
>  .../cmd_stm32prog/stm32prog_usb.c             |   2 +-
>  4 files changed, 142 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
> index 81d2b87035..8f91db4b46 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
> @@ -35,6 +35,6 @@ config CMD_STM32PROG_SERIAL
>  config CMD_STM32PROG_OTP
>  	bool "support stm32prog for OTP update"
>  	depends on CMD_STM32PROG
> -	default y if ARM_SMCCC
> +	default y if ARM_SMCCC || OPTEE
>  	help
>  		Support the OTP update with the command "stm32prog" for STM32MP
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 3e9354b51d..5d53e6146f 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -10,8 +10,10 @@
>  #include <misc.h>
>  #include <mmc.h>
>  #include <part.h>
> +#include <tee.h>
>  #include <asm/arch/stm32mp1_smc.h>
>  #include <asm/global_data.h>
> +#include <dm/device_compat.h>
>  #include <dm/uclass.h>
>  #include <jffs2/load_kernel.h>
>  #include <linux/list.h>
> @@ -79,8 +81,110 @@ struct fip_toc_header {
>  	u64	flags;
>  };
>  
> +#define TA_NVMEM_UUID { 0x1a8342cc, 0x81a5, 0x4512, \
> +		{ 0x99, 0xfe, 0x9e, 0x2b, 0x3e, 0x37, 0xd6, 0x26 } }
> +
> +/*
> + * Read NVMEM memory for STM32CubeProgrammer
> + *
> + * [in]		value[0].a:		Type (0 for OTP access)
> + * [out]	memref[1].buffer	Output buffer to return all read values
> + * [out]	memref[1].size		Size of buffer to be read
> + *
> + * Return codes:
> + * TEE_SUCCESS - Invoke command success
> + * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
> + */
> +#define TA_NVMEM_READ		0x0
> +
> +/*
> + * Write NVMEM memory for STM32CubeProgrammer
> + *
> + * [in]	     value[0].a		Type (0 for OTP access)
> + * [in]      memref[1].buffer	Input buffer with the values to write
> + * [in]      memref[1].size	Size of buffer to be written
> + *
> + * Return codes:
> + * TEE_SUCCESS - Invoke command success
> + * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
> + */
> +#define TA_NVMEM_WRITE		0x1
> +
> +/* value of TA_NVMEM type = value[in] a */
> +#define NVMEM_OTP		0
> +
>  DECLARE_GLOBAL_DATA_PTR;
>  
> +/* OPTEE TA NVMEM open helper */
> +static int optee_ta_open(struct stm32prog_data *data)
> +{
> +	const struct tee_optee_ta_uuid uuid = TA_NVMEM_UUID;
> +	struct tee_open_session_arg arg;
> +	struct udevice *tee = NULL;
> +	int rc;
> +
> +	if (data->tee)
> +		return 0;
> +
> +	tee = tee_find_device(NULL, NULL, NULL, NULL);
> +	if (!tee)
> +		return -ENODEV;
> +
> +	memset(&arg, 0, sizeof(arg));
> +	tee_optee_ta_uuid_to_octets(arg.uuid, &uuid);
> +	rc = tee_open_session(tee, &arg, 0, NULL);
> +	if (rc < 0)
> +		return -ENODEV;
> +
> +	data->tee = tee;
> +	data->tee_session = arg.session;
> +
> +	return 0;
> +}
> +
> +/* OPTEE TA NVMEM invoke helper */
> +static int optee_ta_invoke(struct stm32prog_data *data, int cmd, int type,
> +			   void *buff, ulong size)
> +{
> +	struct tee_invoke_arg arg;
> +	struct tee_param param[2];
> +	struct tee_shm *buff_shm;
> +	int rc;
> +
> +	rc = tee_shm_register(data->tee, buff, size, 0, &buff_shm);
> +	if (rc)
> +		return rc;
> +
> +	memset(&arg, 0, sizeof(arg));
> +	arg.func = cmd;
> +	arg.session = data->tee_session;
> +
> +	memset(param, 0, sizeof(param));
> +	param[0].attr = TEE_PARAM_ATTR_TYPE_VALUE_INPUT;
> +	param[0].u.value.a = type;
> +
> +	if (cmd == TA_NVMEM_WRITE)
> +		param[1].attr = TEE_PARAM_ATTR_TYPE_MEMREF_INPUT;
> +	else
> +		param[1].attr = TEE_PARAM_ATTR_TYPE_MEMREF_OUTPUT;
> +
> +	param[1].u.memref.shm = buff_shm;
> +	param[1].u.memref.size = size;
> +
> +	rc = tee_invoke_func(data->tee, &arg, 2, param);
> +	if (rc < 0 || arg.ret != 0) {
> +		dev_err(data->tee,
> +			"TA_NVMEM invoke failed TEE err: %x, err:%x\n",
> +			arg.ret, rc);
> +		if (!rc)
> +			rc = -EIO;
> +	}
> +
> +	tee_shm_free(buff_shm);
> +
> +	return rc;
> +}
> +
>  /* partition handling routines : CONFIG_CMD_MTDPARTS */
>  int mtdparts_init(void);
>  int find_dev_and_part(const char *id, struct mtd_device **dev,
> @@ -1208,7 +1312,11 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  		ret = stm32prog_alt_add_virt(dfu, "virtual", PHASE_CMD, CMD_SIZE);
>  
>  	if (!ret && IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
> -		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP, OTP_SIZE);
> +		ret = optee_ta_open(data);
> +		log_debug("optee_ta result %d\n", ret);
> +		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP,
> +					     data->tee ? OTP_SIZE_TA : OTP_SIZE_SMC);
> +	}
>  
>  	if (!ret && CONFIG_IS_ENABLED(DM_PMIC))
>  		ret = stm32prog_alt_add_virt(dfu, "PMIC", PHASE_PMIC, PMIC_SIZE);
> @@ -1226,6 +1334,7 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  			long *size)
>  {
> +	u32 otp_size = data->tee ? OTP_SIZE_TA : OTP_SIZE_SMC;
>  	log_debug("%s: %x %lx\n", __func__, offset, *size);
>  
>  	if (!IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
> @@ -1233,17 +1342,18 @@ int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  
>  		return -EOPNOTSUPP;
>  	}
> +
>  	if (!data->otp_part) {
> -		data->otp_part = memalign(CONFIG_SYS_CACHELINE_SIZE, OTP_SIZE);
> +		data->otp_part = memalign(CONFIG_SYS_CACHELINE_SIZE, otp_size);
>  		if (!data->otp_part)
>  			return -ENOMEM;
>  	}
>  
>  	if (!offset)
> -		memset(data->otp_part, 0, OTP_SIZE);
> +		memset(data->otp_part, 0, otp_size);
>  
> -	if (offset + *size > OTP_SIZE)
> -		*size = OTP_SIZE - offset;
> +	if (offset + *size > otp_size)
> +		*size = otp_size - offset;
>  
>  	memcpy((void *)((u32)data->otp_part + offset), buffer, *size);
>  
> @@ -1253,6 +1363,7 @@ int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  		       long *size)
>  {
> +	u32 otp_size = data->tee ? OTP_SIZE_TA : OTP_SIZE_SMC;
>  	int result = 0;
>  
>  	if (!IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
> @@ -1266,7 +1377,7 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  	if (!offset) {
>  		if (!data->otp_part)
>  			data->otp_part =
> -				memalign(CONFIG_SYS_CACHELINE_SIZE, OTP_SIZE);
> +				memalign(CONFIG_SYS_CACHELINE_SIZE, otp_size);
>  
>  		if (!data->otp_part) {
>  			result = -ENOMEM;
> @@ -1274,11 +1385,14 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  		}
>  
>  		/* init struct with 0 */
> -		memset(data->otp_part, 0, OTP_SIZE);
> +		memset(data->otp_part, 0, otp_size);
>  
>  		/* call the service */
>  		result = -EOPNOTSUPP;
> -		if (IS_ENABLED(CONFIG_ARM_SMCCC))
> +		if (data->tee && CONFIG_IS_ENABLED(OPTEE))
> +			result = optee_ta_invoke(data, TA_NVMEM_READ, NVMEM_OTP,
> +						 data->otp_part, OTP_SIZE_TA);
> +		else if (IS_ENABLED(CONFIG_ARM_SMCCC))
>  			result = stm32_smc_exec(STM32_SMC_BSEC, STM32_SMC_READ_ALL,
>  						(u32)data->otp_part, 0);
>  		if (result)
> @@ -1290,8 +1404,8 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  		goto end_otp_read;
>  	}
>  
> -	if (offset + *size > OTP_SIZE)
> -		*size = OTP_SIZE - offset;
> +	if (offset + *size > otp_size)
> +		*size = otp_size - offset;
>  	memcpy(buffer, (void *)((u32)data->otp_part + offset), *size);
>  
>  end_otp_read:
> @@ -1317,7 +1431,10 @@ int stm32prog_otp_start(struct stm32prog_data *data)
>  	}
>  
>  	result = -EOPNOTSUPP;
> -	if (IS_ENABLED(CONFIG_ARM_SMCCC)) {
> +	if (data->tee && CONFIG_IS_ENABLED(OPTEE)) {
> +		result = optee_ta_invoke(data, TA_NVMEM_WRITE, NVMEM_OTP,
> +					 data->otp_part, OTP_SIZE_TA);
> +	} else if (IS_ENABLED(CONFIG_ARM_SMCCC)) {
>  		arm_smccc_smc(STM32_SMC_BSEC, STM32_SMC_WRITE_ALL,
>  			      (u32)data->otp_part, 0, 0, 0, 0, 0, &res);
>  
> @@ -1751,6 +1868,12 @@ void stm32prog_clean(struct stm32prog_data *data)
>  	free(data->part_array);
>  	free(data->otp_part);
>  	free(data->buffer);
> +
> +	if (CONFIG_IS_ENABLED(OPTEE) && data->tee) {
> +		tee_close_session(data->tee, data->tee_session);
> +		data->tee = NULL;
> +		data->tee_session = 0x0;
> +	}
>  }
>  
>  /* DFU callback: used after serial and direct DFU USB access */
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 240c5c44bc..928b7b3a0e 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -20,7 +20,8 @@
>  #define DEFAULT_ADDRESS		0xFFFFFFFF
>  
>  #define CMD_SIZE		512
> -#define OTP_SIZE		1024
> +#define OTP_SIZE_SMC		1024
> +#define OTP_SIZE_TA		776
>  #define PMIC_SIZE		8
>  
>  enum stm32prog_target {
> @@ -147,6 +148,10 @@ struct stm32prog_data {
>  	u32	dtb;
>  	u32	initrd;
>  	u32	initrd_size;
> +
> +	/* OPTEE PTA NVMEM */
> +	struct udevice *tee;
> +	u32 tee_session;
>  };
>  
>  extern struct stm32prog_data *stm32prog_data;
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> index e8acc302f9..82b702f93b 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> @@ -181,7 +181,7 @@ int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
>  		*size = CMD_SIZE;
>  		break;
>  	case PHASE_OTP:
> -		*size = OTP_SIZE;
> +		*size = stm32prog_data->tee ? OTP_SIZE_TA : OTP_SIZE_SMC;
>  		break;
>  	case PHASE_PMIC:
>  		*size = PMIC_SIZE;
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
