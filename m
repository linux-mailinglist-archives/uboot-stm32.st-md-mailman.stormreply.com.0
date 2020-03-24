Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 104841907BE
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:35:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB9E1C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:35:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11AE0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:35:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8RdZX014874; Tue, 24 Mar 2020 09:35:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BJURsYCm+cUQcRatEQMIm6dJtt1P7FR0ZLrv6yw2/10=;
 b=1Z7Yxnn0h2MBCME/eWovX+o6Pw5KuMTBNFGUT8f8drLas8Z2zTgV6MLhMRMlGOLNMYUQ
 UYKLBI7C+GfRwvWM1yGgvIWmIa7bVyWkkiIxU9UzDLSu1LEWDoTi0DqCto4GxJIN6Rnd
 yLCQaBUm6N0ocD2+lbRenC6SZ91hUftNtGeTj9QjiZL9t+jByrgNJo4fie9YJpMpRv6q
 DJMCgU7MWlVk39FRo4gr8ISBp28t9JapFCHxu2u+w31b2Pa+dqTgA7J9repEhHKqrbGc
 aSnEBG1E1PICYK9yeKgh6WqyOZ2jBNWnReaZt+Jk70go1nmZdrk9ScjXHM4oRjvTQNtN dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw995ec8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:35:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F3D3110002A;
 Tue, 24 Mar 2020 09:35:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA51F21F690;
 Tue, 24 Mar 2020 09:35:46 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 09:35:46 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:35:46 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 04/10] arm: stm32mp: bsec: add permanent lock support in
 bsec driver
Thread-Index: AQHV4dOHhncr5ZipaEmGJiomYNKoRahXqpkA
Date: Tue, 24 Mar 2020 08:35:46 +0000
Message-ID: <0b30c5ce695b46ef9a4534730edf590a@SFHDAG6NODE3.st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-5-patrick.delaunay@st.com>
In-Reply-To: <20200212183744.5309-5-patrick.delaunay@st.com>
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
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Uboot-stm32] [PATCH 04/10] arm: stm32mp: bsec: add permanent
 lock support in bsec driver
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
> Sent: mercredi 12 f=E9vrier 2020 19:38
> =

> Add BSEC lock access (read / write) at 0xC0000000 offset of misc driver.
> The write access only available for Trusted boot mode, based on new SMC
> STM32_SMC_WRLOCK_OTP.
> =

> With the fuse command, the permanent lock status is accessed with
> 0x10000000 offset (0xC0000000 - 0x8000000 for OTP sense/program divided by
> u32 size), for example:
> =

> Read lock status of fuse 57 (0x39)
> =

>   STM32MP> fuse sense 0 0x10000039 1
> =

>   Sensing bank 0:
> =

>   Word 0x10000039: 00000000
> =

> Set permanent lock of fuse 57 (0x39)
> =

>   STM32MP> fuse prog 0 0x10000039 1
> =

>   Sensing bank 0:
> =

>   Word 0x10000039: 00000000
> =

> WARNING: the OTP lock is updated only after reboot
> =

> WARING: Programming lock or fuses is an irreversible operation!
>         This may brick your system.
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
