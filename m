Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 300B866C5A
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:17:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0BFFC06B6B
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:17:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8C39C06B6A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:17:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CC5e5W011040; Fri, 12 Jul 2019 14:17:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=kprK3qJ2nG2v1OVvE0BAwhnQefueIktgmFnuG9zGR1w=;
 b=XDI2NEX+VGGJTKqnLt4UMmRz12RBrfnRbkgB/WK6lIuio6MTD+oY5vmyNZK4+1URwrFk
 jFEMgPBdlg60kNxa6q5EF0K8Q5pIAaNjNk0HdOBTONFK+HO8EvSFKiIMbxkvwtyOLxB+
 KRg7fVUHC8g1nKxurGcF8WzAQdHKI/aqFRqdsxegId1W3w4ogJvwDDfN2H+RL8xxZSHP
 ckwymkale4XLIH57DYCdc++b+yDGRe5FmvyYiQYFcO8ADZ4Z9MN8loPTQiSr0C3pl3vn
 une07uFc4zyXmj5NVTTl8/c5Ya1Pt4650Ski46WqQqY/kCu+vb/9iwvTvwbQVRmRda7O 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tpj3tjw9w-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:17:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5374231;
 Fri, 12 Jul 2019 12:17:19 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 404982B88;
 Fri, 12 Jul 2019 12:17:19 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 14:17:18 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:17:18 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 09/16] stm32mp1: add stboard command
Thread-Index: AQHVM0Uz767vFsorikquQxg9k0vZWqbG8Nmg
Date: Fri, 12 Jul 2019 12:17:18 +0000
Message-ID: <a9625858ee684fa5916bd3c114b71a96@SFHDAG6NODE3.st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
 <1562340023-8516-10-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1562340023-8516-10-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 09/16] stm32mp1: add stboard command
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
> Allow to update board identification in OTP 59.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2: None
> 
>  board/st/stm32mp1/Kconfig       |   7 ++
>  board/st/stm32mp1/Makefile      |   1 +
>  board/st/stm32mp1/cmd_stboard.c | 145
> ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 153 insertions(+)
>  create mode 100644 board/st/stm32mp1/cmd_stboard.c
> 

Applied to u-boot-stm32/master, thanks!

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
