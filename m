Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF1C1F694B
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jun 2020 15:45:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C6E5C36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jun 2020 13:45:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C8B9C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2020 13:45:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05BDhUTH028147; Thu, 11 Jun 2020 15:44:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=QCyw8xID4m466ojWngYWaT8gChjIulQLJxArGdBUZes=;
 b=t6gRDm60OB5CAhAnxMZnEtzwritAMC7UmWBVMVlgZfDD2ODw8iSZo9+ww8IrrgsDgu5L
 tZjwhjtgOgWtdoy4MSdqRRuFKv8K+T5yk6eIdUwO0Mrfc49OWZMlBTjkqHCBZSKe7oec
 JPwcdS3sgcdoBoePI+iMVuoUCy5uCbSH/oeODnmHxgmGFsE8p70LkRNYdMtADHw/gFUm
 zw8DuGKZ/2oqU2dPkqOhNcRyHkRZ232lJ6SCvJ+NVdGHGenyEVkIzdWPEGrIMHGkBD6+
 I/XnQ5CXe2pmfk57uvBExPlNFPAH2T3ZyDKIxvSRttXHswYi6p3LzMupY0KEn19XkQNa Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g21gak8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 15:44:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9DDF610002A;
 Thu, 11 Jun 2020 15:44:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 87AC22AE6AC;
 Thu, 11 Jun 2020 15:44:51 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Jun
 2020 15:44:51 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 11 Jun 2020 15:44:51 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, Marek Vasut <marex@denx.de>
Thread-Topic: [PATCH] net: dwc_eth_qos: add Kconfig option to select supported
 configuration
Thread-Index: AQHWPXcC2Bk1QIo990ii8ICU2vnfjajSCFeAgAAI8gCAAALJAIAAAOwAgAAA6ICAAADJgIAAE5kAgAAJqoCAAAJVAIAAAIoAgAAK0ACAAAFzgIAABMWAgAEnWtA=
Date: Thu, 11 Jun 2020 13:44:51 +0000
Message-ID: <9c3c3eafbeed4db89058bca2b66a65cb@SFHDAG6NODE3.st.com>
References: <20200610185218.GH24893@bill-the-cat>
 <552c2b40-7aaf-c015-ca49-ef14ae6ac905@denx.de>
 <20200610185851.GI24893@bill-the-cat>
 <ca74b5b5-3de3-c249-16d5-c5e1de742dc2@denx.de>
 <20200610201148.GJ24893@bill-the-cat>
 <a3f20f91-fecb-81ed-6eb7-5070574f2c64@denx.de>
 <20200610205444.GK24893@bill-the-cat>
 <e9bd8f83-2542-530a-1c47-3ae839f557a6@denx.de>
 <20200610213522.GM24893@bill-the-cat>
 <0b8142d8-2375-ee8f-515d-680f8e93beed@denx.de>
 <20200610215737.GO24893@bill-the-cat>
In-Reply-To: <20200610215737.GO24893@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_14:2020-06-11,
 2020-06-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add Kconfig option to
 select supported configuration
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

> From: Tom Rini <trini@konsulko.com>
> Sent: mercredi 10 juin 2020 23:58
> 
> On Wed, Jun 10, 2020 at 11:40:33PM +0200, Marek Vasut wrote:
> > On 6/10/20 11:35 PM, Tom Rini wrote:
> > > On Wed, Jun 10, 2020 at 10:56:40PM +0200, Marek Vasut wrote:
> > >> On 6/10/20 10:54 PM, Tom Rini wrote:
> > >>> On Wed, Jun 10, 2020 at 10:46:23PM +0200, Marek Vasut wrote:
> > >>>> On 6/10/20 10:11 PM, Tom Rini wrote:
> > >>>> [...]
> > >>>>>>>>> You mean be more like barebox and Linux where the
> > >>>>>>>>> board-specific stuff is kicked up one level and we have a
> > >>>>>>>>> more generic binary?  I don't know and there's so much work
> > >>>>>>>>> that would be required before having to move this from a
> > >>>>>>>>> Kconfig choice to just Kconfig options I don't see that as being a
> relevant question here.
> > >>>>>>>>>
> > >>>>>>>>> Or did I misunderstand the question?
> > >>>>>>>>
> > >>>>>>>> More like automatically have a Kconfig option generate it's
> > >>>>>>>> _SPL and _TPL variant.
> > >>>>>>>
> > >>>>>>> Ah.  Well, that is rephrasing my first question.  Would it
> > >>>>>>> ever make sense to have more than one of these enabled?
> > >>>>>>
> > >>>>>> For some sort of universal SPL, maybe ?
> > >>>>>
> > >>>>> So no, there's not a reason today then and it should be a choice.
> > >>>>
> > >>>> Can you provide some more detailed explanation why we shouldn't
> > >>>> generate _SPL and _TPL variants of Kconfig entries for all
> > >>>> Kconfig entries ? It would make things much simpler and permit
> > >>>> configuring SPL/TPL the same way U-Boot is configured, with their own
> set of options.
> > >>>
> > >>> In the context of this particular thread?  I don't see how it's
> > >>> helpful to say 3 times that we're in fact building for Tegra or
> > >>> STM32 or SoCFPGA when you can't build something that runs on more
> than one of those.
> > >>
> > >> In general.
> > >>
> > >> Here I can imagine it is possible to build SoCFPGA+STM32 universal
> > >> SD card image in fact.
> > >
> > > So that's the case I brought up at first and you said no to.
> >
> > I think I don't understand this part.
> 
> You're talking about a binary that runs on more than one dissimilar SoC, yes?
> 
> > > I don't
> > > see that in the foreseeable future but I don't feel so strongly
> > > about making this config area tidy enough to argue the point.  So
> > > fine, leave it as separate options, the default y if ... is
> > > reasonable enough to ensure we get functional builds.
> >
> > This patch is OK as-is.
> 
> Yes, since I'm no longer asking for changes to it, it's fine.

I don't see possible use case where the 3 drivers configurations can be activated at the same time, 
Except, as Marek indicated it, the same U-Boot binary compiled to be executed for several architecture
(STM32, IMX, TEGRA).

But it is not possible (duplicate cote between arch)  as each configuration is linked to archictecture variant 
(the synopsis IP is modified by SOC vendor).

For me it should be possible to change the config option to select,
even it is no more requested and the patch is OK as-is (I keep the possibility to have the 3 options activated).

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
