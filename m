Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DAC1B04A8
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2020 10:43:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D7E0C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2020 08:43:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE4E7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 08:43:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K8gpXx015814; Mon, 20 Apr 2020 10:42:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=cCxt9AWgu1y/YiY8/FzrGBRNK6QjxERA8MNtos8KrrM=;
 b=XTfwCGwFHZHmRmXT6DVGTdPVGtZxeeBSzNrxMuXfRyGv15dFqyZe0SP54Uq86DPUwpW9
 bgbbG75nz62zH8uvj3Slup1aRZz/r1UWDk8N5ihbGJxBooD78osR4/vN7BAX8ri1gNfs
 2L6E9Rd1TL4GY4uy7xUD22xyjaQGvv4l8qWNaKAPG5fcCdG/zxJ32vFyPFUS4VwQJ97O
 x/veuHipTWUzcNwaNSMnoOChd0QOeShY4XH4MSB5kSdZ2JTbwSVKgfkb38vGyegSgONI
 vLOWvH5UhtBzy4PuNrYEH6ZDb2SWSwcLNo6rcmPObaA9WDjnAhSY10ALaPIHDdv5h2mH 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqaw160v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 10:42:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB8A7100034;
 Mon, 20 Apr 2020 10:42:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D5492B8A33;
 Mon, 20 Apr 2020 10:42:51 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 Apr
 2020 10:42:51 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 20 Apr 2020 10:42:51 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/3] rmobile: rcar: removed used CONFIG_SYS_RCAR_I2C*_BASE
Thread-Index: AQHWD0UvRoumm/h1v0mS4Oew9zh8U6hyblMAgA9Q3JA=
Date: Mon, 20 Apr 2020 08:42:50 +0000
Message-ID: <b688f5d9a3294385b9fec68ff1c9d650@SFHDAG6NODE3.st.com>
References: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
 <20200410163403.3.I2f2c3584fe42d6c42910d2e7e40d236910365a89@changeid>
 <bc8ebb55-fa80-6702-2585-1a9b645454df@denx.de>
In-Reply-To: <bc8ebb55-fa80-6702-2585-1a9b645454df@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_03:2020-04-17,
 2020-04-20 signatures=0
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Pascal Linder <pascal.linder@edu.hefr.ch>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Holger Brunck <holger.brunck@ch.abb.com>, Mario Six <mario.six@gdsys.cc>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] rmobile: rcar: removed used
	CONFIG_SYS_RCAR_I2C*_BASE
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

Dear Marek,

> From: Marek Vasut <marex@denx.de>
> Sent: vendredi 10 avril 2020 18:44
> 
> On 4/10/20 4:34 PM, Patrick Delaunay wrote:
> > As this "CONFIG" are never used, CONFIG_SYS_RCAR_I2C*_BASE can be
> > removed without effect and the file config_whitelist.txt is also
> > clean-up.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  arch/arm/mach-rmobile/include/mach/rcar-base.h | 6 ------
> >  scripts/config_whitelist.txt                   | 4 ----
> >  2 files changed, 10 deletions(-)
> 
> Update the README too, otherwise look good, thanks.

Done in a separate patch as I clean all the CONFIG no more used in this driver

[PATCH 2/3]  README: remove references on no more used config CONFIG_SYS_RCAR_I2C*

I didn't add you in CC for the serie, sorry.

http://patchwork.ozlabs.org/project/uboot/list/?series=169619

Regards

Patrick




_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
