Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C35615760D
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 13:48:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F20E1C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 12:48:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E433CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 12:48:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AClfMp023751; Mon, 10 Feb 2020 13:48:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fuV+5h2kCx2zZMEibLhlLOBihv6f+hgFztU+yjimzAM=;
 b=xdqkmCWEwRxvrvPhAXNyqyH9KC4Ztcv314U8IRHZppN2Tw2zZAhPHzcCZ0xlPKUE9rqF
 w/eFbTjZQBa0z9h4lWZttt86UbgQYGhpxchF8UokgxUGKXTvGx01Ldxcbais5w7u3wUU
 dKQPx51Qq9lLwsMDqRXoAIt/5XEEH7auSZzjFdLKBI9JIEL7tNeLCQKOWrddm/u2TNJi
 RouUCkK+GiKClp1Rj8KcoiVRwLMxVNEM9Kk+dfKOhr1qxonFx2cesKpMvukUd+naUjUD
 WUvaSZQW+rk1JFL+2TKwoFfsajErKIteBWp6mAuQkdzsyMhRrwOpGC1+gjHjJKxUBmsG pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufgsvrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 13:48:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3ED5D10002A;
 Mon, 10 Feb 2020 13:48:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DDC42CB8A0;
 Mon, 10 Feb 2020 13:48:30 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 13:48:29 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 10 Feb 2020 13:48:29 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH 2/5] cmd: env: use ENV_IS_IN_DEVICE in env info
Thread-Index: AQHV0rKIGUBW/M/pikiBrLyr3G0bc6gCcMSAgBIJusA=
Date: Mon, 10 Feb 2020 12:48:29 +0000
Message-ID: <1cc23c3666a34fdd8ea832747b8cb455@SFHDAG6NODE3.st.com>
References: <20200124123346.32210-1-patrick.delaunay@st.com>
 <20200124123346.32210-2-patrick.delaunay@st.com>
 <CAPnjgZ0iAyDJhwo8Qnj7jWuzz-St1ors+Ap8p__Qjy8+2rCVyA@mail.gmail.com>
In-Reply-To: <CAPnjgZ0iAyDJhwo8Qnj7jWuzz-St1ors+Ap8p__Qjy8+2rCVyA@mail.gmail.com>
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
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/5] cmd: env: use ENV_IS_IN_DEVICE in env
	info
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
> Sent: jeudi 30 janvier 2020 03:18
> 
> On Fri, 24 Jan 2020 at 05:34, Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> > Use the define ENV_IS_IN_DEVICE to test if one the
> > CONFIG_ENV_IS_IN_...  is defined and correct the detection of
> > persistent storage support in the command "env info"
> > if CONFIG_ENV_IS_NOWHERE is activated.
> >
> > Since commit 60d5ed2593c9 ("env: allow ENV_IS_NOWHERE with other
> > storage target") test CONFIG_ENV_IS_NOWHERE is not enough; see also
> > commit 953db29a1e9c6 ("env: enable saveenv command when one
> > CONFIG_ENV_IS_IN is activated").
> >
> > This patch avoids issue for this command in stm32mp1 platform.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  cmd/nvedit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> We should add more tests for the environment functionality.

Sorry for the delay,

I need to activate a location in sandbox to test this feature....

I am working on a other serie for it (I am trying to add test for env in EXT4).

Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
