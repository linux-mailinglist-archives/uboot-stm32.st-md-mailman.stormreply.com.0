Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFE4294DB7
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 15:38:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B88CCC3FAE0;
	Wed, 21 Oct 2020 13:38:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24FFBC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 13:38:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LDbBie014350; Wed, 21 Oct 2020 15:38:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=kD0c5pWnHpy83igYHvqfdOfJ7J9aZgTTVcrQ6vbBPtY=;
 b=C6n/2TAAlikiRnAivYrGDBKyikJ1ST5P9uJ/rEEk75amSGk4oIPB9v4WvOhIp8NBI2MS
 1TGKMAcUYEO7biQLKfZp8NLbsiVmGZRBWhPdH8OidRsbIIBwiQdM07x7hP4DwbDbgGFa
 VM6fCYH7NJDjk2TA7NPpmONe0wejLJSDLidr9MFNDkXpNxeLJIacbcBX13oT9e52miRm
 g41sV2c645+s6lCwFGBEDF6t3i0kOms+MU2EFIIrlEx7VVwj2yDuIhhktTcPoR4A9nC4
 m8sBIHU86N8hkxFezL0hCbFIkqZDiw0YfL+/9WB/WPjOKmVpKicNC354YTZbLbYl6GzM rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347nr8kdxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 15:38:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 518CE10002A;
 Wed, 21 Oct 2020 15:38:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 401DF2D150E;
 Wed, 21 Oct 2020 15:38:43 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 15:38:42 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 15:38:42 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] arm: stm32: cleanup arch gpio.h
Thread-Index: AQHWmLTX9XDXHP0nWEueHNzwYAnE2KmiLXOA
Date: Wed, 21 Oct 2020 13:38:42 +0000
Message-ID: <455a210fc6514349b63b8f3ad14c0ae2@SFHDAG2NODE3.st.com>
References: <20201002120854.22557-1-patrick.delaunay@st.com>
In-Reply-To: <20201002120854.22557-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_06:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32: cleanup arch gpio.h
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
> Sent: vendredi 2 octobre 2020 14:09
> 
> Cosmetic update of gpio.h:
> - remove enumerate: stm32_gpio_port, stm32_gpio_pin
>   because STM32_GPIO_XXX values are unused
> - move STM32_GPIOS_PER_BANK in stm32_gpio.c
>   as its value is IP dependent and not arch dependent
> 
> No functional change as number of banks and number of gpio by banks is
> managed by device tree since since DM migration and commit 8f651ca60ba1
> ("pinctrl: stm32: Add get_pins_count() ops").
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/include/asm/arch-stm32/gpio.h    | 37 ++---------------------
>  arch/arm/mach-stm32mp/include/mach/gpio.h | 37 ++---------------------
>  drivers/gpio/stm32_gpio.c                 |  2 ++
>  3 files changed, 6 insertions(+), 70 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
