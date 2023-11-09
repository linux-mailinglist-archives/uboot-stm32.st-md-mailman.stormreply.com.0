Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7148E7E665A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Nov 2023 10:13:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34ABEC6B47A;
	Thu,  9 Nov 2023 09:13:12 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CB6AC6B463
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 09:13:10 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3A96Y6Ps015577; Thu, 9 Nov 2023 10:13:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=MRuBTSA6FMNyLKixylXWrZf1Jal3ju6ohhof0RgI8v0=; b=iE
 0cg5JtqAD9uZC+NIesBhMmByQcKDwaT/xP9NgWHIjFGGycciR6zPQ7MQhNGEzGJy
 ymbqZjFJoGURVOazVRmpFQx73sMQim0Da1xCmUqZmnIvMMe3cOzXFxL2Wca0mY80
 HWQyx0cG2mjeY70q5bbwrEBOmmKNUukIDcRLrNL/bOFSRQvyuzshWRp9Mowoy6gQ
 S7vbLJ39qXOYXKMz1nbIEGeUxZ/j8RcxYBvi/XYLxqlSsy8BqGP0X6ENwoyRv/Y5
 cMQdUz17ydTQ5hvaHNVAZF7NKBoc4ewR7Kxt86CGJSXTHSjs2XBBHMAydY09d8ax
 VLqXFdj4dhkdk0jh3AJQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u7w22fk3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 10:13:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3639410005E;
 Thu,  9 Nov 2023 10:13:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F58E2073DE;
 Thu,  9 Nov 2023 10:13:09 +0100 (CET)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 9 Nov
 2023 10:13:08 +0100
Message-ID: <473399db-ac71-4cdc-9f2c-fe2b2645d9d5@foss.st.com>
Date: Thu, 9 Nov 2023 10:13:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-4-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20231027144304.1002307-4-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_07,2023-11-08_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v1 3/9] stm32mp: dram_init: Fix AARCH64
 compilation warnings
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,


On 10/27/23 16:42, Patrice Chotard wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>
> When building with AARCH64 defconfig, we got warnings for debug
> message
> - format '%x' expects argument of type 'unsigned int',
>     but argument 3 has type 'size_t' {aka 'long unsigned int'}).
> - format '%lx' expects argument of type 'long unsigned int',
>    but argument 2 has type 'phys_addr_t' {aka 'long long unsigned
>    int'}
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/dram_init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
> index a1e77a42e4f..cb35ed60ca1 100644
> --- a/arch/arm/mach-stm32mp/dram_init.c
> +++ b/arch/arm/mach-stm32mp/dram_init.c
> @@ -36,7 +36,7 @@ int dram_init(void)
>   		log_debug("Cannot get RAM size: %d\n", ret);
>   		return ret;
>   	}
> -	log_debug("RAM init base=%lx, size=%x\n", ram.base, ram.size);
> +	log_debug("RAM init base=%p, size=%zx\n", (void *)ram.base, ram.size);
>   
>   	gd->ram_size = ram.size;
>   


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
