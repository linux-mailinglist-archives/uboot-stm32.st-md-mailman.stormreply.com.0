Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4322C3BC1
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 10:14:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 759BAC56630;
	Wed, 25 Nov 2020 09:14:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD725C424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 09:14:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AP9DBUT002800; Wed, 25 Nov 2020 10:13:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=epNn/dpmJvk/LgxkSJc3rPWPV8i9kHgRx4CUbCJya5o=;
 b=WJNX5lRAfGOAbAEiw8SLBA3kWrPZfXDot5caL8qOh4tlNEe1mwwqWF+O3AAYBJZJJeEa
 xlPrl89z0rQZZsXiswTqgwmbvwAoRZsHC6Km6unCZnI+s1v3kbdSn4DThjuOjbFTN3y5
 8DnudrV8Fd/Dwi+nRq9VG2QhMQjRBe+Ay7iAHkhXKdejCK264Q+XCkwlwUXLHqKT6bKR
 1JKNorsB3Tuz7har36C3n7HmdYaEffYZGoXRLrArH46Tny6ir83SLa9rYBolSF+8/LUr
 MSrxWv2gnuwWdjBEOV4br2fhZ9KCNtOoGDMOUaZcdOpoS4KqUFVwTakQUBZDJ9HJ9cV4 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fgya19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 10:13:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E948510002A;
 Wed, 25 Nov 2020 10:13:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBE5923096C;
 Wed, 25 Nov 2020 10:13:45 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 10:13:45 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 10:13:45 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v1 1/4] ARM: dts: sync armv7-m.dtsi with kernel v5.10-rc1
Thread-Index: AQHWtAwmjFn2a43ESk+s+kVt9ax916nYrjpw
Date: Wed, 25 Nov 2020 09:13:45 +0000
Message-ID: <cc6c86f906ea4d9cb308697e64207e57@SFHDAG2NODE3.st.com>
References: <20201106071200.6933-1-patrice.chotard@st.com>
 <20201106071200.6933-2-patrice.chotard@st.com>
In-Reply-To: <20201106071200.6933-2-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_05:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/4] ARM: dts: sync armv7-m.dtsi with
	kernel v5.10-rc1
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

Hi Patrice

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 6 novembre 2020 08:12
> 
> Since kernel v4.8-rc1, commit 05b23ebc2bd9 ("ARM: dts: armv7-m: remove
> skeleton.dtsi include"), skeleton.dtsi file is no more included.
> 
> This synchronization is needed to avoid to get 2 memory node in DTB file if, in
> DTS file, memory node is declared with the correct syntax as following:
> 
> 	memory@90000000 {
>  		device_type = "memory";
>  		reg = <0x90000000 0x800000>;
>  	};
> 
> Then in DTB, we will have the 2 memory nodes, which is incorrect and cause
> misbehavior during DT parsing by U-boot:
> 
> 	memory {
> 		device_type = "memory";
> 		reg = <0x00 0x00>;
> 	};
> 
> 	memory@90000000 {
> 		device_type = "memory";
> 		reg = <0x90000000 0x800000>;
> 	};
> 
> Issue found when synchronizing MCU's STM32 DT from kernel v5.10-rc1.
> When using fdtdec_setup_mem_size_base() or fdtdec_setup_memory_banksize()
> API, first above memory node is found (with reg = <0x00 0x00>), so
> gd->ram_size, gd->ram_base, gd->bd->bi_dram[bank].start and
> gd->bd->bi_dram[bank].size are all set to 0 which avoid boards to boot.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  arch/arm/dts/armv7-m.dtsi | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm/dts/armv7-m.dtsi b/arch/arm/dts/armv7-m.dtsi index
> 31349da75a..26f5443d85 100644
> --- a/arch/arm/dts/armv7-m.dtsi
> +++ b/arch/arm/dts/armv7-m.dtsi
> @@ -1,5 +1,4 @@
> -#include "skeleton.dtsi"
> -
> +// SPDX-License-Identifier: GPL-2.0
>  / {
>  	nvic: interrupt-controller@e000e100  {
>  		compatible = "arm,armv7m-nvic";
> @@ -22,4 +21,3 @@
>  		ranges;
>  	};
>  };
> -
> --
> 2.17.1

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot-stm/master, thanks!

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
