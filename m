Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2CD2C3C3A
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 10:35:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C145C5662F;
	Wed, 25 Nov 2020 09:35:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45CB6C32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 09:35:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AP9QlLF027703; Wed, 25 Nov 2020 10:35:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=1m7dwEyyzECtm4nstO4lBbV/NI64h35NJv1XBrNyAbM=;
 b=r4QcljMORL28dSxZ8RkqfRp4UHGIzMtnTL9r5H3TXWefK72MBqplAc9qsabxXifRWtER
 xRyoik2lbxdbi7VO14AUfrh2ut2cBmx1izovY0g7XCYGx4R1+1Xi7R/qgJ6R/og4dRvw
 wLHUfzTWwQPVY4KeY/tUXDYl5vIP3X2RnLLTTJjAtiVCw+6u7ifvC+szCRXTqqsUXE00
 YpxK5Fd4R/z1Vk3c5tbfFr9gKo4GxCEnYeHEZg2VTgxobhMqc8NtmBPxGUTHN96b55af
 LC1A9WpkwM1H9XeR5UpXQdY1hsIv+gzhIDHlecFPQa1hmOUVf0vfvcIVu2o54P2RW+1P 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fgyf9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 10:35:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79A0110002A;
 Wed, 25 Nov 2020 10:35:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 69C93230CEA;
 Wed, 25 Nov 2020 10:35:22 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 10:35:22 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 10:35:22 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] arm: stm32mp: correct the ALIGN macro usage
Thread-Index: AQHWsoOYgWK/NqTCbEmSj3D20fBw1anYt2ng
Date: Wed, 25 Nov 2020 09:35:22 +0000
Message-ID: <575bf4bdcf874533b58c1bc237d21906@SFHDAG2NODE3.st.com>
References: <20201104082209.6424-1-patrick.delaunay@st.com>
In-Reply-To: <20201104082209.6424-1-patrick.delaunay@st.com>
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
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: correct the ALIGN macro
	usage
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mercredi 4 novembre 2020 09:22
> 
> Correct the ALIGN macro usage in mmu_set_region_dcache_behaviour
> call: the address must use ALIGN_DOWN and size can use ALIGN macro.
> 
> With STM32_SYSRAM_BASE=0x2FFC0000 and
> MMU_SECTION_SIZE=0x100000 for STM32MP15x the computed address was
> 30000000 instead of 2ff00000.
> 
> Fixes: 43fe9d2fda24 ("stm32mp1: mmu_set_region_dcache_behaviour")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
