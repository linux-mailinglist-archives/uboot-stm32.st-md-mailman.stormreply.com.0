Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D78691A0F33
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 16:31:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98EE3C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 14:31:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73D6AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 14:31:11 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 037ESo42002431; Tue, 7 Apr 2020 16:31:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=yuGL4IUm1V8nedRn1QGhvPeiXN8j+OgqWctMX2czdSA=;
 b=gttQr/Y/f2+daANEnp5kTyajONuudv4v3oGy1cIUeQ2n8m1/jkAcCbmC5+Zsvuh6Ptxo
 M8yGNXQM9uDJJg0EkJ8ejrpfXTjzDcJ6FqnVh/t0/8wPm9K06/biOLL8H3Y75fIuXAIG
 XGTK5H1B1xW4MVoHsmcQzV3a0PJtcp2aiVJ+Zpn0szwF96kJDCMFSnfaXouyrnfoVWHP
 oFgWsolomEFbkjYbShU1ON9nndsA9EC++Hzb8MwZBwzDui7v44Z67YYAmfOi4hZmrLB/
 LdhRmh0wdcyfRNvU7ZhqMFM+P4pG94LVFhZE2huH8KFFd00Id5N+ZNvCcEFoP9AOqEq/ UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 306g0w8k1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 16:31:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8997E100034;
 Tue,  7 Apr 2020 16:31:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C1C32B189C;
 Tue,  7 Apr 2020 16:31:03 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 7 Apr
 2020 16:31:03 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 7 Apr 2020 16:31:02 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>
Thread-Topic: [PATCH 03/16] arm: stm32mp: reset to default environment when
 serial# change
Thread-Index: AQHWB3YfWPOjA07+PU+1kVESYd9+Sqhj/jqAgAm2wwA=
Date: Tue, 7 Apr 2020 14:31:02 +0000
Message-ID: <60273317e5704581bef81c4beb28ad75@SFHDAG6NODE3.st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.3.I8f6df6d28ce5b4b601ced711af3699d95e1576fb@changeid>
 <20200401111859.C78A224003E@gemini.denx.de>
In-Reply-To: <20200401111859.C78A224003E@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_07:2020-04-07,
 2020-04-07 signatures=0
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 03/16] arm: stm32mp: reset to default
 environment when serial# change
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

Dear Wolfgang,

> From: Wolfgang Denk <wd@denx.de>
> Sent: mercredi 1 avril 2020 13:19
> 
> Dear Patrick,
> 
> In message
> <20200331180330.3.I8f6df6d28ce5b4b601ced711af3699d95e1576fb@changeid>
> you wrote:
> > Serial number is first checked and, in case of mismatch, all
> > environment variables are reset to their default value.
> >
> > This patch allows to detect that environment is saved in a removable
> > device, as a SD card, and reused on a other board, potentially with
> > incompatible variables.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  arch/arm/mach-stm32mp/cpu.c | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> > index 9aa5794334..365c2aa4f7 100644
> > --- a/arch/arm/mach-stm32mp/cpu.c
> > +++ b/arch/arm/mach-stm32mp/cpu.c
> > @@ -511,8 +511,9 @@ __weak int setup_mac_address(void)
> >  		return -EINVAL;
> >  	}
> >  	pr_debug("OTP MAC address = %pM\n", enetaddr);
> > -	ret = !eth_env_set_enetaddr("ethaddr", enetaddr);
> > -	if (!ret)
> > +
> > +	ret = eth_env_set_enetaddr("ethaddr", enetaddr);
> > +	if (ret)
> >  		pr_err("Failed to set mac address %pM from OTP: %d\n",
> >  		       enetaddr, ret);
> 
> This is an unrelated and totally undocumented change.  Please split into separate
> commit.

Yes, sorry.

Done in http://patchwork.ozlabs.org/project/uboot/list/?series=169021
" arm: stm32mp: cleanup test on eth_env_set_enetaddr result"

> 
> > +
> > +	if (serial_env) {
> > +		if (!strcmp(serial_string, serial_env))
> > +			return 0;
> > +		/* For invalid enviromnent (serial# change), reset to default */
> > +		env_set_default("serial number mismatch", 0);
> > +	}
> 
> Resetting the enviropnment to the defaults means you drop all setting sa user
> may have made.  This is a very bad move - as a user I find such things
> completely unacceptable.  If I make any changes, they must never ever be killed
> without my explicit confirmation.
> 
> I strongly advice against such a method. Please drop that.

Understood, I drops this patch....

I introduce this behavior after a internal request and to avoid issues during tests:

Some users use the same SD card (same rootfs) on several boards (EV1 and DK2 for example)
and the U-Boot environment is saved on this SD card. 

When an user updates U-Boot binary to use this SD card on other board but not erase the
environment file (save in ext4 file in bootfs partition), the boot can fail because the
environment is not compatible between the 2 boards.

This patch try to avoid this issue when I detect that the removable device (as SD card) is used on a
a different board (it is detected when saved serial number with different the OTP).

But I admit that can be strange/unacceptable for end-user, particularly it is only change of board
(DK2#1 => DK2#2) : the environment tuned one board #2 can't be used on board#2.

I make too many assumption on user usage and this patch can't be acceptable in arch 
(common for all board based on STM32MP15x).
 
> Best regards,
> 
> Wolfgang Denk
> 
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de "You
> ain't experienced..." "Well, nor are you." "That's true. But the point is ... the point is
> ... the point is we've been not experienced for a lot longer than you. We've got  a
> lot  of  experience  of  not
> having any experience."           - Terry Pratchett, _Witches Abroad_
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
