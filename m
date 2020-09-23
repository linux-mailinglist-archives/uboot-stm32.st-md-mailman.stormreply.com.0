Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2CF275B2A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Sep 2020 17:06:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D7CDC3FAD4;
	Wed, 23 Sep 2020 15:06:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A691C32EB1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 15:06:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08NEvWNa016054; Wed, 23 Sep 2020 17:06:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5DW/KFD9ZCcG+hG/WmsetrvrbpDIhiS6sPtuy1mSNO0=;
 b=aOLsVWn1Ksp3Cjwe4nF0Laz46gM8vNmlPsZfCFVVKFQiGhujTcVBhTT2Jb/VcPIVEAG+
 MwhBDxN0dLsE+jRqfKhmjzUzwoCdEC8s7tZc8d/HwZ2FxLe01loWMzMwflDzOL55Gq69
 kAonrlVop4Ldfuv7SFww4sRae8Y/GLZ7nUvRpnLlpkZFrbLvm5cwGrO6CkKxy5/S5BZh
 pAuM58tRuDSobKkomf10eF+nQ0BVSqhVI3VunH4IfrqiAk0cOiRWZ43NuYBURqHkkqsW
 enLzuKPdxRuGMgwlCrT8kWVBdvraHmwvZVov3TrfIBbb89eUQMT195PRxcRqnhZeAk9b TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n7487n88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 17:06:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 392BD10002A;
 Wed, 23 Sep 2020 17:06:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 014242BABB9;
 Wed, 23 Sep 2020 17:06:15 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Sep
 2020 17:06:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 23 Sep 2020 17:06:14 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [RFC PATCH] dm: add cells_count parameter in
 *_count_phandle_with_args
Thread-Index: AQHWh5GLTTlpnPl78E+JXZleIK+nOKl08UuAgAFvMTA=
Date: Wed, 23 Sep 2020 15:06:14 +0000
Message-ID: <8224663e5f6b43388fd36f155653a442@SFHDAG6NODE3.st.com>
References: <20200910164341.29613-1-patrick.delaunay@st.com>
 <CAPnjgZ2SK0-a75tO6HwVwKtA7rTPCmqeL0M16YgO_=gx5MgGqg@mail.gmail.com>
In-Reply-To: <CAPnjgZ2SK0-a75tO6HwVwKtA7rTPCmqeL0M16YgO_=gx5MgGqg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_10:2020-09-23,
 2020-09-23 signatures=0
Cc: Marek Vasut <marex@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Patrice
 CHOTARD <patrice.chotard@st.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [RFC PATCH] dm: add cells_count parameter in
 *_count_phandle_with_args
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

Hi Simon,

> From: Simon Glass <sjg@chromium.org>
> Sent: mardi 22 septembre 2020 20:49
> 
> On Thu, 10 Sep 2020 at 10:44, Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> > The cell_count argument is required when cells_name is NULL.
> >
> > This patch adds this parameter in live tree API
> > - of_count_phandle_with_args
> > - ofnode_count_phandle_with_args
> > - dev_count_phandle_with_args
> >
> > This parameter solves issue when these API is used to count the number
> > of element of a cell without cell name. This parameter allow to force
> > the size cell.
> >
> > For example:
> >   count = dev_count_phandle_with_args(dev, "array", NULL, 3);
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> > I push today this RFC.
> >
> > It is linked to previous serie [1] but it is not a blocking point
> > today as no user use this API with cells_name = NULL
> > + dev_count_phandle_with_args
> > + ofnode_count_phandle_with_args
> >
> > But I think it is the good time to modify these functions as they are
> > not hugely used: it is the proposition in this RFC.
> >
> > It is just a RFC because I don't sure if I can modify the existing API
> > even if parameters are aligned with *_parse_phandle_with_args.
> >
> > I can also to add new APIs to use when cells_name is NULL:
> > + dev_count_phandle_with_cell_count(node, list_name, cell_count);
> > + ofnode_count_phandle_with_cell_count(node, list_name, cell_count);
> >
> > and raise a error if cells_name == NULL in existing function
> > + dev_count_phandle_with_args
> > + ofnode_count_phandle_with_args
> >
> > [1] http://patchwork.ozlabs.org/project/uboot/list/?series=200899
> >     "dm: add cells_count parameter in live DT APIs of_parse_phandle_with_args"
> >
> >
> >  board/st/stm32mp1/stm32mp1.c    | 2 +-
> >  drivers/clk/clk-uclass.c        | 4 ++--
> >  drivers/core/of_access.c        | 7 ++++---
> >  drivers/core/ofnode.c           | 6 +++---
> >  drivers/core/read.c             | 5 +++--
> >  drivers/phy/phy-uclass.c        | 2 +-
> >  drivers/reset/reset-uclass.c    | 2 +-
> >  drivers/usb/host/ehci-generic.c | 4 ++--
> >  include/dm/of_access.h          | 4 +++-
> >  include/dm/ofnode.h             | 3 ++-
> >  include/dm/read.h               | 8 +++++---
> >  11 files changed, 27 insertions(+), 20 deletions(-)'
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> A test would go a long way here.

Sure, I will add a test in the real patch...

I send RFC without test just to be sure that adding parameter in  *_count_phandle_with_args()
is a better solution than adding a new API.

Proposition 1 (it is the RFC content): add argument in current API

Example:

of_count_phandle_with_args(node, "clocks", "#clock-cells", 0);
ofnode_count_phandle_with_args(node, "resets", "#reset-cells", 0);
dev_count_phandle_with_args(node, "phys", "#phy-cells", 0);

dev_count_phandle_with_args(node, "test", NULL, 3);
ofnode_count_phandle_with_args(node, "test", NULL, 3);


Proposition 2: new API *count_phandle_with_cell_count

of_count_phandle_with_args(node, "clocks", "#clock-cells");
ofnode_count_phandle_with_args(node, "resets", "#reset-cells");
dev_count_phandle_with_args(node, "phys", "#phy-cells");

dev_count_phandle_with_fixed_args(node, "test", 3);
ofnode_count_phandle_with_fixed_args(node, "test", 3);

I think that Proposition 1 (this RFC) is more clear because parameters are aligned
with other API *read_phandle_with_args

But proposition 2 is align with Linux API
- of_count_phandle_with_args
- of_parse_phandle_with_fixed_args
And avoid to change all the current users of *count_phandle_with_args

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
