Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226C52E56B
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:55:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E4BAC56630;
	Fri, 20 May 2022 06:55:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F0F5C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:55:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K1DdZ1009064;
 Fri, 20 May 2022 08:55:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KTuH/aKJWwsblFeA5dglOZX2zobv4Ta5ylktz7aAi40=;
 b=sn8rhEy1ykO+GJWPYg/8QUvjXVME59Ld4RslN1b54RDqYav8Zcw7b6opQQo4luLMzkKb
 Nn7AD1FuNAqpfEOlXnp/IIBFdIGSK5Fa9yPFIiv1UdUO+U48HA9VzXn5WsYYb7/3d/ha
 xRU399dTnHIe2LW+KkXB0Jy8MBJrFEFVxgwor9x/17ORRkZVx4zer/b3jnVOKmDwvCkc
 K9YgX1QTVFe4gaqKr9a/zEz+zCgYzFEvQP9BSAeXh4iJx0OpE9hVZsrBSGTkIZSTeMvG
 SjbysG0DOxggJa1jPTAhQScjfq62tWGt7ofeExmbSqJZZV3TKvjVWv6jfBzhLD5rDa9/ 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j9emn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:55:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A35510002A;
 Fri, 20 May 2022 08:55:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 418C82122F6;
 Fri, 20 May 2022 08:55:15 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:55:14 +0200
Message-ID: <368493a0-ec29-7d0a-ef33-9a6fba4b9823@foss.st.com>
Date: Fri, 20 May 2022 08:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.9.I202fcb973ba156e8df0d37ac7befbca1916e72af@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220506160540.9.I202fcb973ba156e8df0d37ac7befbca1916e72af@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 09/16] arm: stm32mp: support 2 MAC address
	for STM32MP13
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

On 5/6/22 16:06, Patrick Delaunay wrote:
> Add support of several MAC address in OTP (3 32bits OTP word for
> 2 MAC address) for SOCs in  STM32MP13x family: STM32MP133 and STM32MP135.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cpu.c                   | 41 ++++++++++++-------
>  .../arm/mach-stm32mp/include/mach/sys_proto.h |  1 +
>  arch/arm/mach-stm32mp/stm32mp13x.c            | 20 +++++++++
>  arch/arm/mach-stm32mp/stm32mp15x.c            |  5 +++
>  4 files changed, 52 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 240960ada4..855fc755fe 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -290,16 +290,18 @@ __weak int setup_mac_address(void)
>  {
>  	int ret;
>  	int i;
> -	u32 otp[2];
> +	u32 otp[3];
>  	uchar enetaddr[6];
>  	struct udevice *dev;
> +	int nb_eth, nb_otp, index;
>  
>  	if (!IS_ENABLED(CONFIG_NET))
>  		return 0;
>  
> -	/* MAC already in environment */
> -	if (eth_env_get_enetaddr("ethaddr", enetaddr))
> -		return 0;
> +	nb_eth = get_eth_nb();
> +
> +	/* 6 bytes for each MAC addr and 4 bytes for each OTP */
> +	nb_otp = DIV_ROUND_UP(6 * nb_eth, 4);
>  
>  	ret = uclass_get_device_by_driver(UCLASS_MISC,
>  					  DM_DRIVER_GET(stm32mp_bsec),
> @@ -307,22 +309,31 @@ __weak int setup_mac_address(void)
>  	if (ret)
>  		return ret;
>  
> -	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_MAC),
> -			otp, sizeof(otp));
> +	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_MAC), otp, 4 * nb_otp);
>  	if (ret < 0)
>  		return ret;
>  
> -	for (i = 0; i < 6; i++)
> -		enetaddr[i] = ((uint8_t *)&otp)[i];
> +	for (index = 0; index < nb_eth; index++) {
> +		/* MAC already in environment */
> +		if (eth_env_get_enetaddr_by_index("eth", index, enetaddr))
> +			continue;
> +
> +		for (i = 0; i < 6; i++)
> +			enetaddr[i] = ((uint8_t *)&otp)[i + 6 * index];
>  
> -	if (!is_valid_ethaddr(enetaddr)) {
> -		log_err("invalid MAC address in OTP %pM\n", enetaddr);
> -		return -EINVAL;
> +		if (!is_valid_ethaddr(enetaddr)) {
> +			log_err("invalid MAC address %d in OTP %pM\n",
> +				index, enetaddr);
> +			return -EINVAL;
> +		}
> +		log_debug("OTP MAC address %d = %pM\n", index, enetaddr);
> +		ret = eth_env_set_enetaddr_by_index("eth", index, enetaddr);
> +		if (ret) {
> +			log_err("Failed to set mac address %pM from OTP: %d\n",
> +				enetaddr, ret);
> +			return ret;
> +		}
>  	}
> -	log_debug("OTP MAC address = %pM\n", enetaddr);
> -	ret = eth_env_set_enetaddr("ethaddr", enetaddr);
> -	if (ret)
> -		log_err("Failed to set mac address %pM from OTP: %d\n", enetaddr, ret);
>  
>  	return 0;
>  }
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 829b3feebf..4b564e86dc 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -64,6 +64,7 @@ void get_soc_name(char name[SOC_NAME_SIZE]);
>  /* return boot mode */
>  u32 get_bootmode(void);
>  
> +int get_eth_nb(void);
>  int setup_mac_address(void);
>  
>  /* board power management : configure vddcore according OPP */
> diff --git a/arch/arm/mach-stm32mp/stm32mp13x.c b/arch/arm/mach-stm32mp/stm32mp13x.c
> index 38961310dc..8a56f381ce 100644
> --- a/arch/arm/mach-stm32mp/stm32mp13x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp13x.c
> @@ -51,6 +51,26 @@ u32 get_cpu_type(void)
>  	return (get_cpu_dev() << 16) | get_cpu_rpn();
>  }
>  
> +int get_eth_nb(void)
> +{
> +	int nb_eth = 2;
> +
> +	switch (get_cpu_type()) {
> +	case CPU_STM32MP131Dxx:
> +		fallthrough;
> +	case CPU_STM32MP131Cxx:
> +		fallthrough;
> +	case CPU_STM32MP131Axx:
> +		nb_eth = 1;
> +		break;
> +	default:
> +		nb_eth = 2;
> +		break;
> +	}
> +
> +	return nb_eth;
> +}
> +
>  void get_soc_name(char name[SOC_NAME_SIZE])
>  {
>  	char *cpu_s, *cpu_r;
> diff --git a/arch/arm/mach-stm32mp/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp15x.c
> index 800fad2f43..a093e6163e 100644
> --- a/arch/arm/mach-stm32mp/stm32mp15x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp15x.c
> @@ -247,6 +247,11 @@ u32 get_cpu_type(void)
>  	return (get_cpu_dev() << 16) | get_cpu_rpn();
>  }
>  
> +int get_eth_nb(void)
> +{
> +	return 1;
> +}
> +
>  /* Get Package options from OTP */
>  u32 get_cpu_package(void)
>  {

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
