Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 033FA52E507
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:30:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1CBCC03FEB;
	Fri, 20 May 2022 06:30:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADEABC03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:30:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JN8urn012162;
 Fri, 20 May 2022 08:30:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xt9qwo4C+UBJc8TEwsxq5PodmxasNQ+dmZpD7ax5luE=;
 b=SQ4YZbv80mVY3RgblDi0MjLNg30AZq48mH0PFpKuX/EVfW0F+OVSJtBmYaztHzYOwR4c
 n9jgioEXaIZD+nP4h88LerK1hB3F/+H14YQKiWXZ9FYbjUbgzd5d2nfClTzc8l1aiv64
 5raSO4wIgYMMbM6WhQPIQ++1Zwol+aHzwc07+GlHRLn70tYiEHWjb5sus76RIkX+AxGv
 6bYKc1JObQw8NEGtTQHPMAtQBKqoM8dTDpqkroT9EQ/eE6rpdkWH93CYwAuE1sbVH+Bi
 JWTUiQaBSgqm6IOawd4XeZMmYk4l0SLLLxcH6UAdbADuVCK9u+BzNXGUPJXxcDKz4s1/ yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21umah81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:30:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A17510002A;
 Fri, 20 May 2022 08:30:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63D2F211F02;
 Fri, 20 May 2022 08:30:20 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:30:19 +0200
Message-ID: <04eb90a8-6e73-40d8-9c55-83796c37d0ff@foss.st.com>
Date: Fri, 20 May 2022 08:30:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220519090726.1.I90e5b703cfebfe4c411fc13420155b9f9cfb0380@changeid>
 <20220519090726.2.I068deb9d25affb555ab29b06a0ff3a0ee9e94325@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220519090726.2.I068deb9d25affb555ab29b06a0ff3a0ee9e94325@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: engicam: stm32mp1: convert to
	livetree
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

On 5/19/22 09:07, Patrick Delaunay wrote:
> Replace gd->fdt_blob access with fdt_getprop() function to the
> function ofnode_get_property() to support a live tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/engicam/stm32mp1/stm32mp1.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/board/engicam/stm32mp1/stm32mp1.c b/board/engicam/stm32mp1/stm32mp1.c
> index 20d8603c78..0a3e580f5b 100644
> --- a/board/engicam/stm32mp1/stm32mp1.c
> +++ b/board/engicam/stm32mp1/stm32mp1.c
> @@ -14,8 +14,6 @@
>  #include <asm/arch/sys_proto.h>
>  #include <power/regulator.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int checkboard(void)
>  {
>  	char *mode;
> @@ -28,8 +26,8 @@ int checkboard(void)
>  		mode = "basic";
>  
>  	printf("Board: stm32mp1 in %s mode", mode);
> -	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
> -				 &fdt_compat_len);
> +	fdt_compat = ofnode_get_property(ofnode_root(), "compatible",
> +					 &fdt_compat_len);
>  	if (fdt_compat && fdt_compat_len)
>  		printf(" (%s)", fdt_compat);
>  	puts("\n");

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
