Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CECC2813A1
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 15:04:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3186AC424B3;
	Fri,  2 Oct 2020 13:04:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA48AC424B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 13:04:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 092D1geS011885; Fri, 2 Oct 2020 15:04:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Mi7i1YpyMAzwRjMAnlxJJShuybPFcB2M98mjkBr8O6M=;
 b=NDQwv/qQEjggOaE1OWX0L6BCE/yVlK7/zyxOL0HDMRwBEB5ZkpIIjAvQZzxQQuIos8iU
 xj2Fgd5Jihm8182pU5CC7Ce78Sph5l+txEa0klw3VuJkEjWDAioi8grcFuj80eAIaTMz
 Q0iQ0RvEZnQ4aNzFnj5WuNMm5A2aYqCgiLxWr0gX2+2b1hHqNKLN8AeyZpLIhH66J30v
 I+PrIp3WxCojANS7wJODZP36ooJQsmJ0EH/wPHyM0SSw3RU6/QQcAm2Olb7M0XoSNQA4
 4rQ2ty0DQL2KzluZCNdNBMumQSImyjTLrM73qJS6A9uz4WcLmyg/2CZqZ0LVtqMeqlGG /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33su40ag5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 15:04:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3CC4A10002A;
 Fri,  2 Oct 2020 15:04:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31E4D2C38A2;
 Fri,  2 Oct 2020 15:04:08 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 15:04:07 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 15:04:07 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] ARM: dts: stm32mp1: DT alignment with Linux kernel
 v5.9-rc4
Thread-Index: AQHWi/+Yy3Oe8DKcPk2TmaThNiJ4K6mEYBgw
Date: Fri, 2 Oct 2020 13:04:07 +0000
Message-ID: <98125bdca8614b3f85bbd0a89d900229@SFHDAG6NODE3.st.com>
References: <20200916080132.10369-1-patrick.delaunay@st.com>
In-Reply-To: <20200916080132.10369-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_06:2020-10-02,
 2020-10-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32mp1: DT alignment with
 Linux kernel v5.9-rc4
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
> Sent: mercredi 16 septembre 2020 10:02
> 
> DT alignment with Linux kernel v5.9-rc4 for the STM32MP15x soc device tree
> files and the STMicroelectronics boards device tree files.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/dts/stm32mp15-pinctrl.dtsi | 263 ++++++++++++++++++++++++++--
>  arch/arm/dts/stm32mp151.dtsi        |   4 +-
>  arch/arm/dts/stm32mp157a-dk1.dts    |   2 +
>  arch/arm/dts/stm32mp157c-dk2.dts    |  11 ++
>  arch/arm/dts/stm32mp157c-ed1.dts    |   4 +-
>  arch/arm/dts/stm32mp157c-ev1.dts    |  15 ++
>  arch/arm/dts/stm32mp15xx-dkx.dtsi   |  38 +++-
>  7 files changed, 318 insertions(+), 19 deletions(-)
> 

Applied to u-boot-stm/next, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
