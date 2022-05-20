Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F1C52E511
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:32:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A2D8C56630;
	Fri, 20 May 2022 06:32:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A131BC5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:32:33 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K2kHWV004572;
 Fri, 20 May 2022 08:32:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oxyKRYZ84hXq1Cz7QMoiVjYmau5TY60dmAw0OK0lgOY=;
 b=y+L7J29DKg+nF5er3g6Spy7CI1chLZ4MedufkBRWWFeB3d06n69qJBhrF8Z0jESyEn6P
 zNC6KFY6dF/DwzGUrzJ5XO2yJVdE8dCr7n9p8oo0xa/UJyVUxflP6+xZDZiwt5X+VdVW
 Q0HCzCt5Mxsh2FbdBPu9+Utpo2OmO3/4EbKEzwgjwtnTPgjHjs7I8IX8xBE63mvWDk86
 t3ndHhpSJoZf8PMBnfBnUGIHA512DlvpNrq1xwn/Zv1EVTRefzfNKSJ90n494MSrRBWF
 UrdLLMsQf5sSRkdte+3POyN7bffSDPGHAx+9qR9UIWtEG3UW91dQhB1LSxiEsx6LXW4D VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21umahm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:32:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF50A10002A;
 Fri, 20 May 2022 08:32:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D84FB20F2A8;
 Fri, 20 May 2022 08:32:31 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:32:31 +0200
Message-ID: <65971db1-ecd2-314e-5280-97ed39c52556@foss.st.com>
Date: Fri, 20 May 2022 08:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.3.I64f8491d095549bcba2adf2bfa962c50ecca7874@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220506160540.3.I64f8491d095549bcba2adf2bfa962c50ecca7874@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 03/16] arm: stm32mp: move the get_otp
 helper function in bsec
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

On 5/6/22 16:06, Patrick Delaunay wrote:
> As the get_otp() helper function in bsec are common for all STM32MP family,
> move this function in bsec driver
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/bsec.c                   | 17 +++++++++++++++++
>  arch/arm/mach-stm32mp/cpu.c                    | 17 -----------------
>  arch/arm/mach-stm32mp/include/mach/sys_proto.h |  3 +++
>  3 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index 506caa0a31..c00130b08b 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -632,3 +632,20 @@ bool bsec_dbgswenable(void)
>  
>  	return false;
>  }
> +
> +u32 get_otp(int index, int shift, int mask)
> +{
> +	int ret;
> +	struct udevice *dev;
> +	u32 otp = 0;
> +
> +	ret = uclass_get_device_by_driver(UCLASS_MISC,
> +					  DM_DRIVER_GET(stm32mp_bsec),
> +					  &dev);
> +
> +	if (!ret)
> +		ret = misc_read(dev, STM32_BSEC_SHADOW(index),
> +				&otp, sizeof(otp));
> +
> +	return (otp >> shift) & mask;
> +}
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 0ad5f307db..6f44c75515 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -349,23 +349,6 @@ u32 get_cpu_rev(void)
>  	return (read_idc() & DBGMCU_IDC_REV_ID_MASK) >> DBGMCU_IDC_REV_ID_SHIFT;
>  }
>  
> -static u32 get_otp(int index, int shift, int mask)
> -{
> -	int ret;
> -	struct udevice *dev;
> -	u32 otp = 0;
> -
> -	ret = uclass_get_device_by_driver(UCLASS_MISC,
> -					  DM_DRIVER_GET(stm32mp_bsec),
> -					  &dev);
> -
> -	if (!ret)
> -		ret = misc_read(dev, STM32_BSEC_SHADOW(index),
> -				&otp, sizeof(otp));
> -
> -	return (otp >> shift) & mask;
> -}
> -
>  /* Get Device Part Number (RPN) from OTP */
>  static u32 get_cpu_rpn(void)
>  {
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index b91f98eb45..dc98f0c5a4 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -52,3 +52,6 @@ int setup_mac_address(void);
>  
>  /* board power management : configure vddcore according OPP */
>  void board_vddcore_init(u32 voltage_mv);
> +
> +/* helper function: read data from OTP */
> +u32 get_otp(int index, int shift, int mask);
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
