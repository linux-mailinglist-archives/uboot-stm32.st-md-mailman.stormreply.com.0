Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6DD66EDB
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:41:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1DE1C06906
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:41:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4B44C06904
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:41:48 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CCab4c000900; Fri, 12 Jul 2019 14:41:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=AXdpO6KKYS9nDY1jaqiAiRFuKXfxwpi99/uAKw+ah7E=;
 b=APbh0rrAZS1/9IjXnGDLpEYUuV4eiSZMBirXfiOQvcwp7Ql5KNUuwcLeCnbT5TjXfaWa
 Uo+uw56xVy5hLo0d58XtXCHChljdNLS7dDjLXwsPShd0hHIKHV9bYpIB8Lp7Av2J1EO/
 0K7I+gu4R6YKi752NeB/6swNkiUON4aJ4/vt0G8GKYT28GZIUdlW1RiBaA1atfk0nY1r
 Eo3mahaeEobqb7m7ft+lExMgCfscFOFxk2I5I7nAIPAwIyYM72hEUGxIPzaiQzIZMubE
 qeVIACLVz5FxGffvtKXDnhdJK3JpoQ09CDY0v6JkL5KqzrUkhSLik1pn991NXPx4nUtY cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tpj3tk19n-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:41:46 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9040D3D;
 Fri, 12 Jul 2019 12:41:45 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A8922C1E;
 Fri, 12 Jul 2019 12:41:45 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 14:41:45 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:41:45 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/3] stm32mp1: add configuration op-tee
Thread-Index: AQHVMMj2vq3vbG78yEqqpG5ebMVlLqbG/JZg
Date: Fri, 12 Jul 2019 12:41:44 +0000
Message-ID: <af8e00ae9dd24f11b5666212c3fdf0c5@SFHDAG6NODE3.st.com>
References: <1562066767-8221-1-git-send-email-patrick.delaunay@st.com>
 <1562066767-8221-3-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1562066767-8221-3-git-send-email-patrick.delaunay@st.com>
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
Subject: Re: [Uboot-stm32] [PATCH 2/3] stm32mp1: add configuration op-tee
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
> Sent: mardi 2 juillet 2019 13:26
> 
> Add support of Trusted boot chain with OP-TEE
> - reserved 32MB at the end of the DDR for OP-TEE
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/mach-stm32mp/Kconfig     |  12 ++++-
>  board/st/stm32mp1/MAINTAINERS     |   1 +
>  board/st/stm32mp1/README          |  29 ++++++++---
>  board/st/stm32mp1/stm32mp1.c      |   4 +-
>  configs/stm32mp15_optee_defconfig | 103
> ++++++++++++++++++++++++++++++++++++++
>  include/configs/stm32mp1.h        |  13 +++++
>  6 files changed, 153 insertions(+), 9 deletions(-)  create mode 100644
> configs/stm32mp15_optee_defconfig
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
