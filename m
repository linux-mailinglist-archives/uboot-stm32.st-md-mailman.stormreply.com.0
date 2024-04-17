Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD3C8A7F3A
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Apr 2024 11:07:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C6A8C6DD67;
	Wed, 17 Apr 2024 09:07:07 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E24E8C6DD66
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 09:07:05 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43H6bagk008696; Wed, 17 Apr 2024 11:07:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=AaKVF67qHNnrmWHewUTFL6cryU6jxR+7E8D5YJyajgI=; b=YB
 6hiPxZKXQXiahJRfgW80tHBYAYpKCMwXmj6+7Uv85+xne0BaIOLuTilmY1IkUcFx
 oNPzMEvU6P/7LeRsIwL8WQEyfhwsKAXczJAFPC5ETsn/IUAg/WTmDzo2nZOT6i8k
 BDkc0L15qRLYuZxGg6v6lBAHGabXLOewRf8HO+IYihPOVKheQuwUtJv481WC9ie2
 v1DXL6/DTMLoz9z5408Qa7HCNggvx4pWjYZsJANFfHAEXIQbIdt0p46hu6vRS/cg
 PcSHu1/yc2Ok6ZWwvpYTrwHhbd7RKf4zBwb/KgXGmaHG0yN5pv1s4+gj+61Lqvz0
 VLpYDbGnjugMJ9d6MF3g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg50hxang-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2024 11:07:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 367BF4002D;
 Wed, 17 Apr 2024 11:07:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7CDB22105B9;
 Wed, 17 Apr 2024 11:06:47 +0200 (CEST)
Received: from [10.48.86.112] (10.48.86.112) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 11:06:47 +0200
Message-ID: <c7cd7bb9-d0a9-4e25-92d3-51aba895a54b@foss.st.com>
Date: Wed, 17 Apr 2024 11:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-9-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240409150215.2497778-9-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 08/25] ARM: dts: stm32: Don't probe
 led-red/led-blue at boot for stm32mp135f-dk-u-boot
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

On 4/9/24 17:01, Patrice Chotard wrote:
> led-red and button dedicated to fastboot share the same gpio GPIOA13.
> led-blue and button dedicated to stm32prog share the same gpio GPIOA14.
> Led driver is probed early so the corresponding gpio is taken and
> configured in output which forbid fastboot and stm32prog button usage.
>
> To avoid this, remove the "default-state" property from led-red and
> led-blue led's node.
>
> This will avoid to trigger the led driver probe() to configure the led
> default state during startup.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp135f-dk-u-boot.dtsi | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
