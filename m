Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6D520E57
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:27:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8ED80C5F1D3;
	Tue, 10 May 2022 07:27:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A214C5EC6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:27:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A1VQjs011800;
 Tue, 10 May 2022 09:27:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=f6RCKEYVnhmek8s9RPeyIasCqjNF4RJJZin5uIKoqIQ=;
 b=yG70HuteJ0BcutyS7tJzTkoVSn5YhGDgxBIpyCS0Nyz/SC0CzDzPsqlid9PsQo9aLhIM
 YPMmhbRA46IPgbpTfEGWLszyHBf+6819soSm2mC+hgSY1o65oqBcNqKxMb0/UFV0Aqix
 eMhO1PDzsYCDxp4H33YrfRBlQuItK9tv5CkdpEhnoM0KXgXvjo1VEzsCvdUxLp4LX8vY
 viSseZnNxLQb/vuFl81qhTn0DH6L0q+mzpRzEwX1IkQm4LA8UAUri3IimWhyZzmOnON1
 2dfDLotk73mo64Zr7riY8c0fYNeNonrZrdpdSgoy421eUZhZCLYH0YsAyqltFvkMgnmT dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwfngg373-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:27:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1578410002A;
 Tue, 10 May 2022 09:27:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0794F21230D;
 Tue, 10 May 2022 09:27:30 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 09:27:29 +0200
Message-ID: <e32e59c3-1862-b6da-c395-c9667d6c3735@foss.st.com>
Date: Tue, 10 May 2022 09:27:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
 <20220328192520.2.I8a70cf3fb14c425e15e3b7c16134f34d9c343aae@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220328192520.2.I8a70cf3fb14c425e15e3b7c16134f34d9c343aae@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, William Grant <wgrant@ubuntu.com>
Subject: Re: [Uboot-stm32] [PATCH 2/8] stm32mp: stm32prog: add
	CONFIG_CMD_STM32PROG_OTP
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



On 3/28/22 19:25, Patrick Delaunay wrote:
> Add a configuration flag CONFIG_CMD_STM32PROG_OTP to enable the support of
> OTP update in stm32prog command.
> 
> This new configuration allows to deactivate this feature for security reason
> and it is a preliminary step for support of OPT update with the OP-TEE
> provisioning TA.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig   |  7 ++
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 66 +++++++++++--------
>  2 files changed, 46 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
> index dd166a1f91..81d2b87035 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
> @@ -31,3 +31,10 @@ config CMD_STM32PROG_SERIAL
>  		activate the command "stm32prog serial" for STM32MP soc family
>  		with the tools STM32CubeProgrammer using U-Boot serial device
>  		and UART protocol.
> +
> +config CMD_STM32PROG_OTP
> +	bool "support stm32prog for OTP update"
> +	depends on CMD_STM32PROG
> +	default y if ARM_SMCCC
> +	help
> +		Support the OTP update with the command "stm32prog" for STM32MP
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index d513a60efb..3e9354b51d 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -1154,7 +1154,9 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  	struct dfu_entity *dfu;
>  	int alt_nb;
>  
> -	alt_nb = 2; /* number of virtual = CMD, OTP*/
> +	alt_nb = 1; /* number of virtual = CMD*/
> +	if (IS_ENABLED(CONFIG_CMD_STM32PROG_OTP))
> +		alt_nb++; /* OTP*/
>  	if (CONFIG_IS_ENABLED(DM_PMIC))
>  		alt_nb++; /* PMIC NVMEM*/
>  
> @@ -1205,7 +1207,7 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  	if (!ret)
>  		ret = stm32prog_alt_add_virt(dfu, "virtual", PHASE_CMD, CMD_SIZE);
>  
> -	if (!ret)
> +	if (!ret && IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
>  		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP, OTP_SIZE);
>  
>  	if (!ret && CONFIG_IS_ENABLED(DM_PMIC))
> @@ -1226,6 +1228,11 @@ int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  {
>  	log_debug("%s: %x %lx\n", __func__, offset, *size);
>  
> +	if (!IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
> +		stm32prog_err("OTP update not supported");
> +
> +		return -EOPNOTSUPP;
> +	}
>  	if (!data->otp_part) {
>  		data->otp_part = memalign(CONFIG_SYS_CACHELINE_SIZE, OTP_SIZE);
>  		if (!data->otp_part)
> @@ -1248,10 +1255,10 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  {
>  	int result = 0;
>  
> -	if (!IS_ENABLED(CONFIG_ARM_SMCCC)) {
> +	if (!IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
>  		stm32prog_err("OTP update not supported");
>  
> -		return -1;
> +		return -EOPNOTSUPP;
>  	}
>  
>  	log_debug("%s: %x %lx\n", __func__, offset, *size);
> @@ -1270,8 +1277,10 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  		memset(data->otp_part, 0, OTP_SIZE);
>  
>  		/* call the service */
> -		result = stm32_smc_exec(STM32_SMC_BSEC, STM32_SMC_READ_ALL,
> -					(u32)data->otp_part, 0);
> +		result = -EOPNOTSUPP;
> +		if (IS_ENABLED(CONFIG_ARM_SMCCC))
> +			result = stm32_smc_exec(STM32_SMC_BSEC, STM32_SMC_READ_ALL,
> +						(u32)data->otp_part, 0);
>  		if (result)
>  			goto end_otp_read;
>  	}
> @@ -1296,10 +1305,10 @@ int stm32prog_otp_start(struct stm32prog_data *data)
>  	int result = 0;
>  	struct arm_smccc_res res;
>  
> -	if (!IS_ENABLED(CONFIG_ARM_SMCCC)) {
> +	if (!IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
>  		stm32prog_err("OTP update not supported");
>  
> -		return -1;
> +		return -EOPNOTSUPP;
>  	}
>  
>  	if (!data->otp_part) {
> @@ -1307,28 +1316,31 @@ int stm32prog_otp_start(struct stm32prog_data *data)
>  		return -1;
>  	}
>  
> -	arm_smccc_smc(STM32_SMC_BSEC, STM32_SMC_WRITE_ALL,
> -		      (u32)data->otp_part, 0, 0, 0, 0, 0, &res);
> +	result = -EOPNOTSUPP;
> +	if (IS_ENABLED(CONFIG_ARM_SMCCC)) {
> +		arm_smccc_smc(STM32_SMC_BSEC, STM32_SMC_WRITE_ALL,
> +			      (u32)data->otp_part, 0, 0, 0, 0, 0, &res);
>  
> -	if (!res.a0) {
> -		switch (res.a1) {
> -		case 0:
> -			result = 0;
> -			break;
> -		case 1:
> -			stm32prog_err("Provisioning");
> -			result = 0;
> -			break;
> -		default:
> -			log_err("%s: OTP incorrect value (err = %ld)\n",
> -				__func__, res.a1);
> +		if (!res.a0) {
> +			switch (res.a1) {
> +			case 0:
> +				result = 0;
> +				break;
> +			case 1:
> +				stm32prog_err("Provisioning");
> +				result = 0;
> +				break;
> +			default:
> +				log_err("%s: OTP incorrect value (err = %ld)\n",
> +					__func__, res.a1);
> +				result = -EINVAL;
> +				break;
> +			}
> +		} else {
> +			log_err("%s: Failed to exec svc=%x op=%x in secure mode (err = %ld)\n",
> +				__func__, STM32_SMC_BSEC, STM32_SMC_WRITE_ALL, res.a0);
>  			result = -EINVAL;
> -			break;
>  		}
> -	} else {
> -		log_err("%s: Failed to exec svc=%x op=%x in secure mode (err = %ld)\n",
> -			__func__, STM32_SMC_BSEC, STM32_SMC_WRITE_ALL, res.a0);
> -		result = -EINVAL;
>  	}
>  
>  	free(data->otp_part);
Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
