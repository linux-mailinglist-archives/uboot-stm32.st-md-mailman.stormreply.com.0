Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EC6C1C9A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 10:12:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABA00C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 08:12:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A764C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 08:12:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8U8BJhj032299; Mon, 30 Sep 2019 10:12:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WCKQK6XBLP6yhzB9Z3aFNk032qCOZES2RK0s5PSrAZw=;
 b=0nxC7J2DSBhusHV+EnPaiqPytH/pFyKl76nYXoluYOvAcIyLT2SfUJ/hEW/QmVPT+hGe
 D5A5wYy4QbAc4BgRgBF2cYHtpZ97G8uszBuM8eCSRFNbbdPtYAu/uo2nGBhUQDAPNyTL
 6ehrVRQ+sw59BnE5OyLw9ZGvo0B2XiXrFerS6c8Edz9/ovma2y50jZU1VUKrQR8flokZ
 NSA9VWNbxFmS4hLd6u0HdIqog7Clbgobs5vI6HDo+PYHE+5wbXASkQdKBdsOIbyga+qj
 hAetLmD8GQjpw45eF4+vP8360oACK0SV0zRSueFQC/xsdmcaU3ZQfBKePwxOJtN4EuoZ nQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v9xdghdnt-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 30 Sep 2019 10:12:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1FDEA23;
 Mon, 30 Sep 2019 08:12:34 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 748092B1898;
 Mon, 30 Sep 2019 10:12:33 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Sep
 2019 10:12:33 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 30 Sep 2019 10:12:33 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [Uboot-stm32] [RESEND PATCH 1/2] dm: Tidy up dump output when
 there are many devices
Thread-Index: AQHVdNXkHAG7NaOBnEqDexYw0m+MAKdD43hA
Date: Mon, 30 Sep 2019 08:12:33 +0000
Message-ID: <0c8dcec3e6ae45c4bc11eb4bcaa4ea84@SFHDAG6NODE3.st.com>
References: <1564750081-31319-1-git-send-email-patrick.delaunay@st.com>
 <CAPnjgZ3Lj7Cj+OsVW6G8DDZwa0t6AuHdFXnJTybXrupK-UGMxw@mail.gmail.com>
In-Reply-To: <CAPnjgZ3Lj7Cj+OsVW6G8DDZwa0t6AuHdFXnJTybXrupK-UGMxw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_04:2019-09-25,2019-09-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, U-Boot Mailing
 List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [RESEND PATCH 1/2] dm: Tidy up dump output
	when	there are many devices
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

> To: Patrick DELAUNAY <patrick.delaunay@st.com>
> Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>; U-Boot
> 
> Hi Patrick,
> 
> On Fri, 2 Aug 2019 at 05:48, Patrick Delaunay <patrick.delaunay@st.com> wrote:
> >
> > At present the 'Index' column of 'dm tree' assumes there is two
> > digits, this patch increase it to 3 digits.
> >
> > It also aligns output of 'dm uclass', assuming the same 3 digits index.
> >
> > The boards with CONFIG_PINCTRL_FULL activated have one pinconfig by
> > pin configuration, so they can have more than 100 devices pinconfig
> > (for example with stm32mp157c-ev1 board we have
> > 106 pinconfig node).
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > stm32mp157c-ev1 trace before the patch
> >
> 
> This seems fine but it breaks the tests (make qcheck). Can you please fix that?

Sure, I will sent a v2 today

 
> Regards,
> Simon
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
