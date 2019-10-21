Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD02DF3DD
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 19:10:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74A79C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 17:10:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF367C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 17:10:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9LH608E012052; Mon, 21 Oct 2019 19:10:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=mgbvyrvFnPblIex97RnNokZSLCXQ/0kzmonJVHNbzGg=;
 b=eoVtnEDpxy8bKb1YOdJJVcYUVVf1EDbp6CAVpqoKrJnZJ+k4ZaGR7veu795Sa03ut5IP
 OOnW/QV/8LruBe96joXAPEz14pFLe7MiojnwZKXZnMjihLUsfoMp3v6aX3wEuP+jM8jC
 JsNJ3AOupNqYBlcYi8ABEcZArxMT1zmyi01DfjTvmhTzBASJDAAunnBEb1CTbLthNS6f
 kEywXqdqrqAKqEBsRNQ2zikzwUPIMQRJqO+ffu53BSHALl6GXFdppAelUkow4kDaUf6g
 /u7KhPbX+xDxjuwft3VJtz9BASjV8R7o8KqmLobuGY8UP1RnNLCxAsT6cgRdTSdxlYHt VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vqwva25xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2019 19:10:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBD9F10002A;
 Mon, 21 Oct 2019 19:10:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B9672222CFD;
 Mon, 21 Oct 2019 19:10:21 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Oct
 2019 19:10:21 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 21 Oct 2019 19:10:21 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Anatolij Gustschin <agust@denx.de>, Tom Rini <trini@konsulko.com>
Thread-Topic: [U-Boot] [PATCH] dm: pinctrl: fix for introduce
 PINCONF_RECURSIVE option
Thread-Index: AQHVheH4JdikP/jkU0GKKy2yvjIdsKdiQueAgAMUsgA=
Date: Mon, 21 Oct 2019 17:10:21 +0000
Message-ID: <c7cf2c4dbaa245dfa80caa9af22dd98f@SFHDAG6NODE3.st.com>
References: <20191018182922.22960-1-patrick.delaunay@st.com>
 <20191019220213.22f7a799@crub>
In-Reply-To: <20191019220213.22f7a799@crub>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_04:2019-10-21,2019-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] dm: pinctrl: fix for introduce
 PINCONF_RECURSIVE option
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

Hi Anatolij and Tom,

> From: Anatolij Gustschin <agust@denx.de>
> Sent: samedi 19 octobre 2019 22:02
> 
> Hi Tom,
> 
> On Fri, 18 Oct 2019 20:29:22 +0200
> Patrick Delaunay patrick.delaunay@st.com wrote:
> ...
> > This correct a regression introduced by commit c20851b3d850 ("dm:
> > pinctrl: introduce PINCONF_RECURSIVE
> > option")
> 
> Could you please apply this patch ASAP? It fixes broken eMMC, Ethernet, I2C,
> GPIO, etc. on i.MX8QXP MEK board.
> 
> Many other boards are affected, too.
> 
> Thanks!

I check deeper today the root cause of the issue and I have a clean solution
with v2 patch: http://patchwork.ozlabs.org/patch/1180575/

The friday patch wasn't enough at least for my board, but ok for sandbox.

And a minor correction of the Kconfig (not blocking)
http://patchwork.ozlabs.org/patch/1180576/

> --
> Anatolij

Sorry for disturbance.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
