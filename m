Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C9B2C3DA5
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 11:32:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03F71C424AF;
	Wed, 25 Nov 2020 10:32:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ACDEC36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 10:32:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0APAVu1J017725; Wed, 25 Nov 2020 11:31:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=37VLLBYGUTWFPKI1bOtze2vrNGu0S8WLL8FEUKHHs8c=;
 b=pTAhB9V1LuNzqXV2X1WaKCyWhvG6AavYnGIQ+IHrhWmIWnp+s21V8ZKslrT33K3+s9xA
 3UmQcMrkVh/sg1ZpYoRXsUpWczo5PUbcBR44EPpxAm7KbnpS8atHnAlezkdMY69ZLGLt
 7b0waiBLZvH4Eavt7XmCTBI55ToqrKl2pmZyU0GrYVXt39XoXJecM8QPR5XugZFZht2Y
 ORftXp922vAvDt7Y8XkOD0c5OQQOX8ITu8sCw3iOO3rcJNAitp6iIstonSwakhfeW1ih
 xF5L9FrimsrwonySp/JmW4kBXjUbLRJLw5wIST9ndmzXfiM6lesDyF3M26uJpLpgR2J9 WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0hjfs7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 11:31:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B6F610002A;
 Wed, 25 Nov 2020 11:31:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2122B2348AA;
 Wed, 25 Nov 2020 11:31:50 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 11:31:49 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 11:31:49 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/3] remoteproc: stm32: use reset for hold boot
Thread-Index: AQHWovNEiofZLF1kGkmK+YmAAQLMa6nY5i7A
Date: Wed, 25 Nov 2020 10:31:49 +0000
Message-ID: <daaff37eccaf4325946ebb0272d538d7@SFHDAG2NODE3.st.com>
References: <20201015150101.1.Ic4f6a36fa0594203b3f994a9e1d48143b420f072@changeid>
 <20201015130115.14470-1-patrick.delaunay@st.com>
In-Reply-To: <20201015130115.14470-1-patrick.delaunay@st.com>
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
Subject: Re: [Uboot-stm32] [PATCH 2/3] remoteproc: stm32: use reset for hold
	boot
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
> To: u-boot@lists.denx.de
> Cc: Patrick DELAUNAY <patrick.delaunay@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> Patrice CHOTARD <patrice.chotard@st.com>; U-Boot STM32 <uboot-stm32@st-
> md-mailman.stormreply.com>
> Subject: [PATCH 2/3] remoteproc: stm32: use reset for hold boot
> Importance: High
> 
> Use the reset function to handle the hold boot bit in RCC with device tree handle
> with MCU_HOLD_BOOT identifier.
> 
> This generic reset allows to remove the two specific properties:
> - st,syscfg-holdboot
> - st,syscfg-tz
> 
> This patch prepares alignment with kernel device tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: Fabien DESSENNE <fabien.dessenne@st.com>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> ---
> 
>  arch/arm/dts/stm32mp15-u-boot.dtsi |  7 +++
>  drivers/remoteproc/stm32_copro.c   | 93 ++++++++----------------------
>  2 files changed, 32 insertions(+), 68 deletions(-)
> 


Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
