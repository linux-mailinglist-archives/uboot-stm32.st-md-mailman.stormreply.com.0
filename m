Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89F6FBF21
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 May 2023 08:16:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41D43C6A602;
	Tue,  9 May 2023 06:16:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 383B1C65042
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 06:16:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3495B6li024462; Tue, 9 May 2023 08:16:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dgUYqRAqdC7hAyhjDcPo3H6Rzyh39Ke9O3NpRmtuRPE=;
 b=bfrgI61bJfuxZvfpR06rTp+oNrZS8b/nAKHOwKVusR6j3cqNrKZtcP3sdPmVCdajPnSS
 b9RPOEAhx9q6c62jS049Tb60xqTPURBNyliyMt2vMknsl0VE5DpZkYI1Tu0ETGZA3gcf
 n/eWOxIdQ6bRgnYnwbHbiTWEUriPdHKtwpy2G+Y68hn+VBw2wFWQXwoHQVPbXh3GVCE3
 +fdybdzviO/D145hzVJet6UiwB7Em4dJZP8ggaWK2++paOui6oLgDSuCl7QEkJUPkop/
 ocPj21SOhar1GEf0cDn3PvPbUAs2qaElP9c97iCmHiwaV8SJw1WMCY0RYCWllPSH9nnQ RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf787ad81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 08:16:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B0C4610002A;
 Tue,  9 May 2023 08:16:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9649210F6F;
 Tue,  9 May 2023 08:16:54 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 9 May
 2023 08:16:54 +0200
Message-ID: <266c59ea-3f93-f2c0-0e85-e101f4359087@foss.st.com>
Date: Tue, 9 May 2023 08:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230504195230.4973-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230504195230.4973-1-marex@denx.de>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_03,2023-05-05_01,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add missing header for
	save_boot_params
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

Hi Marek

On 5/4/23 21:52, Marek Vasut wrote:
> The get_stm32mp_rom_api_table() function is defined in sys_params.h ,
> add the missing header to avoid compiler warning.
> 
> Fixes: dbeaca79b79 ("ARM: stm32: Factor out save_boot_params")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/ecdsa_romapi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-stm32mp/ecdsa_romapi.c b/arch/arm/mach-stm32mp/ecdsa_romapi.c
> index 12b42b9d59c..93c561c69b1 100644
> --- a/arch/arm/mach-stm32mp/ecdsa_romapi.c
> +++ b/arch/arm/mach-stm32mp/ecdsa_romapi.c
> @@ -5,6 +5,7 @@
>   * Implements ECDSA signature verification via the STM32MP ROM.
>   */
>  #include <asm/system.h>
> +#include <asm/arch/sys_proto.h>
>  #include <dm/device.h>
>  #include <linux/types.h>
>  #include <u-boot/ecdsa.h>

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
