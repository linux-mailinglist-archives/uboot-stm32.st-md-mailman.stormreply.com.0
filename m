Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7979EB745
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2024 18:00:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63737C78006;
	Tue, 10 Dec 2024 16:59:59 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 222D6C7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 16:59:52 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADIIB9030060;
 Tue, 10 Dec 2024 17:59:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 U7w6RTw92Tfb2+nKsXNCmOkJQDAAvbbARox8EL4e1gM=; b=R5plHman0vI3gRN3
 9MITxeBtadZ7YyC3Ey6mQMTZN1D+/lFVDMWuPLoI6vFSBwvcXSN6GsxivPGa7B+S
 bRhJ5x+hqyjm9vAlF5DVs/dtsA2PgoGDK49q9fypGWJ5cdUek1kLx6duvwthsB0y
 76uAUY4IJ1h/g+tcswk1tu/MxKopCw5gWETZWZqBT5DXzbWbqSWVP3tWW4zohGF0
 +CDbZHBM1XzN74xOlfzeMqBNy84hkMTcgF2jgSEOKV1J//9mfbX1R1qMr5ILTZoT
 7An9Vl/ADpZOGrJT9EuEDf+pfhequWazFg0uNoC7ylHA1nUQcNJ91dLjYrpF+fyp
 ylIDhQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43d26nb5u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 17:59:46 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A71B640044;
 Tue, 10 Dec 2024 17:58:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0F21270F05;
 Tue, 10 Dec 2024 17:57:46 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Dec
 2024 17:57:46 +0100
Message-ID: <7a6b321e-fe47-4e05-8c67-0fda19c6e614@foss.st.com>
Date: Tue, 10 Dec 2024 17:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20241103003322.626036-1-sjg@chromium.org>
 <20241103003322.626036-9-sjg@chromium.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20241103003322.626036-9-sjg@chromium.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 08/25] st: stm32f429: Drop old LED code
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



On 11/3/24 01:33, Simon Glass wrote:
> This predates the LED framework, so drop it.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  board/st/stm32f429-discovery/Makefile |  1 -
>  board/st/stm32f429-discovery/led.c    | 39 ---------------------------
>  2 files changed, 40 deletions(-)
>  delete mode 100644 board/st/stm32f429-discovery/led.c
> 
> diff --git a/board/st/stm32f429-discovery/Makefile b/board/st/stm32f429-discovery/Makefile
> index 6b02c0fddec..233eafdad3d 100644
> --- a/board/st/stm32f429-discovery/Makefile
> +++ b/board/st/stm32f429-discovery/Makefile
> @@ -7,4 +7,3 @@
>  # Kamil Lulko, <kamil.lulko@gmail.com>
>  
>  obj-y	:= stm32f429-discovery.o
> -obj-y	+= led.o
> diff --git a/board/st/stm32f429-discovery/led.c b/board/st/stm32f429-discovery/led.c
> deleted file mode 100644
> index 4b8038341b9..00000000000
> --- a/board/st/stm32f429-discovery/led.c
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * (C) Copyright 2015
> - * Kamil Lulko, <kamil.lulko@gmail.com>
> - */
> -
> -#include <status_led.h>
> -#include <asm-generic/gpio.h>
> -
> -#define RED_LED			110
> -#define GREEN_LED		109
> -
> -void coloured_LED_init(void)
> -{
> -	gpio_request(RED_LED, "red led");
> -	gpio_direction_output(RED_LED, 0);
> -	gpio_request(GREEN_LED, "green led");
> -	gpio_direction_output(GREEN_LED, 0);
> -}
> -
> -void red_led_off(void)
> -{
> -	gpio_set_value(RED_LED, 0);
> -}
> -
> -void green_led_off(void)
> -{
> -	gpio_set_value(GREEN_LED, 0);
> -}
> -
> -void red_led_on(void)
> -{
> -	gpio_set_value(RED_LED, 1);
> -}
> -
> -void green_led_on(void)
> -{
> -	gpio_set_value(GREEN_LED, 1);
> -}

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
