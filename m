Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BA03FFBF3
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Sep 2021 10:29:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BAA9C06B6C;
	Fri,  3 Sep 2021 08:29:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ED7AC58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Sep 2021 08:29:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1831nBv5016551;
 Fri, 3 Sep 2021 10:29:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XkogLwkkic7s1P1ok7L02mqEy84F4GtBaMqBNDVWavI=;
 b=T51tnSn9/3cmhpa08qmvRG18dDbok1rd6AIViLO7NqKYlNDGLPjpP9GtO+fiNq4lLrts
 3ucX0yFmWvxA9XkKg+Gm6knXaM1WmtCOjIEcBThkVE2zjndyyFf/MyPtvjz8jHH4x+DL
 fm1oWUeBPVtCz68KX+mki/vn0RVeUkRMLzzlNFDIBlER57HvgdmSZtc/bTpkKTR9noF+
 IXaDz1Ptxi0fmKS2RgHJu37iEzW35KCe5YtQjy79Wc2KSgr2z62ZfwarU8DnZj17n/2a
 GvseSjnocFToB0qqvVsnp5co9da3cj6iLqwspnofX0Ecs25E/ufV0sc0oBOdwE9MyYb+ 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3auacm9wnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 10:29:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F4B410002A;
 Fri,  3 Sep 2021 10:29:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 469A5216EE0;
 Fri,  3 Sep 2021 10:29:03 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Sep
 2021 10:29:02 +0200
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210901075602.17345-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <8a3a32e8-bd0c-9ac0-3290-482396c532de@foss.st.com>
Date: Fri, 3 Sep 2021 10:29:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901075602.17345-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-03_02,2021-09-03_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: Fix board_get_usable_ram_top()
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

Hi Patrice,

On 9/1/21 9:56 AM, Patrice Chotard wrote:
> When booting in EFI, lib/efi_loader/efi_memory.c calls
> board_get_usable_ram_top(0) which returns by default
> gd->ram_base + gd->ram_size which is the top of DDR.
>
> In case of OPTEE boot, the top of DDR is currently reserved by OPTEE,
> board_get_usable_ram_top(0) must return an address outside OPTEE
> reserved memory.
>
> gd->ram_top matches this constraint as it has already been initialized
> by substracting all DT reserved-memory (included OPTEE memory area).
>
> Fixes: 92b611e8b003 ("stm32mp: correctly handle board_get_usable_ram_top(0)")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/dram_init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
> index 94f25f34e0..920b99bb68 100644
> --- a/arch/arm/mach-stm32mp/dram_init.c
> +++ b/arch/arm/mach-stm32mp/dram_init.c
> @@ -47,7 +47,7 @@ ulong board_get_usable_ram_top(ulong total_size)
>   	struct lmb lmb;
>   
>   	if (!total_size)
> -		return gd->ram_base + gd->ram_size;
> +		return gd->ram_top;
>   
>   	/* found enough not-reserved memory to relocated U-Boot */
>   	lmb_init(&lmb);
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
