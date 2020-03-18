Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC8818990B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 11:16:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9474C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:16:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D3D9C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 10:16:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IA93Bf006244; Wed, 18 Mar 2020 11:16:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Ju/z+DxDu/8HTr5LSK1prfEdTRJ7OAdHuankxfgkqp8=;
 b=qnOI90VzjEGyiioCSj//duXNyVAd4SHh5pb1TXDPStJChQK5cgmKu1LebqcqcADCiY1z
 gLpRwX0xVRS8FDRf12jomuTE7/4CG9mlRdjX1fmjcD+r3aGflN/EJfLSMu5S5Q4CrRO8
 IIpQq1s2ZSEGTHkdeGyCq83a6ZKhtxB/v9L8sGfRiJZMypxLmFjy60fvCBOTR+7UlC1V
 5ljq2D1NM0jcwC55UoI44hvnu9jUWl3NI80S8QL+TVUQDOCAh7skFYLNbUxjEgmqmNYK
 udHgKQpeFeZ08rcqsJDAhAS44AvvjoYTaWYdDc25dNxn7QLe4Rnz1OPgjFvCWCwusAjc lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yua4wafju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 11:16:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3A88100034;
 Wed, 18 Mar 2020 11:16:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C94B021CA63;
 Wed, 18 Mar 2020 11:16:17 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 11:16:17 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 11:16:17 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 09/10] arm: stm32mp: add function get_soc_name
Thread-Index: AQHV4dOKPQd+z+jO8ECTymm4757+eqhOSBkA
Date: Wed, 18 Mar 2020 10:16:17 +0000
Message-ID: <f551f3c9-c7a9-3b1e-a9f3-ceb2e58c224a@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-10-patrick.delaunay@st.com>
In-Reply-To: <20200212183744.5309-10-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <E2A59F7FC198094BBCD39A76CE3DBD4C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 09/10] arm: stm32mp: add function
	get_soc_name
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


On 2/12/20 7:37 PM, Patrick Delaunay wrote:
> Add a function get_soc_name to get a string with the full name
> of the SOC "STM32MP15xxx Rev.x"
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/cpu.c                    | 14 +++++++++++---
>  arch/arm/mach-stm32mp/include/mach/sys_proto.h |  4 ++++
>  2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 5febed735c..9c5e0448ce 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -279,8 +279,7 @@ u32 get_cpu_package(void)
>  	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
>  }
>  
> -#if defined(CONFIG_DISPLAY_CPUINFO)
> -int print_cpuinfo(void)
> +void get_soc_name(char name[SOC_NAME_SIZE])
>  {
>  	char *cpu_s, *cpu_r, *pkg;
>  
> @@ -344,7 +343,16 @@ int print_cpuinfo(void)
>  		break;
>  	}
>  
> -	printf("CPU: STM32MP%s%s Rev.%s\n", cpu_s, pkg, cpu_r);
> +	snprintf(name, SOC_NAME_SIZE, "STM32MP%s%s Rev.%s", cpu_s, pkg, cpu_r);
> +}
> +
> +#if defined(CONFIG_DISPLAY_CPUINFO)
> +int print_cpuinfo(void)
> +{
> +	char name[SOC_NAME_SIZE];
> +
> +	get_soc_name(name);
> +	printf("CPU: %s\n", name);
>  
>  	return 0;
>  }
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index da46c11573..065b7b2856 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -29,6 +29,10 @@ u32 get_cpu_package(void);
>  #define PKG_AC_TFBGA361	2
>  #define PKG_AD_TFBGA257	1
>  
> +/* Get SOC name */
> +#define SOC_NAME_SIZE 20
> +void get_soc_name(char name[SOC_NAME_SIZE]);
> +
>  /* return boot mode */
>  u32 get_bootmode(void);
>  

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
