Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD0C124199
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 09:27:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82D9DC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 08:27:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E54CC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 08:27:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBI8QTuk021570; Wed, 18 Dec 2019 09:26:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=36+p4lU9g6XoBUj7YqMddOEDI4o6DAvy7SlmchLeSpE=;
 b=SSoMt5A9Z/sLQYpDdZVG781DD8vUJAJ9FVLGQquGllRlz/o++KXT6ZP6pFiMkP5ok+Hv
 NGQFft6ghVKLm3isSvzSJsaMAm3sTGunK3O6aJjE+9P5Ad5CjhUjR93om6jZJTD764Eo
 iBz/odEdoIeAW6+/qRgbgqZgE0y4Xr0n0tBe0wNow+bTNuTXLh/vvbAybQxlfwSU5YdB
 RG35e1CKyVOOlVqjO6qvHqgmQK0BNoBJVDLssO4YtMCwAmVQG6JzJ85xmTpYKVUm4Gzc
 KiDLNy5rD1nC/dprUxcY9FqVF9ePcEA/iewRgnH6XTocIDJK8gsq0f8p4k5WBot2K8kd Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wvnrek8b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 09:26:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA6C1100039;
 Wed, 18 Dec 2019 09:26:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81C6721F8BC;
 Wed, 18 Dec 2019 09:26:43 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 09:26:43 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Dec 2019 09:26:42 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH v3] board_f.c: Insure gd->new_bootstage alignment
Thread-Index: AQHVpQKuO35xYU0730Sul27V/xKK76e8l++AgAG+2ACAAVgoAA==
Date: Wed, 18 Dec 2019 08:26:42 +0000
Message-ID: <8c67abbc73ce4feda94613208469ced0@SFHDAG6NODE3.st.com>
References: <20191127091138.29223-1-patrice.chotard@st.com>
 <611198b18f8e404d9c63a3ab2a1410dd@SFHDAG6NODE3.st.com>
 <20191217125204.GA12668@bill-the-cat>
In-Reply-To: <20191217125204.GA12668@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_01:2019-12-17,2019-12-18 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>, Joe
 Hershberger <joe.hershberger@ni.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Trevor Woerner <trevor@toganlabs.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3] board_f.c: Insure gd->new_bootstage
	alignment
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Tom,

> From: Tom Rini <trini@konsulko.com>
> Sent: mardi 17 d=E9cembre 2019 13:52
> =

> On Mon, Dec 16, 2019 at 11:53:48AM +0000, Patrick DELAUNAY wrote:
> > Hi Tom,
> >
> > > From: Patrice CHOTARD <patrice.chotard@st.com>
> > > Sent: mercredi 27 novembre 2019 10:12
> > >
> > > In reserve_bootstage(), in case size is odd, gd->new_bootstage is
> > > not aligned. In bootstage_relocate(), the platform hangs when
> > > getting access to data-
> > > >record[i].name.
> > > To avoid this issue, make gd->new_bootstage 16 byte aligned.
> > >
> > > To insure that new_bootstage is 16 byte aligned (at least needed for
> > > x86_64 and ARMv8) and new_bootstage starts down to get enough space,
> > > ALIGN_DOWN macro is used.
> > >
> > > Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")
> > >
> > > Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> > > Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
> > > Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
> > >
> >
> > Do you plan to merge this fixe for the next rc for v2020.01 ?
> > Or do you expect some change / review.
> >
> > This patch is mandatory for stm32mp1 (ARM plaform with bootstage
> > feature activated).
> > Without this patch, the boot failed (at least for v2020.01-rc3 : crash
> > has struct pointer new_bootstage is not aligned).
> >
> > Or I will deactivate the BOOTSTAGE feature...
> =

> I think at this point I would prefer dropping BOOTSTAGE from those boards=
 for
> the release.  There's already been more than one "I think this is safe" f=
ollowed by
> "this broke ..." changes I've tried.  Sorry!

I know the number of issue with  "it should work".... and I understood.
I sill push a patch to deactivate bootstatge (remove 2 "imply" in fact) and=
 a new pull request.


> --
> Tom

BR
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
