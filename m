Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1CC157334
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 12:02:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C363C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 11:02:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3FFCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 11:02:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AAsC1o012666; Mon, 10 Feb 2020 12:02:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=InhhdrtrijsuI6+MTykzwUPbhTCSd6MJN7TvyVTqElg=;
 b=EiDkR2ijhR62bRZwkv4yz01rND10cq1nPPD7CSZtJ/0A4UMbTFQXyP1m52WulhF6doy0
 ZgNBx+qwMK3wsGUnAoKJ7gdZ6Tdu+Cz/jnmLO5Aen2lNhhH6m5Tu09GJaRgbb29F+7DP
 T/ndKmf1DeOtzVlZR+hpzdhCViTnvimSSgawE2yKC0Az8iShCLw0/ljfzmuPg0/MA2CD
 89k7VaAzqLygnVLDcTSq5QvDHJVyrfl8u+AjgxajZWm9p1XNqAW8or1boBkD8DeUQGDW
 MQs4MaLkPu/JfWQWxMlV2B1K/tuTq2vHyJalA10NFWcYqenCqEvoDryMb57+SPALAkUn uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ud99brf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 12:02:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DEA910002A;
 Mon, 10 Feb 2020 12:02:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5333C2D379B;
 Mon, 10 Feb 2020 12:02:23 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 12:02:22 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 10 Feb 2020 12:02:22 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 8/9] doc: add board documentation for stm32mp1
Thread-Index: AQHV1brvWCAgUcHIP0C4sxQS6bWT+Kf/4ZSAgBR1H8A=
Date: Mon, 10 Feb 2020 11:02:22 +0000
Message-ID: <18fb0431a0064149979c9d7ae2184f3f@SFHDAG6NODE3.st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128091106.28552-5-patrick.delaunay@st.com>
 <106cf4fa-a85c-6ee8-f8a7-cc1bcd24fbc7@gmx.de>
In-Reply-To: <106cf4fa-a85c-6ee8-f8a7-cc1bcd24fbc7@gmx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_02:2020-02-10,
 2020-02-10 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 8/9] doc: add board documentation for
	stm32mp1
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

Hi Heinrich

> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Sent: mardi 28 janvier 2020 12:34
> 
> On 1/28/20 10:11 AM, Patrick Delaunay wrote:
> > Change plain test README to rst format and move this file in
> > documentation directory.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> 
> When I apply only this patch to origin/master:
> 
> git am /tmp/1.patch
> Applying: doc: add board documentation for stm32mp1
> error: patch failed: board/st/stm32mp1/README:1
> error: board/st/stm32mp1/README: patch does not apply
> .git/rebase-apply/patch:1164: new blank line at EOF.
> 
> Maybe this patch will have to be rebased.

I think the issue is because ethe readme is updated in the previous patch
[7/9] board: stm32mp1: update readme

=> I think I will get the board patch in my next pull request on stm32 and
     then rebase this patch only.

> > ---
> >
> >   board/st/stm32mp1/README  | 520 +--------------------------------
> >   doc/board/index.rst       |   1 +
> >   doc/board/st/index.rst    |   9 +
> >   doc/board/st/stm32mp1.rst | 598
> ++++++++++++++++++++++++++++++++++++++
> >   4 files changed, 609 insertions(+), 519 deletions(-)
> >   create mode 100644 doc/board/st/index.rst
> >   create mode 100644 doc/board/st/stm32mp1.rst
> >
> > diff --git a/board/st/stm32mp1/README b/board/st/stm32mp1/README index
> > 5d7465a8c8..8172d26a66 100644
> > --- a/board/st/stm32mp1/README
> > +++ b/board/st/stm32mp1/README
> > @@ -1,519 +1 @@
> > -SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause -# -# Copyright (C)
> > 2018 STMicroelectronics - All Rights Reserved -#
> > -
> > -U-Boot on STMicroelectronics STM32MP15x
> > -=======================================

......

> > + bi
> > +
> > +- you can also dump the OTP and the PMIC NVM with::
> > +
> > +  $> dfu-util -d 0483:5720 -a 25 -U otp.bin  $> dfu-util -d 0483:5720
> > + -a 26 -U pmic.bin
> > +
> 
> This blank line could be removed.

Ok => in V2 with rebase

> 
> 'make html' shows that the reStructured text files are syntactically valid.
> 
> Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Thanks 

Patrkc

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
