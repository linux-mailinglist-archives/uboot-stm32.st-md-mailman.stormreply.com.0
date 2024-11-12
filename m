Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8584F9C568B
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2024 12:31:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39027C78F81;
	Tue, 12 Nov 2024 11:31:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0574FC78F7D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 11:31:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACBQMdB027234;
 Tue, 12 Nov 2024 12:31:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3BbhCyDKRyAhGY4Y9vVGoJ+Ital0rqEmVnz1YKWL/fA=; b=fL/ON0s4HpAILwe9
 j0QI1PCOv58LKACO/XhvI30hc4iGZbqkyBcafwEgo+P24inKcMzQR/RyPAKy/aXr
 Ly/7D5rQHX6FKBg1fj+mYqngCBbkaUy8sd3kaP33LbSgG6gS6GJmkI2VJ8NW0k4I
 X3RUlPhHlU3y3+8W/d+8d/SkqU0IxxwkK5dMo2zo5Vw6o7P18ut/3s6SyK/TJDOf
 UACV6VM/3eOrJQCnXmh7xm56stkx96QT0c4amSnnvVWH9pJTLZCjGjWqeI/9eRv4
 pGZzAbdBSVwEGuTSBLsM7ILE3NJeNg2ZZOYltOYs5j2ZLxnJ9L6cFD59LZO6CrFb
 YNgzpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42swr8utu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 12:31:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C884E40046;
 Tue, 12 Nov 2024 12:30:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D3D3129FAC8;
 Tue, 12 Nov 2024 12:29:50 +0100 (CET)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 12 Nov
 2024 12:29:50 +0100
Message-ID: <67aeed9c-73f5-462b-becd-7bb370a022d0@foss.st.com>
Date: Tue, 12 Nov 2024 12:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241021193522.195834-1-marex@denx.de>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241021193522.195834-1-marex@denx.de>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Drop remnants of
 upstream DT switch on DH STM32 DHSOM
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

On 10/21/24 21:34, Marek Vasut wrote:
> Remove unused local DT copies after the OF_UPSTREAM conversion.
>
> Fixes: cccb29fc1270 ("ARM: dts: stm32: Switch to using upstream DT on DH STM32 DHSOM")
> Reported-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/dts/stm32mp13xx-dhcor-som.dtsi       | 308 ------------------
>   .../arm/dts/stm32mp153c-dhcor-drc-compact.dts |  30 --
>   arch/arm/dts/stm32mp157a-dhcor-avenger96.dts  |  38 ---
>   3 files changed, 376 deletions(-)
>   delete mode 100644 arch/arm/dts/stm32mp13xx-dhcor-som.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp153c-dhcor-drc-compact.dts
>   delete mode 100644 arch/arm/dts/stm32mp157a-dhcor-avenger96.dts
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
