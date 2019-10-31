Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4073EEB30B
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2019 15:43:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF7ACC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2019 14:43:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B019DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2019 14:43:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9VEaoAg007500; Thu, 31 Oct 2019 15:43:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=HXn+HfUi9w6c5oGLv0fkQFY+6kbuZrmbttelW658sxg=;
 b=T6Q0E4/WgYU8Ny4VFGlf0laGnuGCKuCd5EeoMS1CKRSV2lgm2lJ+L5WysaVWdUPEHVkx
 APcXlvWHditG1hmwl0wFM6Lnna+7O7t/YECPAeuqwnVxrQoDpDDEuKbhejEZXiZk25Hy
 LKgh/WP3Y9JOnHpESuy+IaPT58Uc7JfdjizLaoazxBd6KhiicPxOIMQMv0kBi/OxeWiQ
 wP8k6Rzusop62HQ9tY4kHaIkKck4UEgS2PZ3QY1lhNNtm1qzb9ExtkRm5nsBwZIF+LUg
 SRiU13ytDVHO5Pqh6tQxgAjsBHgEO1J+LekLYNyZJEBuu5y96lSEwLDuqJKkLid0mKEN dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vxwf4aams-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 15:43:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BFA3C10002A;
 Thu, 31 Oct 2019 15:43:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3D6D2C284C;
 Thu, 31 Oct 2019 15:43:33 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 31 Oct
 2019 15:43:33 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 31 Oct 2019 15:43:33 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH 04/13] dm: pinctrl: migrate pinctrl-generic to livetree
Thread-Index: AQHViagQgrMdckqOtESy15cCq3bNCadyZBWAgAJ7mBA=
Date: Thu, 31 Oct 2019 14:43:33 +0000
Message-ID: <22091a9e55d64fb6964dad4c0d0a6730@SFHDAG6NODE3.st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-5-patrick.delaunay@st.com>
 <CAPnjgZ07D0E6WQJ9B2zfr7vHcP3tMw7twbdHZkTtcfGnHUDb9Q@mail.gmail.com>
In-Reply-To: <CAPnjgZ07D0E6WQJ9B2zfr7vHcP3tMw7twbdHZkTtcfGnHUDb9Q@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-31_06:2019-10-30,2019-10-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 04/13] dm: pinctrl: migrate
	pinctrl-generic to livetree
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

Hi Simon

> From: Simon Glass <sjg@chromium.org>
> Sent: mercredi 30 octobre 2019 02:48
> 
> Hi Patrick,
> 
> On Wed, 23 Oct 2019 at 07:45, Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> > Migrate pinctrl-generic to livetree:
> > - ofnode_get_first_property
> > - ofnode_get_next_property
> > - ofnode_get_property_by_prop
> > - ofnode_read_string_count
> > - ofnode_read_string_index
> > and get rid of DECLARE_GLOBAL_DATA_PTR.
> >
> > This solve parsing issue during test in sandbox for pin configuration
> > (OF_LIVE is activated in sandbox_defconfig and sub node are not
> > correctly parsed in pinctrl_generic_set_state_subnode with fdt lib
> > API).
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  drivers/pinctrl/pinctrl-generic.c | 36
> > +++++++++++++++----------------
> >  1 file changed, 17 insertions(+), 19 deletions(-)
> >
> 
> It looks like this should use dev_read_...() too.

Yes I miss it.

Thanks

 
> Regards,
> Simon

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
