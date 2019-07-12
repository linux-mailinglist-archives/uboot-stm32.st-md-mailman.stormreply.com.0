Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B26C66D61
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:30:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AFACD3FD57
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:30:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F90FD3FD56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:30:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CCLWF2022195; Fri, 12 Jul 2019 14:30:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=s/t9eXk7ZXaPOiHoRpY2vDZa00W8biq+jqtkqVwuChY=;
 b=DgXCPC3UCsEbgk671YEX+wr/KC+Xew0EaPsrI4sw2iBXPZkjcQZzgCBvlfIy40UNtyFb
 rfC5HU2kscR48hf4VS8Xc/JqV7dlKOKy/EydGkUIXuJeTPohpEQsLbEpa3cp85GQMQct
 u/GpOHl7my7TXh9DPRvhrwB7JfBR070SQRdc2Lk+Q8HbPBqPU3DXWYkbH89ttxTxN1MK
 EQHUvmh1mbWx5DHDXPyb7WUy15mFMPxgb2o6aqQatmQxD8kt4wpPB5ZJYuRPIXKVVd1A
 6GViNq0Zm9r2E/XlF1Wj1Nzytj5stSn7TwDHMfi2d2BRZs+pjKR1CmySP2+6rnCAmAFP ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tpj3tjye5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:30:11 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1759438;
 Fri, 12 Jul 2019 12:30:11 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED6AA2BD0;
 Fri, 12 Jul 2019 12:30:10 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 14:30:10 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:30:10 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 16/16] ARM: dts: stm32mp1: sync device tree with
 v5.2-rc4
Thread-Index: AQHVM0U5vELPzVQMAUaA893BWkB1l6bG8wPw
Date: Fri, 12 Jul 2019 12:30:10 +0000
Message-ID: <28edbdca34ce4457a9e48cb79c298ec2@SFHDAG6NODE3.st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
 <1562340023-8516-17-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1562340023-8516-17-git-send-email-patrick.delaunay@st.com>
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
 Tom Rini <trini@konsulko.com>, Albert Aribaud <albert.u.boot@aribaud.net>
Subject: Re: [Uboot-stm32] [PATCH v2 16/16] ARM: dts: stm32mp1: sync device
 tree with v5.2-rc4
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
> Synchronize device tree with v5.2-rc4 label and update the associated u-boot dtsi.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2:
> - missing alignment on ethernet@5800a000
> - set ethernet0 phy-mode to "rgmii-id" for dk1
>   (needed modification not yet upstreamed)
> 
>  arch/arm/dts/stm32mp15-ddr.dtsi          |   2 +-
>  arch/arm/dts/stm32mp157-pinctrl.dtsi     | 270
> ++++++++++++++++++++++++++++++-
>  arch/arm/dts/stm32mp157-u-boot.dtsi      |  60 ++++---
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |   4 -
>  arch/arm/dts/stm32mp157a-dk1.dts         |  32 ++--
>  arch/arm/dts/stm32mp157c-dk2.dts         |   1 +
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi |  15 +-
>  arch/arm/dts/stm32mp157c-ed1.dts         | 205 +++++------------------
>  arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi |   3 -
>  arch/arm/dts/stm32mp157c-ev1.dts         |  12 +-
>  arch/arm/dts/stm32mp157c.dtsi            | 215 +++++++++++++++++-------
>  11 files changed, 541 insertions(+), 278 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
