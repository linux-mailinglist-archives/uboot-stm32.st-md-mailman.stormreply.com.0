Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 290E450B202
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:49:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1F78C60496;
	Fri, 22 Apr 2022 07:49:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 421D3C60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:49:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23LNcpxa020081;
 Fri, 22 Apr 2022 09:49:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=f02hvSqnqRnONS7CsylTDDudwO3l0fbo+s0v9sio8vU=;
 b=xmkh9lxH6F8UPzhqv4Nj5AJ3kPHLlNkisjS5157uY6UdPt0Q8ZC/Rion0yyxIwz1qh7p
 f9fe1O/wkbJs+W3NxiobqYZ+EFyMmk5sF/spm8Up3bJ5ZVO2LfGWQqbj0CHM7TAGdrIa
 DXf2BJ+8cHQNciMVl7cTV6RFkdj7S8BKgAfziG+mZbkP9x0ZhJeESKkgZq3EvAFiKaV6
 NWsx/oUXy1hl0SQQrF0ocNGzaxorvz3AglPmHu7Ooo5MaW+Nhq4VGZvtCL7ZAJ/+guhf
 vV3KgY5UnaAVQWt6PlGOQNZQ9/6gRMTDEqKb8kGWmgz4Q1toGNV9qO+2RsfEfM4g1t7l 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fh09m9362-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:49:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B630210002A;
 Fri, 22 Apr 2022 09:49:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE7E7216848;
 Fri, 22 Apr 2022 09:49:23 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:49:23 +0200
Message-ID: <5530a10f-27ea-1172-1293-2c1f023370a1@foss.st.com>
Date: Fri, 22 Apr 2022 09:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220415150041.1.I46d09f298319fd632eaee4cd8888d751b908f0e6@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220415150041.1.I46d09f298319fd632eaee4cd8888d751b908f0e6@changeid>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32mp: correctly handle Silicon
	revision
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

On 4/15/22 15:00, Patrick Delaunay wrote:
> Handle correctly the silicon revision = REV_ID[15:0] of Device Version
> and the associated device marking, A to Z on STMicroelectronics STM32MP
> SOCs.
> 
> This patch prepare the introduction of next STM32MP family,
> with STM32MP13x Rev.Z for REV_ID = 1.1.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cpu.c                    | 6 +++---
>  arch/arm/mach-stm32mp/include/mach/sys_proto.h | 9 +++++----
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 325d710100..0ad5f307db 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -432,13 +432,13 @@ static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
>  
>  	/* Revision */
>  	switch (get_cpu_rev()) {
> -	case CPU_REVA:
> +	case CPU_REV1:
>  		*rev = 1;
>  		break;
> -	case CPU_REVB:
> +	case CPU_REV2:
>  		*rev = 2;
>  		break;
> -	case CPU_REVZ:
> +	case CPU_REV2_1:
>  		*rev = 3;
>  		break;
>  	default:
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 4149d3a133..b91f98eb45 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -25,11 +25,12 @@ u32 get_cpu_type(void);
>  /* return CPU_DEV constants */
>  u32 get_cpu_dev(void);
>  
> -#define CPU_REVA	0x1000
> -#define CPU_REVB	0x2000
> -#define CPU_REVZ	0x2001
> +#define CPU_REV1	0x1000
> +#define CPU_REV1_1	0x1001
> +#define CPU_REV2	0x2000
> +#define CPU_REV2_1	0x2001
>  
> -/* return CPU_REV constants */
> +/* return Silicon revision = REV_ID[15:0] of Device Version */
>  u32 get_cpu_rev(void);
>  
>  /* Get Package options from OTP */

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
