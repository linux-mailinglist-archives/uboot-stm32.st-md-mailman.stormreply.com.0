Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B69F68A7EFB
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Apr 2024 11:01:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78D4DC6B444;
	Wed, 17 Apr 2024 09:01:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3308CC69067
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 09:01:29 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43H7Ks3F006448; Wed, 17 Apr 2024 11:01:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=eePrvQLFatpq8FWqq4fIvhSkuc0lsXUFqHieMxvM7Jc=; b=1a
 /dAAv6CFXRxXQdy06BLvJsXRYDO5MSTH3kOSHFE8UvF7P25jpy4A3zsQKmY1htPc
 yINevU0PO3w3i71KX0LoZPeHDkpOI45lKtV7X1PT1gkdZatdQToCbld4rGeFyQxm
 uMLHspREesdnmmMKxnCISqLRD6oPaKZMmASZBSK7ilfHEzqbYRM+lLDSHnToiPuc
 IprUpz9tiUCcQN/UmgUpv6CWfebdxwpSvibBSY4rOZ+is9SdR93+/5fb6WzUqJls
 0mobSOwhMZZLsxBQrlLc4TBG/5Uyrh2OqrNPA8MdICrS3ndNGOjZF01fluRcE7e+
 r0XsVgEh/wrKsxCl1JVw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xffffh584-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2024 11:01:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 52C9440049;
 Wed, 17 Apr 2024 11:01:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7FB5F20D416;
 Wed, 17 Apr 2024 11:00:42 +0200 (CEST)
Received: from [10.48.86.112] (10.48.86.112) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 11:00:41 +0200
Message-ID: <9577dc11-5018-4b12-913c-27d00ce92dee@foss.st.com>
Date: Wed, 17 Apr 2024 11:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20240308135009.2621719-1-patrice.chotard@foss.st.com>
 <20240308135009.2621719-3-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240308135009.2621719-3-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, u-boot@dh-electronics.com,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: Fix partition node
 name for stm32mp15xx-dhcom-u-boot
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

On 3/8/24 14:50, Patrice Chotard wrote:
> Fix flash@0 partition node name with correct offset.
>
> Fixes: 90f992e6a58c ("arm: dts: stm32: Add partitions in flash0 and nand
> node for stm32mp15xx-dhcom/dhcor")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> index 2f70b0690d2..1b445619325 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> @@ -106,15 +106,15 @@
>   			label = "fsbl2";
>   			reg = <0x00040000 0x00040000>;
>   		};
> -		partition@500000 {
> +		partition@80000 {
>   			label = "uboot";
>   			reg = <0x00080000 0x00160000>;
>   		};
> -		partition@900000 {
> +		partition@1e0000 {
>   			label = "env1";
>   			reg = <0x001E0000 0x00010000>;
>   		};
> -		partition@980000 {
> +		partition@1f0000 {
>   			label = "env2";
>   			reg = <0x001F0000 0x00010000>;
>   		};



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
