Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FF466F8C
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 15:06:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CDF4D40914
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 13:06:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F444D40913
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 13:06:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CD1ZRG019003; Fri, 12 Jul 2019 15:06:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/e7jEyQaM/j1o0nYDR93jjDJ1hx+TYw0xlKLBzNV1/Y=;
 b=kd8TC8+5qD7cvOIqzuHCZnAHOVIx5chKoeHmFGTTQrTeSAyVQOrjyIVvPnPRBKq1w4W0
 icao0BcexGJXU1oQOJGy9zLCIFxx4UR2cCVB/qBgUku30X6YFWdGTfTbBscfSM9dGRPN
 my7V7GD4xXQJFCQIJhYgsoUOERxAA+TrLa7pbkNrYy/K1/NRNaQs7XQO+KOVefjl7UZh
 or0IMUGW0OGOj2Aatvlw4mb1phx10DrC9RGDTJjlMvYGISLSJMUcSazwDTskXyWlnzeg
 MI9u2FAuynt0nWwgLv0FgdcKtlIc/gv4WAFMdTY7kcvLOZ30gQ5QTTVh5TF546vWH5kE Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tpj3tk56p-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 15:06:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B03A734;
 Fri, 12 Jul 2019 13:06:17 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9ACF22CCC;
 Fri, 12 Jul 2019 13:06:17 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 15:06:17 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 15:06:17 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] board: st: add missing gpio_request() for
 stm32f429-discovery
Thread-Index: AQHVK/joky5C7r62XESGk8ZuiftrtabHDR0A
Date: Fri, 12 Jul 2019 13:06:17 +0000
Message-ID: <75425d79cbba4932b7ede4ca5909e9a6@SFHDAG6NODE3.st.com>
References: <20190626082641.13869-1-patrice.chotard@st.com>
In-Reply-To: <20190626082641.13869-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] board: st: add missing gpio_request() for
 stm32f429-discovery
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

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: mercredi 26 juin 2019 10:27
> 
> This fixes the following error message:
> 
> U-Boot 2019.07-rc4-00103-g5eea874b5e (Jun 25 2019 - 15:09:31 +0200)
> 
> DRAM:  8 MiB
> gpio@40021800: dir_output: error: gpio GPIOG14 not reserved
> gpio@40021800: dir_output: error: gpio GPIOG13 not reserved
> gpio@40021800: set_value: error: gpio GPIOG14 not reserved
> Flash: 2 MiB
> ....
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  board/st/stm32f429-discovery/led.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
