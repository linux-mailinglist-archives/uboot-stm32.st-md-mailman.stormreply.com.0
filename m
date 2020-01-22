Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 545F6145743
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2020 14:57:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F716C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2020 13:57:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 683A9C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2020 13:57:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00MDsDc1029768; Wed, 22 Jan 2020 14:57:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9WSVcMdqoeVamS/B/lP6L/kNSMMJMa/z2TxFbO/I8NM=;
 b=Ug52NCFPyPq+VeNSRDPzY7H3a/Sv7iFhmIgRGjZ8v7sVnoihcSA5wAbWlij9ZSaNKnWG
 BT7YXus0CJXf8DE0cJ9SywZepmqopBZfhgKQMe84m+mgcSZldnEMaEXcQhHr+qCiz6Dh
 xgGlwosB4+zXueadLBq6wArYuDP8DquWQbN+Ff8xsaXgIJ+50Mi+BJALjYTCsLMCVBjt
 U7fuKDcpyW8ik+ppMb/KeRp3aLJhV08DDrgHrUbQTBOT03gLle7nnaVVe9PqzHaXwexB
 a3psb4N6w6P2Qi25WH+KmdoNioatFORSOXtwG6osel3ReZgU9b/cJsLOLTboIqo8pY3A WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrc54w47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 14:57:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00C5A100034;
 Wed, 22 Jan 2020 14:57:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E37A42C6A6E;
 Wed, 22 Jan 2020 14:57:18 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 Jan
 2020 14:57:18 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 22 Jan 2020 14:57:18 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>
Thread-Topic: [PATCH v3] board_f.c: Insure gd->new_bootstage	alignment
Thread-Index: AdXFUeZcON90i5hYRYmBZ1BXivHD+ABvtQJAAmX8KQAAILXY8A==
Date: Wed, 22 Jan 2020 13:57:18 +0000
Message-ID: <02292af001f047d1b71ce6dbc7afdbc6@SFHDAG6NODE3.st.com>
References: <ce453f43d50442a48588ba3a1004fd9b@SFHDAG6NODE3.st.com>
 <b781d83eb3ec445a882db1064573d38e@SFHDAG6NODE3.st.com>
 <20200121231812.GC26536@bill-the-cat>
In-Reply-To: <20200121231812.GC26536@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3] board_f.c: Insure
	gd->new_bootstage	alignment
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
> Sent: mercredi 22 janvier 2020 00:18
> =

> On Thu, Jan 09, 2020 at 05:23:51PM +0000, Patrick DELAUNAY wrote:
> > Hi,
> >
> > > From: Patrick DELAUNAY
> > > Sent: mardi 7 janvier 2020 13:07
> > >
> > > Hi Patrice and Tom
> > >
> > > > Sent: mercredi 18 d=E9cembre 2019 10:10
> > > >
> > > > Hi Simon,
> > > >
> > > > > From: Simon Glass <sjg@chromium.org>
> > > > > Sent: mardi 17 d=E9cembre 2019 16:46
> > > > >
> > > > > Hi Patrice,
> > > > >
> > > > > On Wed, 27 Nov 2019 at 02:11, Patrice Chotard
> > > > > <patrice.chotard@st.com>
> > > > wrote:
> > > > > >
> > > > > > In reserve_bootstage(), in case size is odd, gd->new_bootstage
> > > > > > is not aligned. In bootstage_relocate(), the platform hangs
> > > > > > when getting access to data->record[i].name.
> > > > > > To avoid this issue, make gd->new_bootstage 16 byte aligned.
> > > > > >
> > > > > > To insure that new_bootstage is 16 byte aligned (at least
> > > > > > needed for
> > > > > > x86_64 and ARMv8) and new_bootstage starts down to get enough
> > > > > > space, ALIGN_DOWN macro is used.
> > > > > >
> > > > > > Fixes: ac9cd4805c8b ("bootstage: Correct relocation
> > > > > > algorithm")
> > > > > >
> > > > > > Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> > > > > > Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
> > > > > > Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > > > > Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > >
> > > > For information, Patrice is absent for personal reason up to beginn=
ing next
> year.
> > > > Don't wait a fast answer.
> > > >
> > > > > For this patch I think it would be better to update
> > > > > reserve_fdt() to keep things aligned, assuming that is the proble=
m.
> > > >
> > > > I don't sure that solve the issue, for me the problem is only for
> > > > the bootstage struct (gd->bootstage) And
> > > > reserve_fdt() already alligne size on 32 bytes
> > > >
> > > > If I remember the Patrice analysis:
> > > >
> > > > 1- bootstage_get_size return a odd value (or at least not 16 bytes
> > > > aligned I don't remember).
> > > >
> > > > 2- In reserve_bootstage()
> > > > 	int size =3D bootstage_get_size();
> > > > 	gd->start_addr_sp -=3D size
> > > > 	=3D> it is a unaligned address even if gd->start_addr_sp is 32
> > > > bytes alligned
> > > >
> > > > 	gd->new_bootstage =3D map_sysmem(gd->start_addr_sp, size);
> > > > 	=3D> also unaligned
> > > >
> > > > 3- Then during relocation, in reloc_bootstage()
> > > > 	gd->bootstage =3D gd->new_bootstage;
> > > >
> > > >
> > > > 4- crash occur because in next bootstage function beaucse the
> > > > boostage address don't respect pointer to struct allignement...
> > > >
> > > > 	struct bootstage_data *data =3D gd->bootstage
> > > >
> > > >
> > > > > At some point we should also document that reservations must
> > > > > keep things aligned.
> > > > >
> > > > > Perhaps this should be handled by a separate function called
> > > > > from all these places, which subtracts gd->start_addr_sp and
> > > > > ensures 16-byte
> > > alignment.
> > > >
> > > > Yes that can be a improvement,  but perhaps ia a second step / seco=
nd
> serie....
> > > >
> > > > Do you think about a function called in all reversed_ functions
> > > > (when start_addr_sp is modified)...
> > > >
> > > > static int reserved_allign_check(void) {
> > > > 	/* make stack pointer 16-byte aligned */
> > > > 	if (gd->start_addr_sp & 0xf) {
> > > > 		gd->start_addr_sp -=3D 16;
> > > > 		gd->start_addr_sp &=3D ~0xf;
> > > > 	 }
> > > > }
> > > >
> > > > I prefer a function to reserved a size wich replace in any
> > > > reserve_ function  the line
> > > > :
> > > > 	gd->start_addr_sp -=3D ...
> > > >
> > > > /* reserve size and make stack pointer 16-byte aligned */  static
> > > > int reserve(size_t size) {
> > > > 	gd->start_addr_sp -=3D size;
> > > > 	/* make stack pointer 16-byte aligned */
> > > > 	gd->start_addr_sp =3D ALIGN_DOWN(gd->start_addr_sp, 16); }
> > > >
> > > > I think I will push it, when the patrice patch will be accepted.
> > >
> > > I am preparing this patch....
> > >
> > > Do you think it is ok to merge the Patrice v3 proposal first on
> > > master branch for
> > > v2020.04 release (he just align the reserved memory for bootstage),
> > > and after I make my patch (16-byte align all reserved area).
> > >
> > > or it is better to make a more generic patch v4 to replace the Patric=
e one.
> >
> > I push a  serie, with my proposal:
> > [3/3] board_f.c: Insure 16 alignment of start_addr_sp and reserved
> > memory
> >
> > http://patchwork.ozlabs.org/project/uboot/list/?series=3D152226
> >
> > As I found issue for ARM32 (I need to modify arch/arm/lib/crt0.S) I
> > think it is preferable that the Patrice Patch is merged in v2020.04, an=
d my serie
> can live  independently.
> > But I can also squash of the 2 series.
> =

> Sorry for the delay.  Yes, please put together a single series that takes=
 care of
> everything.  Thanks!

Done with serie =3D "Insure 16 alignment of reserved memory in board_f.c"

http://patchwork.ozlabs.org/project/uboot/list/?series=3D154685

I could merge the patches 1/4 and 4/4 if it is more clear.
 =

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
