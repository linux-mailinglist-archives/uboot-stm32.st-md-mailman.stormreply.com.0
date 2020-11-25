Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3802C3DBD
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 11:34:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAE6CC424AF;
	Wed, 25 Nov 2020 10:34:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA532C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 10:34:16 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0APAW4jk022535; Wed, 25 Nov 2020 11:34:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ThoiucinaLbdp6n7CDFaIz+1WccxJrGJGNSIXpL3w08=;
 b=AdjvPzeYd8+9nhktfrmHig0MgjshzrcwWIrPgXnDzIdkRFngVLJUoafxq0/s9KNYVAPy
 n+gcfYsYZg6Vg4eFnezatkAsvX6r69+ltIUW2Ts2DhFXgQdjCho1oHhhckr1WI2ltiQt
 a5t+xvPp+YC/p1qd9BOMwis7YKVrSc3jC4YD6h49sbpG7D5a4+3CQa/uqxZsw2KbiOA0
 J7HgRsYQmF9H9XSP306NkZdu/HfqafjxDTt6kRKrr6XNotM7BSQCSrXGim6XU2KVwAEk
 O5KHPj84LBa8FHshL0PTI7VMk162RZLGErF7uVlb9x0RSYbuMhIJN1E956wIO30xyOQh Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01cnc73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 11:34:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1EFF410002A;
 Wed, 25 Nov 2020 11:34:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12E172348AB;
 Wed, 25 Nov 2020 11:34:10 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG1NODE1.st.com
 (10.75.127.1) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 11:34:09 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 11:34:09 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/3] reset: stm32: Add support of MCU HOLD BOOT
Thread-Index: AQHWovND4UCTTIVUi0uhAy5XJussa6nY5vnA
Date: Wed, 25 Nov 2020 10:34:09 +0000
Message-ID: <5eefa272bef54412be20e5d47296cc21@SFHDAG2NODE3.st.com>
References: <20201015150101.1.Ic4f6a36fa0594203b3f994a9e1d48143b420f072@changeid>
In-Reply-To: <20201015150101.1.Ic4f6a36fa0594203b3f994a9e1d48143b420f072@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_06:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] reset: stm32: Add support of MCU HOLD
	BOOT
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
> Sent: jeudi 15 octobre 2020 15:01
> 
> Handle the register RCC_MP_GCR without SET/CLR registers but with a direct
> access to bit BOOT_MCU:
> - deassert => set the bit: The MCU will not be in HOLD_BOOT
> - assert => clear the bit: The MCU will be set in HOLD_BOOT
> 
> With this patch the RCC driver handles the MCU_HOLD_BOOT_R value added in
> binding stm32mp1-resets.h
> 
> Cc: Fabien DESSENNE <fabien.dessenne@st.com>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/reset/stm32-reset.c                 | 17 +++++++++++++----
>  include/dt-bindings/reset/stm32mp1-resets.h |  1 +
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
