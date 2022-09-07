Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9885AFCBB
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Sep 2022 08:45:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96757C0D2BF;
	Wed,  7 Sep 2022 06:45:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9551C03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 06:45:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2875Kxpc005924;
 Wed, 7 Sep 2022 08:44:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yrBKfh4+MbcnTNqq1gvDTqklWc+OeK1qtrk54KbZksk=;
 b=v1SVbpubIXqjzv/shThkrC0Eaikuf4m9AeYgelyLFeMu3RCOJskNWrfPereQ/YypaJwr
 /hAilqLirQkva2iHvw21Wk4Wz3bQItz6IH7nGKeCSQEniKjvq1eKGuqRpkKj9Ms+Oua4
 TfRW3KWwiofXq9o1RP+1g7vU57AbQGFt1/KcqKGP74HaJulR+r9Xsfm33DiDUxXgLpYV
 rBzxzPGVlddPKfmD/86GezTGlkDUZzMTpmsrgdL/q5PV9LxAaUBw7sza3zI/cNfny8/r
 G11Ot2zIkOnQlpKVMdmBcIYHtToRFZiv/UR+cMzQFiIbeEf5pSCjD6GnZv44Javf+aGy 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jdamgdx5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 08:44:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B87810002A;
 Wed,  7 Sep 2022 08:44:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4720E2128BC;
 Wed,  7 Sep 2022 08:44:59 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Wed, 7 Sep 2022
 08:44:58 +0200
Message-ID: <f3dc5c31-0c5f-4b15-edcd-023db098dae5@foss.st.com>
Date: Wed, 7 Sep 2022 08:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220906185314.1.I9928b88f3a453611043b484158b02efe9b0c06bf@changeid>
 <20220906185314.4.I7f5dcb6d058c600d6f67432864c5051d29ba8d7b@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220906185314.4.I7f5dcb6d058c600d6f67432864c5051d29ba8d7b@changeid>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_04,2022-09-06_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] stm32mp: stm32prog: correctly handle
 OTP when SMC is not supported
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

On 9/6/22 18:53, Patrick Delaunay wrote:
> As the SMC is only supported in SP-MIN for STM32MP15x, the associated
> partition should be absent when the TA NVMEM is not available in OPT-TEE
> in STM32MP13x.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 25 +++++++++++++------
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  5 ++++
>  2 files changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 67be1ac7ff8..b151ce10475 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -1342,10 +1342,22 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  	struct stm32prog_part_t *part;
>  	struct dfu_entity *dfu;
>  	int alt_nb;
> +	u32 otp_size = 0;
>  
>  	alt_nb = 1; /* number of virtual = CMD*/
> -	if (IS_ENABLED(CONFIG_CMD_STM32PROG_OTP))
> -		alt_nb++; /* OTP*/
> +
> +	if (IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
> +		/* OTP_SIZE_SMC = 0 if SMC is not supported */
> +		otp_size = OTP_SIZE_SMC;
> +		/* check if PTA BSEC is supported */
> +		ret = optee_ta_open(data);
> +		log_debug("optee_ta_open(PTA_NVMEM) result %d\n", ret);
> +		if (!ret && data->tee)
> +			otp_size = OTP_SIZE_TA;
> +		if (otp_size)
> +			alt_nb++; /* OTP*/
> +	}
> +
>  	if (CONFIG_IS_ENABLED(DM_PMIC))
>  		alt_nb++; /* PMIC NVMEM*/
>  
> @@ -1363,6 +1375,7 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  	puts("DFU alt info setting: ");
>  	if (data->part_nb) {
>  		alt_id = 0;
> +		ret = 0;
>  		for (phase = 1;
>  		     (phase <= PHASE_LAST_USER) &&
>  		     (alt_id < alt_nb) && !ret;
> @@ -1396,12 +1409,8 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  	if (!ret)
>  		ret = stm32prog_alt_add_virt(dfu, "virtual", PHASE_CMD, CMD_SIZE);
>  
> -	if (!ret && IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
> -		ret = optee_ta_open(data);
> -		log_debug("optee_ta result %d\n", ret);
> -		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP,
> -					     data->tee ? OTP_SIZE_TA : OTP_SIZE_SMC);
> -	}
> +	if (!ret && IS_ENABLED(CONFIG_CMD_STM32PROG_OTP) && otp_size)
> +		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP, otp_size);
>  
>  	if (!ret && CONFIG_IS_ENABLED(DM_PMIC))
>  		ret = stm32prog_alt_add_virt(dfu, "PMIC", PHASE_PMIC, PMIC_SIZE);
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 397506ac47c..58f4b96fa75 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -20,7 +20,12 @@
>  #define DEFAULT_ADDRESS		0xFFFFFFFF
>  
>  #define CMD_SIZE		512
> +/* SMC is only supported in SPMIN for STM32MP15x */
> +#ifdef CONFIG_STM32MP15x
>  #define OTP_SIZE_SMC		1024
> +#else
> +#define OTP_SIZE_SMC		0
> +#endif
>  #define OTP_SIZE_TA		776
>  #define PMIC_SIZE		8
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
