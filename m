Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 790CF218E73
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jul 2020 19:41:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E27EC36B2A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jul 2020 17:41:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42172C36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2020 17:41:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 068HNwCg005666; Wed, 8 Jul 2020 19:41:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=1HtayS1FtH1nUvXapNd/V7Bu50/7kumyVX/GFLTzMvs=;
 b=W6DpZPyAt4pdekFTyzYKEgdfO9bFQW00zAOoip7w2Cp6DwbF+XVMLOBDCQHIELgshPEY
 ZIWwjbzUPpfdpLk98BWTqziX5LJf9ZMFaHrv26trenc0eTeMq6FXtZVG2dUWX/kxhti9
 OeIJPJV6oXtMR7K1wMnmE7AYfeO4e8KHWc3955Qe1NLZxAzcWKNVrB7gQOHS8t4M7wOa
 CbNDhyRIzWeA1F1TV5/rXtLuran8peNk5q7VF7/HAg9BqGC/wdu8rXs5IOA4lN9StVbm
 fsrvGzmzYFTv1w1oIp2fgr4onihadrv0GeALzuzshPz38kyCi4+TusLrywq96Ve+tPqf Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322gnfrntg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 19:41:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7128910002A;
 Wed,  8 Jul 2020 19:41:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60E512CBB9D;
 Wed,  8 Jul 2020 19:41:23 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 8 Jul
 2020 19:41:22 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 8 Jul 2020 19:41:22 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "hs@denx.de" <hs@denx.de>
Thread-Topic: [PATCH] i2c: stm32f7: SYSCFG Fast Mode Plus support for I2C
 STM32F7
Thread-Index: AQHWU4kEUlRCMnJnVUqtnMwnwCUA1qj7dCMAgAKAzXA=
Date: Wed, 8 Jul 2020 17:41:22 +0000
Message-ID: <c7b8b60768b14c97b842d1bcfdb02b40@SFHDAG6NODE3.st.com>
References: <20200706133132.1.Ib000bc59b2ad7201352c5a0a55ec6072221e1808@changeid>
 <8a1ecf55-a3df-eb9e-a5b2-f87d8b0c2a16@denx.de>
In-Reply-To: <8a1ecf55-a3df-eb9e-a5b2-f87d8b0c2a16@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_15:2020-07-08,
 2020-07-08 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] i2c: stm32f7: SYSCFG Fast Mode Plus
 support for I2C STM32F7
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

Hi Heiko

> From: Heiko Schocher <hs@denx.de>
> Sent: mardi 7 juillet 2020 07:21
> 
> Hello Patrick,
> 
> Am 06.07.2020 um 13:31 schrieb Patrick Delaunay:
> > Read SYSCFG bindings to set Fast Mode Plus bits if Fast Mode Plus
> > speed is selected.
> >
> > Handle the stm32mp15 specific compatible to handle FastMode+ registers
> > handling which is different on the stm32mp15 compared to the stm32f7
> > or stm32h7.
> > Indeed, on the stm32mp15, the FastMode+ set and clear registers are
> > separated while on the other platforms (F7 or H7) the control is done
> > in a unique register.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >   drivers/i2c/stm32f7_i2c.c | 74
> ++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 73 insertions(+), 1 deletion(-)
> 
> Just tried to apply your patch on current mainline, but this fails for me, reason is
> missing patch:
> 
> http://patchwork.ozlabs.org/project/uboot/patch/20200706112653.18951-2-
> patrick.delaunay@st.com/
> 
> So I add this patch also to my repo, if nobody has objections.

No objection for me (as u-boot stm32 custodians / shared with Patrice Chotard),
You can take the in tiny patch in your repo.

I delegate the serie to Patrice only to have a review before merge this serie in stm32 tree.
But he is in holiday... and I wait him for my next pull request (including this serie).
 
> Beside of this:
> 
> Reviewed-by: Heiko Schocher <hs@denx.de>

Thanks.
 
> Thanks!
> 
> bye,
> Heiko

Regards,
Patrick

> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
