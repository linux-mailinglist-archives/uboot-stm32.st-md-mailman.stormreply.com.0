Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4471907E0
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:40:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18E81C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:40:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAFA2C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:40:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8clQX032674; Tue, 24 Mar 2020 09:40:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=4h6nDg+2ciVZT6ciYv6WJvtNzdFHyF2h9CVyITHyrFw=;
 b=x7bjqB5Z6BoRr16S7EleEKSc8hqzfWINUGqtcE91wep1Vln/wNw3HzpVLJECRUeTYsnm
 l4s/KojPoTMz5cmW1XIrvW8W//b5b9sw01GRaqQtENzGFCeLqIrHkrBe2/y+T5yfOjQP
 gjR7ouX7LgRbFtputoKa3jTJNOaDkmwuPFDdxIg9TMYMFI0i4334CVzrzRfDlF4rhLmZ
 YjFAe5N5en6tOIj1PMFsVBhLMTMPelTliew5DiwsAqYfDbgFDV/HW/2o9dA9GHiBK1PG
 K5eMm57Mak+wv1sZme3DLWOKz8fmrIihCymz0e+USOz+9zW/uLVLQYMhQtF+T4q0M3Yw zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw9jyxbar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:40:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34132100039;
 Tue, 24 Mar 2020 09:40:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2911C21F698;
 Tue, 24 Mar 2020 09:40:52 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 09:40:51 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:40:51 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp1: add 800 MHz profile support
Thread-Index: AQHV7I9JSBshfTyXfU2uY1TEVA1o96hXlnpQ
Date: Tue, 24 Mar 2020 08:40:51 +0000
Message-ID: <0d9f75e5607b4cb8929163fe2d6b91c1@SFHDAG6NODE3.st.com>
References: <20200226102643.11273-1-patrick.delaunay@st.com>
In-Reply-To: <20200226102643.11273-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_02:2020-03-23,
 2020-03-24 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: add 800 MHz profile support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mercredi 26 f=E9vrier 2020 11:27
> =

> The STM32MP1 series is available in 3 different lines which are pin-to-pin
> compatible:
> - STM32MP157: Dual Cortex-A7 cores, Cortex-M4 core @ 209 MHz,
>               3D GPU, DSI display interface and CAN FD
> - STM32MP153: Dual Cortex-A7 cores, Cortex-M4 core @ 209 MHz
>               and CAN FD
> - STM32MP151: Single Cortex-A7 core, Cortex-M4 core @ 209 MHz
> =

> Each line comes with a security option (cryptography & secure boot) & a C=
ortex-A
> frequency option :
> =

> - A : Cortex-A7 @ 650 MHz
> - C : Secure Boot + HW Crypto + Cortex-A7 @ 650 MHz
> - D : Cortex-A7 @ 800 MHz
> - F : Secure Boot + HW Crypto + Cortex-A7 @ 800 MHz
> =

> This patch adds the support of STM32MP15xD and STM32MP15xF in U-Boot.
> =

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---


Applied to u-boot-stm/next, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
