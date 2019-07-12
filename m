Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5979166C5B
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:17:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B405C06B6E
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:17:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF7DAC06B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:17:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CC6YNR003383; Fri, 12 Jul 2019 14:17:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8VGl8NovBSMpN5sfiZohftGRbAva5TWdWVpFPWMcVeY=;
 b=XY3Va+xMCvN8NB6NxcxhGU5AoEGomDvNzlqm5loP3/VqbSzDvEcM11NgJgidfBk3cgpn
 Het09TySqO3KXiiin8eeaebuNd5MMh3mPCeolcPEDGbhEaqiEDzI4jDi9UnV7WTnhkKu
 PDT6pnQ3WUhwCAzkbEpKxvZl0RGUE952zK0mTQ+BVEBkm0mqoZJz7gQsVnJXNrCze/sb
 n6V98H1ZVfFEGMGa2N/fo1nqR869JbpvQoyd+ymnhEiXziMaRJE26O5S1p6HUYG1k2Ul
 Sl9MIyTaVUWI48xWWjBUsGSshV9ZXcmW2It/aAoThNk6+S6a+usT2zn0j3vc3Y35h9Eg eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tmh51r88q-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:17:40 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2653131;
 Fri, 12 Jul 2019 12:17:40 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1316E2B8D;
 Fri, 12 Jul 2019 12:17:40 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 14:17:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:17:39 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 10/16] stm32mp1: key: add stm32key command
Thread-Index: AQHVM0U0Nh24Q3daf0Ok9TIVJm+F+abG8PiQ
Date: Fri, 12 Jul 2019 12:17:39 +0000
Message-ID: <74b7fd93c5dd4fffbf98235058328a9c@SFHDAG6NODE3.st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
 <1562340023-8516-11-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1562340023-8516-11-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 10/16] stm32mp1: key: add stm32key
	command
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
> Sent: vendredi 5 juillet 2019 17:20
> 
> Add dedicated command to register in fuse a public hash key provided by keygen
> tool.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2: None
> 
>  arch/arm/mach-stm32mp/Kconfig        |   8 +++
>  arch/arm/mach-stm32mp/Makefile       |   1 +
>  arch/arm/mach-stm32mp/cmd_stm32key.c | 101
> +++++++++++++++++++++++++++++++++++
>  3 files changed, 110 insertions(+)
>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32key.c
> 

Applied to u-boot-stm32/master, thanks!

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
