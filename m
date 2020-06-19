Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3D200A90
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 15:46:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9AF1C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 13:46:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 480D4C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 13:46:00 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JDjLVA025496; Fri, 19 Jun 2020 15:45:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GOCHhHytgGFhpgY7+dtoDNx18GLDD6y/UTpqqPWlixs=;
 b=TBB5shlIoBz2TS9ZZ6ahgON+mGjjVR5UHf2xzaNP/v/0Bd/qXcZjAAFZ01stI4wEdGSb
 rDgZyJKGmWCxsSZvzxHWlHzy9dlfa93Amq0vPP9PkkAC6fECmsgok3naBE0p736KnQaI
 AoQjxrvovlExz8lbYqzlXy7iU3dUFPY6LN8E1CQzTx7Xd9cozBHI9rA0JOTIcN+zDTNM
 kuuYe/piWthZONoTJYyiK5XTBcuiftVt2ODy7YNkxU309sidAdv5e6q35Wk9fwkRA6MZ
 pZKb7G1jz3SBOYvGfgyM/5sDUkXDkWew2uCn2kklSQEKIDOCydumrdSNPiSZu962cRj0 EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q6jms15y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 15:45:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C482810002A;
 Fri, 19 Jun 2020 15:45:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0F6820D3A3;
 Fri, 19 Jun 2020 15:45:57 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jun
 2020 15:45:57 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 19 Jun 2020 15:45:57 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] ARM: dts: stm32: Reinstate card detect behavior on ST
 boards
Thread-Index: AQHWRhrPVl0S5gfREUSEwn6OsnoyGajf8zUg
Date: Fri, 19 Jun 2020 13:45:57 +0000
Message-ID: <d6c6c20f5def4c00bb6e8d41ea14abca@SFHDAG6NODE3.st.com>
References: <20200619091945.11656-1-patrick.delaunay@st.com>
In-Reply-To: <20200619091945.11656-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_14:2020-06-19,
 2020-06-19 signatures=0
Cc: Marek Vasut <marex@denx.de>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Reinstate card detect
 behavior on ST boards
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
> Sent: vendredi 19 juin 2020 11:20
> 
> The cd-gpios with (GPIO_ACTIVE_LOW | GPIO_PULL_UP) gpio is thus far
> unsupported, reinstate the old cd-gpios behavior until this handling is fully
> implemented. This avoid potential issue for SDCard boot:
> the card detect fails with floating gpio.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 2 ++  arch/arm/dts/stm32mp157c-
> ed1-u-boot.dtsi | 2 ++
>  2 files changed, 4 insertions(+)
> 

Applied to u-boot-stm/master, thanks!

But I remove the Commit-note manually (error in patch sent with patman)

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
