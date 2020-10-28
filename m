Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B06E29CF6E
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Oct 2020 11:15:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60642C36B0B;
	Wed, 28 Oct 2020 10:15:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7721C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 10:15:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SACxEd018910; Wed, 28 Oct 2020 11:15:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=X3HAtzelp/Aizhv+6DgVtZby/gJ1jq+6pSxFCQ9GYZg=;
 b=VJXfhNCm2yrumglaSYvVGE6I/nJOi9zRwR2P1T8a3i52UllY7NVYKYRO/Phq97A5tze9
 IfFASfQgZGgA3vw6rjnLxPtBLBM78Own2w26S+iAHxTaZmfaz3+mZBtvYY+fRjoWmTMW
 gxwZGUSAp8+sBl16lV9U866rC7NR/6qkg+6Ks2SognnkK4Ltz+kyxg56DI8QWjHPVF+K
 knSmgNNKXY1ARwW2VQyfae6EiTyAZvEu12Fp6ecrHt/3HlJKkATdeVyhEih0izjPuFql
 QA+ZKKpMuzb2qWG1Fu0Xo84zPB2Wyn0qJ7PAwsHsbtRynqi8i88kCKG7tI27mFCQ8WPc 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccf3rjax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 11:15:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A582E10002A;
 Wed, 28 Oct 2020 11:15:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 915A62A69FE;
 Wed, 28 Oct 2020 11:15:19 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 11:15:19 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 28 Oct 2020 11:15:19 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>
Thread-Topic: [PATCH 2/2] gpio: stm32: correct the bias management
Thread-Index: AQHWrQ+W3ReRggPUCEqkW6TJlaxiBamsy7sg
Date: Wed, 28 Oct 2020 10:15:19 +0000
Message-ID: <e58f2ccc1dea4289a38a17087cd32555@SFHDAG2NODE3.st.com>
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
 definitions=2020-10-28_04:2020-10-26,
 2020-10-28 signatures=0
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

Hi Marek,

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
(...)

Can you test this patch on avenger board,
I expect it correct the SD card detect issue (pull-up not configurated).

Thanks.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
