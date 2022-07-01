Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE422562CC8
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Jul 2022 09:36:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30DE6C0D2BF;
	Fri,  1 Jul 2022 07:36:41 +0000 (UTC)
Received: from mx4.securetransport.de (mx4.securetransport.de [178.254.6.145])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 401ABC03FDF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Jul 2022 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1656660979;
 bh=vrt5QH/LfP1DPOAZ4gbtTVz2YSN+JrDNDOS7b4ISqXg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=nqEU06fWOthLnrXSuSWWy++y6QZqN3XNToaDobbQgmT2+6ltwYAynJ0CAJ3zOILFr
 +7RZtb8Oaq23R7U0n7zUxClyF6S5IVRBgUE2FXz29E1FsDPCi/JfXIBpsYbeWwfVNN
 Rl7KvH0OiMn0Rr/I9neIr1C6ngm1Y9bjuG/8UFiwPXf3n9WW0rhuUy1a0OA+TAOUS8
 a8tOkMcd9eQSokO2wB13W4hVjRlgaYkNfmbxZpRc+Dti1VP0a0LAzgoGQ4kezhMGFU
 A3Tj4Q7Zu9aWUIFXCX36YQ0tRnJqyA6Ik33AHNSEKlRFnF47NOS4os3llKQXF47YA6
 0d+Uu6rDsEouA==
X-secureTransport-forwarded: yes
From: Johann Neuhauser <jneuhauser@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] arm: dts: stm32mp1: Drop fastboot and stm32prog trigger
 gpios on DHCOM
Thread-Index: AQHYjIyDQjm2hhwoCUaOoTwCzRC3qa1n7xGAgAExFcA=
Date: Fri, 1 Jul 2022 07:36:11 +0000
Message-ID: <8ebbf6d336cd410aac13d92a0ff44e08@dh-electronics.com>
References: <20220630141949.10585-1-jneuhauser@dh-electronics.com>
 <a4962258-852b-fc7c-0c19-166fa1cdde00@denx.de>
In-Reply-To: <a4962258-852b-fc7c-0c19-166fa1cdde00@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, u-boot <u-boot@dh-electronics.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp1: Drop fastboot and
 stm32prog trigger gpios on DHCOM
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

> -----Original Message-----
> From: Marek Vasut [mailto:marex@denx.de]
> Sent: Thursday, June 30, 2022 5:20 PM
> 
> On 6/30/22 16:19, Johann Neuhauser wrote:
> > PA13 and PA14 are used for USB power control and can't be used
> > to enforce fastboot or stm32prog mode by pressing a button.
> >
> > Defining CONFIG_FASTBOOT/CONFIG_CMD_STM32PROG without this patch applied
> > results in fastboot/stm32prog always starting, because PA13/PA14 are always
> > low during boot. So drop the wrong trigger gpios definitions.
> >
> > Signed-off-by: Johann Neuhauser <jneuhauser@dh-electronics.com>
> 
> Those GPIOs also likely make no sense on DHCOM , right ?

They would only make sense on the DHCOM PDK2, since this is the only
mainline baseboard with user buttons available in U-Boot.
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
