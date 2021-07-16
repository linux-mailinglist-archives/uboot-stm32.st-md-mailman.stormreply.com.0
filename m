Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC883CB440
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jul 2021 10:32:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5C57C59783;
	Fri, 16 Jul 2021 08:32:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8528C59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 08:32:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G8WGw2029065; Fri, 16 Jul 2021 10:32:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QTHhI3lXHNO35cREF/mysn8MQXsG+oQQbA3PM3Axlow=;
 b=lHc4YNfEsY/nz7rDeZgMBMFTEj0Sd0IwokCBw16mQTs4CmNKaNe+B0puLgI7qkz53Lpm
 jkWPOYdp1wUBXxorY6P3qRY+xOx06ZZP5VU0NKev+/JmLOPKJW62RnHnsTE68wW+fOrE
 2SSRvDcJ8+ZznltV4H0S0nkQSzYwHxqIoy4BSQRmeSKwsBHShnIY2xixJs7fv3LzqOBQ
 QKf6ENcjsKGi/0jOaMTkcbm5NLL6Ht1mMV3zqA/kB0Z4H/OUd38Rm36AR+m58wtNkRs8
 xn+ILQ/YPnXzDA6v5eT5tifyMnZ6W4Gng9Y72nmdV3GEht8AGmv1ODhiTtW0yy/MYG+h 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1gtn1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:32:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8C5A10002A;
 Fri, 16 Jul 2021 10:32:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9FDBD218CBB;
 Fri, 16 Jul 2021 10:32:12 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 10:32:12 +0200
To: <u-boot@lists.denx.de>
References: <20210706171943.1.Ie853cf4b81d27d0393e45bb183368c1318a5712e@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <9b9c5dcb-b091-6e77-0daf-263c131cd08b@foss.st.com>
Date: Fri, 16 Jul 2021 10:32:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706171943.1.Ie853cf4b81d27d0393e45bb183368c1318a5712e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] stm32mp: use device sequence number
 in boot_instance variable
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

On 7/6/21 5:19 PM, Patrick Delaunay wrote:
> Use the device sequence number in boot_instance variable
> and no more the SDMMC instance provided by ROM code/TF-A.
>
> After this patch we don't need to define the mmc alias in
> device tree, for example:
>    mmc0 = &sdmmc1;
>    mmc1 = &sdmmc2;
>    mmc2 = &sdmmc3;
> to have a correct mapping between the ROM code boot device =
> "${boot_device}${boot_instance}" and the MMC device in U-Boot.
>
> With this patch the 'mmc0' device (used in mmc commands) is
> always used when only one instance sdmmc is activated in device
> tree, even if it is only the sdmmc2 or sdmmc3.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Dependancy with [1] to have correct 'mmc' node name (sdmmc@ => mmc@)
> from kernel "ARM: dts: stm32: Rename mmc controller nodes to mmc@"
>
> [1] "arm: dts: stm32mp15: alignment with v5.13"
>      http://patchwork.ozlabs.org/project/uboot/list/?series=251100&state=*
>
>
>   arch/arm/mach-stm32mp/cpu.c                | 16 +++++++++-
>   arch/arm/mach-stm32mp/include/mach/stm32.h |  4 +++
>   board/st/stm32mp1/stm32mp1.c               | 35 +++++++++++++++++-----
>   3 files changed, 46 insertions(+), 9 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
