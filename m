Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E7914853F
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 13:38:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA89EC36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 12:38:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E470C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 12:38:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OCcNkD027277; Fri, 24 Jan 2020 13:38:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=eRdn89/oisFrrrJWXGe0953TnY0oOodzCiZX52DvdbE=;
 b=n4726+CTPLZz61xeKy4AeTk9Hy2q9kZXzQ5ZoE7KX8A3k5zevcIiffaWQdwswScGRJSI
 5elHOElpVXpcHoqLtdCVjaZmiY2s6CQK7JNV4y97cZdiRvpe1ngJIDJmkUAyxugMKVsi
 twf1yn90MoDCsZLREEfW2ZQVLBzsmm0/WdjWM1OeCFvM62brCYDdoCSQBJG4cZ5WtZuX
 SuESCDM3sEehwj43a4z0Xj+QVD7RaLfOvsDxW8hTw+aWk6toJL2GY3vF/M0ItfN5kc4b
 1Pfq2Ke7XMA6JUR3h3xJG/7t8RChl9qQMoQXrgknyWvaAh4m6Zai1wSpep5fZRX/j4SF MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1eg07r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2020 13:38:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2A31100039;
 Fri, 24 Jan 2020 13:38:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E97A12A7707;
 Fri, 24 Jan 2020 13:38:41 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Jan
 2020 13:38:41 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 24 Jan 2020 13:38:41 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH V2] ARM: dts: stm32: Add DH Electronics DHCOM SoM and
 PDK2 board
Thread-Index: AQHV0KMryLx9QThJ9EOH4Im7yQ/I+Kf25pcggAHkwwCAAPjVYA==
Date: Fri, 24 Jan 2020 12:38:41 +0000
Message-ID: <fabceed13a8642a8b3c87c37c0cdc46c@SFHDAG6NODE3.st.com>
References: <20200121213843.96709-1-marex@denx.de>
 <09fea5052c6a48f7bc5353b5ce5ad884@SFHDAG6NODE3.st.com>
 <bda00092-eee5-9175-0c5c-f666d0797c5b@denx.de>
In-Reply-To: <bda00092-eee5-9175-0c5c-f666d0797c5b@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_03:2020-01-24,
 2020-01-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH V2] ARM: dts: stm32: Add DH Electronics
 DHCOM SoM and PDK2 board
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

Hi Marek

> From: Marek Vasut <marex@denx.de>
> Sent: jeudi 23 janvier 2020 23:45
> 
> On 1/23/20 10:57 AM, Patrick DELAUNAY wrote:
> > Hi Marek,
> 
> Hi,
> 
> >> From: Marek Vasut <marex@denx.de>
> >> Sent: mardi 21 janvier 2020 22:39
> >>
> >> Add support for DH Electronics DHCOM SoM and PDK2 rev. 400 carrier board.
> >> This is an SoM with STM32MP157C and an evaluation kit. The baseboard
> >> provides Ethernet, UART, USB, CAN and optional display.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> >> Cc: Patrice Chotard <patrice.chotard@st.com>
> >
> > Few remarks (see after) about
> > 1/ name of dts file (I prefer to don't add a file "-u-boot.dts") 2/
> > stusb1600 support (it seens that the PDK2 board hav no this USB type C
> > controller, so part of code can be dropped) 3/ ST board specific part
> > are not needed : OTP_BOARD / command stboard
> >
> > But anayway:
> >
> > Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> >
> > I propose something for the first point on the custodians git, branch "dh"
> > https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> >
> > see " fixup! ARM: dts: stm32: Add DH Electronics DHCOM SoM and PDK2
> > board" on dh branch
> 
> Did you verify that the generated DT is identical for U-Boot and SPL before and
> after this change ?

Yes => same dtb after the patch.

(I use "dtc -I dtb -O dts" on the generated files and I compare the dts file)
 
> > Are you are ok with this proposal ?
> >
> > In the same branch I propose 2 other modifications to reduce the size
> > of board.c (remove feature note needed).
> >
> > - remove stusb1600 support
> > - remove OTP_BOARD support and cmd_stboard
> 
> These two are OK, thanks.

You send a V3 ?

I can squash the 3 commit on the branch And I merge it like that....
Regards

> 
> --
> Best regards,
> Marek Vasut

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
