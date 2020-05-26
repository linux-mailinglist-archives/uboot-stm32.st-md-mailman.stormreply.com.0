Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0021E26EA
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 May 2020 18:27:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3AD4C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 May 2020 16:27:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DFF3C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 16:27:47 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04QGM6V0001898; Tue, 26 May 2020 18:27:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=7RIdYawXDysh96KfSAjHdw1Tc5sE6uy6Gn6g0GhJ+qU=;
 b=m2DgZixFNxIi6S6vUTNSolaWWL8ooppUapCmpYBJWehIwKcqY8EzoLDkHYF9uwVBn4p1
 /ZV+bAZBhEZmSdYqyDcQL0/2DsFXkt3zqnVHGIeiCJwwttlmXwtg8JS9PjSafUItb/l1
 p2MGR5kDibFMIFGDHUjkrHiEIEvFL7ymXb5E1RGLVoZXmglqFo8DPXJzC1LqjPAmq3tj
 fk8f9vlBwHA3OOTpsubxQIaXKBQ+0b9GH/yfPY4+K/ObxOmAvMh4/QxD2lKUkdJ7A5EA
 kMM20IRf4bNOIVTOvTd0v4Ou2Lu/BMfwwuA66JMThNsTflJAqDSLPdd1gHa/qytSlF8a PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316skw8uc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 18:27:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80E2310002A;
 Tue, 26 May 2020 18:27:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7548B2BA73D;
 Tue, 26 May 2020 18:27:43 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 May
 2020 18:27:43 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 26 May 2020 18:27:43 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] doc: log: correct option name CONFIG_LOG_MAX_LEVEL
Thread-Index: AQHWM0LA5+v+qrCRu0+9Dgdl37/x2Ki6QVoAgABL1CA=
Date: Tue, 26 May 2020 16:27:43 +0000
Message-ID: <864a2fea68f9458d8615023a97748f2b@SFHDAG6NODE3.st.com>
References: <20200526094802.10927-1-patrick.delaunay@st.com>
 <1be86021-f763-d969-fa8f-6efae454d7cf@gmx.de>
In-Reply-To: <1be86021-f763-d969-fa8f-6efae454d7cf@gmx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-26_02:2020-05-26,
 2020-05-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] doc: log: correct option name
	CONFIG_LOG_MAX_LEVEL
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

> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Sent: mardi 26 mai 2020 15:51
> 
> On 26.05.20 11:48, Patrick Delaunay wrote:
> > Replace CONFIG_(SPL_)MAX_LOG_LEVEL by the correct name as defined in
> > common/Kconfig:
> > line 668:config LOG_MAX_LEVEL
> > line 688:config SPL_LOG_MAX_LEVEL
> > line 708:config TPL_LOG_MAX_LEVEL
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> 
> > ---
> >
> >  doc/README.log | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/doc/README.log b/doc/README.log index
> > 1057981f45..170e4ba24e 100644
> > --- a/doc/README.log
> > +++ b/doc/README.log
[...]
> >
> > -The above have SPL versions also, e.g. CONFIG_SPL_MAX_LOG_LEVEL.
> > +The above have SPL versions also, e.g. CONFIG_SPL_LOG_MAX_LEVEL.
> 
> Please mention TPL and CONFIG_TPL_LOG_MAX_LEVEL here too.

Yes, I prepare a V2.

Regards.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
