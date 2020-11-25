Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2F12C3EAE
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 12:03:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FFEAC56630;
	Wed, 25 Nov 2020 11:03:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 177E3C424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 11:03:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0APB2lCg009934; Wed, 25 Nov 2020 12:03:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GfJWX699CF1A8Y0KG0nNcPnKjTxlOLiaCoBfSsLOVpI=;
 b=RlQoVeUpV54yt+c3WNzYo7ISQtnqkgUh7MO0dnL4Yct5SMAV00Qia0hLjzRVYU2p2j3W
 aWsRf/fhbBh+LXdOEgg1BEsnxX2SK+vj/oHyS7wfv9MyqIPlpquDhHPaRSHDxjk8rRIr
 fo13HmUeCqN4ualJo5JoCDwAxTXExZV8Ac9PK/Kabei+Eup2ad7EWH946o4j1dodeTDX
 pmylHCAp8S1HD6VmIaKu0K4tbzQpEeUIf4Uzv0SmdrGyxtd3DC/MNk+bysq2f59o1o7O
 aEFfUd0GIG/QUwg1QSc46ZH6Q9REvL+UG1QAv7oHp/x0R3eM6Tb5TumhSSquFbVGESg7 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fh01d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 12:03:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC9EB100034;
 Wed, 25 Nov 2020 12:03:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4BD62383EC;
 Wed, 25 Nov 2020 12:03:39 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 12:03:38 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 12:03:39 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] gpio: stm32: correct the bias management
Thread-Index: AQHWrQ+W3ReRggPUCEqkW6TJlaxiBanY2mdg
Date: Wed, 25 Nov 2020 11:03:39 +0000
Message-ID: <6ae79c1d87fc49bda4559f7d38e9ab68@SFHDAG2NODE3.st.com>
References: <20201028094908.11031-1-patrick.delaunay@st.com>
 <20201028094908.11031-2-patrick.delaunay@st.com>
In-Reply-To: <20201028094908.11031-2-patrick.delaunay@st.com>
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
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] gpio: stm32: correct the bias
	management
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
> Sent: mercredi 28 octobre 2020 10:49
> 
> Use the bias configuration for all the GPIO configurations and not only for input
> GPIO, as indicated in Reference manual (Table 81. Port bit configuration table).
> 
> Fixes: 43efbb6a3ebf0223f9eab8d45916f602d876319f ("gpio: stm32: add ops
> get_dir_flags")
> Fixes: f13ff88b61c32ac8f0e9068c41328b265ef619eb ("gpio: stm32: add ops
> set_dir_flags")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/gpio/stm32_gpio.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
