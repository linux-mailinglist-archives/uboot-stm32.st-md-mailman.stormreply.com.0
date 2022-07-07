Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD01E569AB8
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 08:50:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70A77C0D2BF;
	Thu,  7 Jul 2022 06:50:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0492DC03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 06:49:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267689Lu004639;
 Thu, 7 Jul 2022 08:49:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kK5+OloJMlJTM1o/OkVzyQQHT8BlrCWSBnePR61a95s=;
 b=1exvGC+LDrROnKUCtHdnn+VUarV0Qjsq23YL84FXoX5o+NyuHK9UrstoYDVqNdJy+dTO
 8l9UME2a6+jjSHq5rSfp2Ppo4+Kv5OD4AlVyq7bAomMtsKn8CtWs0KI/LHIZtMzrWEkh
 QrIKna6nhVvNc1DQsjJwcW4KXMU24AgLdL2OuJJFEWXVuq7UrW1A5GIO3sZTPkj/M3WL
 UmeTk+ql5s6wkNB13twqaXXR7q9VLGY1M6VHn9oVaIF+pj3UXqHlT/l71BHSrea4519K
 r07QYdi9PRJHN5p1RI3dANNNDdVar5s1MEJq+CEjVgcDamLqTxQD5kOsN1PN+IioaRGr 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ub43fj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 08:49:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4523710002A;
 Thu,  7 Jul 2022 08:49:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40E6B20B3A9;
 Thu,  7 Jul 2022 08:49:58 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 08:49:57 +0200
Message-ID: <471c98f6-1efc-9453-f814-0baa38517a7e@foss.st.com>
Date: Thu, 7 Jul 2022 08:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220620094959.1.I4d177d06061a5973e5cd25d2b61e74fdb2861a2a@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220620094959.1.I4d177d06061a5973e5cd25d2b61e74fdb2861a2a@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_04,2022-06-28_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: simplify the STM32MP15x package
	parsing code
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

On 6/20/22 09:50, Patrick Delaunay wrote:
> Simplify the package parsing code for STM32MP15X as package can be
> affected with get_cpu_package() result.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/stm32mp15x.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp15x.c
> index a093e6163e6..660c907a6ba 100644
> --- a/arch/arm/mach-stm32mp/stm32mp15x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp15x.c
> @@ -274,7 +274,6 @@ static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
>  	u32 cpu_type = get_cpu_type();
>  	u32 ct = cpu_type & ~(BIT(7) | BIT(0));
>  	u32 cm = ((cpu_type & BIT(7)) >> 6) | (cpu_type & BIT(0));
> -	u32 cp = get_cpu_package();
>  
>  	/* Bits 0 and 7 are the ACDF, 00:C 01:A 10:F 11:D */
>  	switch (ct) {
> @@ -293,17 +292,9 @@ static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
>  	}
>  
>  	/* Package */
> -	switch (cp) {
> -	case STM32MP15_PKG_AA_LBGA448:
> -	case STM32MP15_PKG_AB_LBGA354:
> -	case STM32MP15_PKG_AC_TFBGA361:
> -	case STM32MP15_PKG_AD_TFBGA257:
> -		*pkg = cp;
> -		break;
> -	default:
> -		*pkg = 0;
> -		break;
> -	}
> +	*pkg = get_cpu_package();
> +	if (*pkg > STM32MP15_PKG_AA_LBGA448)
> +		*pkg = STM32MP15_PKG_UNKNOWN;
>  
>  	/* Revision */
>  	switch (get_cpu_rev()) {
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
