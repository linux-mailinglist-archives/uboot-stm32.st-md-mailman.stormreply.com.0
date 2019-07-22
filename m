Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF156FFD9
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 14:37:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A19E6CD24D6
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 12:37:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBED1CD24D5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 12:37:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MCQxZN020490; Mon, 22 Jul 2019 14:37:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=cHU2XqYaBqr18wcH9n0DZjQuh7AOv89P67yAenO8gIU=;
 b=Q6MkF/oOoaycCq3B85acTG5jIVmXBmr5VPbyDEH/qzEFqasDiRRtG0bkcW58wkb40tG2
 RdgLalxPjnJ8G9zYz0POoful3j6ZAVhq0HVQI474YTkpUR2csud71DpYRo9peUEZcLX7
 P7WunU61zbj6Ai894Bl1wO14sHrS8m0j5j09DuNNcDgilaOmH+qVhl98R43r/lDHkZAC
 DIaMevp2gWOSGAJ5L6Z+DcOzHHaipuEwRaLilNjV7CDXsUTUacMKLTD6de9SYSHiyL+H
 u9LvkKmZQRykKGYgMh6jGnN1oX7uY/PkP6DIBn5pjnR0CfyhZKkaECGcaTFGW81R80WK EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ture1bn7h-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 14:37:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DF3A31;
 Mon, 22 Jul 2019 12:37:45 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 093442D04;
 Mon, 22 Jul 2019 12:37:45 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 22 Jul
 2019 14:37:44 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 22 Jul 2019 14:37:44 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>, "sjg@chromium.org" <sjg@chromium.org>
Thread-Topic: [PATCH v3 2/2] rtc: Add rtc driver for stm32mp1
Thread-Index: AQHVN8/uB0UIyF2HrUCG89uOikJvWqbWo9Nw
Date: Mon, 22 Jul 2019 12:37:44 +0000
Message-ID: <1d92e9d35b3f4aa3897e1c5b4340033d@SFHDAG6NODE3.st.com>
References: <20190711100338.1327-1-benjamin.gaignard@st.com>
 <20190711100338.1327-3-benjamin.gaignard@st.com>
In-Reply-To: <20190711100338.1327-3-benjamin.gaignard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_10:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 2/2] rtc: Add rtc driver for stm32mp1
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

> From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
> Sent: jeudi 11 juillet 2019 12:04
> 
> Add support of STM32MP1 rtc driver.
> Enable it for basic and trusted configurations.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 3:
> - release clock only on error cases.
> 
>  configs/stm32mp15_basic_defconfig   |   2 +
>  configs/stm32mp15_trusted_defconfig |   2 +
>  drivers/rtc/Kconfig                 |   6 +
>  drivers/rtc/Makefile                |   1 +
>  drivers/rtc/stm32_rtc.c             | 323
> ++++++++++++++++++++++++++++++++++++
>  5 files changed, 334 insertions(+)
>  create mode 100644 drivers/rtc/stm32_rtc.c
> 

Applied to u-boot-stm32/master, thanks!

But still errors because RTC year as only 2 digits in register (00-99 only =>> %100 is missing)
and U-Boot expect year with 4 digits (0000-9999) 
=> I will push a correction today.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
