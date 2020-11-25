Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DCE2C3EA2
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 12:00:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6E96C424AF;
	Wed, 25 Nov 2020 11:00:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6989C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 11:00:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0APAwH3D002910; Wed, 25 Nov 2020 12:00:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WQMe+ngWzpXPAEwxjJ3GoCn/MHIK2LXTO0oA5EM7HUs=;
 b=IctmkiBxb40uNlZgUU/aMwc59DugH+2vqyMZjrJzvri57D6Xx6b/MAm7N+7IdUY5fgy4
 GWEMgMdnIMB6XtD7eugGc+VDjxHiGfWI6geNuk5JX6nnAq4eF5HGNMkmIVqQGagRChz8
 qnuYVnNTnXhko0C0wIapHH9J6Sn28ZVLiYrMJB513qyu7WdUvgFTmlngzMmfKAr6NrJS
 TvpiaegMs/2PRMrpWcuDNRF2eY8t7T+/2/WBNGlRs0RMQ4tuvgRQA/h15us/C5sMbmng
 dr3SyhGCTlUIdjCviwr5Y4Nxhoh+IHwbojOuPGaN/ilQDjADwh/HDQgXGk1wb27D82TM Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05hdgse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 12:00:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ECA7610002A;
 Wed, 25 Nov 2020 12:00:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E14002383F0;
 Wed, 25 Nov 2020 12:00:31 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 12:00:31 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 12:00:31 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] pinctrl: stmfx: update pin name
Thread-Index: AQHWrQ/7cTPXdCHESkyAfeZDDE/a4anY2iHg
Date: Wed, 25 Nov 2020 11:00:31 +0000
Message-ID: <a0654b133b6c454999171c6d9b472bab@SFHDAG2NODE3.st.com>
References: <20201028095157.11327-1-patrick.delaunay@st.com>
 <20201028095157.11327-2-patrick.delaunay@st.com>
In-Reply-To: <20201028095157.11327-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_06:2020-11-25,
 2020-11-25 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] pinctrl: stmfx: update pin name
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

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mercredi 28 octobre 2020 10:52
> 
> Update pin name to avoid duplicated name with SOC GPIO
> gpio0...gpio15 / agpio0....agpio7: add a stmfx prefix.
> 
> This pin name can be used in pinmux command.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/pinctrl/pinctrl-stmfx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
