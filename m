Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C67294A60
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 11:19:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65AF2C3FAD5;
	Wed, 21 Oct 2020 09:19:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92493C3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 09:19:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L97o9F025993; Wed, 21 Oct 2020 11:19:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IDgpVu3wKY64+c4FY655hxNA6pu3ec6br3/MSAYmsJw=;
 b=SzxEA5s8rB+pEiRqqFpgXfxvSt3xbqZDIIVUrkRpMvRRus5jdWzlvzJGO7O87r67sTr+
 6Xr6dTnsmwXEC2t5rrEsX15aVT2z2alUUIHp+6yncBeDkucqFv7Yo7vHjzDz9dZOmnfQ
 SyTTUdMPR6PXCS1LVJ5Jc7tTszEB/p7xd76YqXzDPS4Sxr6hxdTNd6QOlgPc5SDex///
 wPVGvFDp3jo2O5WepRZpTjQiV+FWRQhVghXdFskVTyeCUxYbuxz8KqMlSYdju7Ne54xi
 9wkrr1nuA47ZDhCfw1DS761qupWK8EOacsUxe4MdhiR050BvmT4T6+HQTXKV21RB09MU Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qgg9enn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 11:19:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18AA210002A;
 Wed, 21 Oct 2020 11:19:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F5C12C38B8;
 Wed, 21 Oct 2020 11:19:15 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 11:19:14 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 11:19:14 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] board: stm32pm1: update USB-C power detection algorithm
 on DK boards
Thread-Index: AQHWo44Kxg4ZcIEIpEabbNkMTd1EXamhzzpA
Date: Wed, 21 Oct 2020 09:19:14 +0000
Message-ID: <354bd3c8695143ac884c2898cbbaac81@SFHDAG2NODE3.st.com>
References: <20201016092843.1.I5e39774367f1ea4e7c390f69ab3f86a79b66b8ce@changeid>
In-Reply-To: <20201016092843.1.I5e39774367f1ea4e7c390f69ab3f86a79b66b8ce@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_03:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32pm1: update USB-C power
 detection algorithm on DK boards
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

Hi Patrice,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 16 octobre 2020 09:29
> 
> USB-C power supply which are Power Delivery compliant (USB-PD) are able to
> provide different voltage/current (for example 5V/3A 9V/3A 12V/2.25A...)
> 
> In this case, the power supply need to negotiate the voltage/current to use with
> the device using CC1/CC2 USB-C signals.
> 
> If this negotiation occurs during ADC measurement (done also on CC1/CC2 USB-
> C signals) some ADC acquisition can be corrupted which cause wrong power
> supply current detection.
> 
> To avoid this, the power supply current detection algorithm is updated as
> following:
>   - perform an ADC measurement, if a 3A current is detected, continue the
>     boot process.
>   - else, wait 20ms (max tPDDebounce duration) to ensure that USB-PD
>     negotiation is done and perform another ADC measurement.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c | 106 +++++++++++++++++++++--------------
>  1 file changed, 63 insertions(+), 43 deletions(-)
> 

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
